#! /usr/bin/env zsh

# shorter python alias
command -v python3 > /dev/null 2>&1 && alias python=python3
command -v pip3 > /dev/null 2>&1 && alias pip=pip3

command -v ptpython > /dev/null 2>&1 && alias ptpython='ptpython --vi'
