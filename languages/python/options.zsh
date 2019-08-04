# prevent generation of .pyc files
export PYTHONDONTWRITEBYTECODE=1

# make Pipenv venvs in project root, not `$(pipenv --venv) || $WORKON_HOME`
# refs:
# - https://docs.pipenv.org/en/latest/advanced/#custom-virtual-environment-location
# - https://github.com/pypa/pipenv/issues/1049
export PIPENV_VENV_IN_PROJECT=1
