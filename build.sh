#!/bin/bash -ex

gem install sass --version 3.3.4
rbenv rehash
pip install git+https://github.com/PyGithub/PyGithub.git@ba50af5

pip install -t lib codeforlife-portal aimmo

pushd django_site/lib/players/game_frontend
yarn
node djangoBundler.js
popd

python get_latest_aimmo_unity_release.py

rm -rf lib/pytz lib/pytz*.dist-info

./manage.py collectstatic --noinput
