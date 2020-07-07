export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if ! (echo $VIRTUAL_ENV | grep general3 > /dev/null)
then
  pyenv activate general3 || true >/dev/null 2>/dev/null # I guess this is already set sometimes and so it fails?
fi
