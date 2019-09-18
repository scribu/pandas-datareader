#!/usr/bin/env bash

pip install pip --upgrade
pip install numpy=="$NUMPY" pytz python-dateutil coverage setuptools html5lib lxml pytest pytest-cov wrapt codecov coveralls beautifulsoup4 isort flake8

if (( $(echo "$TRAVIS_PYTHON_VERSION > 3.5" | bc -l) ));  then
  pip install black flake8-bugbear
fi

if [[ "$PANDAS" == "MASTER" ]]; then
  PRE_WHEELS="https://7933911d6844c6c53a7d-47bd50c35cd79bd838daf386af554a83.ssl.cf2.rackcdn.com"
  pip install --pre --upgrade --timeout=60 -f "$PRE_WHEELS" pandas
else
  pip install pandas=="$PANDAS"
fi

if [[ "$DOCBUILD" ]]; then
  pip install sphinx ipython matplotlib sphinx_rtd_theme doctr requests_cache
fi
