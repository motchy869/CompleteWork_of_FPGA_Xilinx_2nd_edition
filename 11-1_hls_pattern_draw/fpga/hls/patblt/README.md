# README

## 1. directory structure

- vitis_hls_project:
  - Place the Vitis HLS project here. This folder is ignored by git.
- solution_essences:
  - Automatically maintained by the script described below.

## 2. How to collect solution essences

Run `solution_essences/extract_solution_essences.py`.
This script copies the directives and synthesis reports and project-recreation script from the Vitis HLS project to `solution_essences/`.
