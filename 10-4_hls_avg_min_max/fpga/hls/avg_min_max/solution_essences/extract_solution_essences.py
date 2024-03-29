#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This works good in Vitis HLS 2023.1.1.
# This script copies the directives and reports from the Vitis HLS project to the git-controlled directory.

import argparse
import glob
import os
import pathlib
import shutil

def main():
    arg_parser = argparse.ArgumentParser(description='Extract the essences of the Vitis HLS project.')
    arg_parser.add_argument('project_name')
    vitis_hls_project_name = arg_parser.parse_args().project_name

    script_dir = pathlib.Path(os.path.dirname(os.path.realpath(__file__)))
    vitis_hls_project_dir = script_dir.parent.joinpath('vitis_hls_project', vitis_hls_project_name)

    # Enumerate all solution folders.
    solution_dirs_string = glob.glob(str(vitis_hls_project_dir.joinpath('solution*')))

    # Copy directives and reports.
    for solution_dir_string in solution_dirs_string:
        solution_dir = pathlib.Path(solution_dir_string)
        copy_directives_and_reports_script(script_dir, solution_dir)

    #print('done')

def copy_file_if_newer(src: pathlib.Path, dst: pathlib.Path):
    src_string = str(src); dst_string = str(dst)
    already_exist_q = os.path.isfile(dst_string)
    if (not already_exist_q) | (already_exist_q and src.stat().st_mtime - dst.stat().st_mtime > 1):
        shutil.copy2(src_string, dst_string)


def copy_directives_and_reports_script(script_dir:pathlib.Path, solution_dir: pathlib.Path):
    solution_name = solution_dir.name
    #print('processing ', solution_name)
    dst_solution_dir = script_dir.joinpath(solution_name)
    os.makedirs(str(dst_solution_dir), exist_ok=True)
    copy_file_if_newer(solution_dir.joinpath("directives.tcl"), dst_solution_dir.joinpath("directives.tcl")) # Copy the directive.
    copy_file_if_newer(solution_dir.joinpath("script.tcl"), dst_solution_dir.joinpath("script.tcl")) # Copy the project creation script.
    # Copy the synth report
    synth_rpt_files_string = glob.glob(str(solution_dir.joinpath('syn', 'report', '*.rpt')))
    os.makedirs(str(dst_solution_dir.joinpath('syn', 'report')), exist_ok=True)
    for synth_rpt_file in synth_rpt_files_string:
        copy_file_if_newer(pathlib.Path(synth_rpt_file), dst_solution_dir.joinpath('syn', 'report', os.path.basename(synth_rpt_file)))

if __name__ == "__main__":
    main()