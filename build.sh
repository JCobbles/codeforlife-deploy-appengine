#!/bin/bash -ex

gem install sass --version 3.3.4
rbenv rehash
pip install git+https://github.com/PyGithub/PyGithub.git@ba50af5

pip install -t lib git+https://github.com/ocadotechnology/codeforlife-portal.git@beta_users 
pip install -t lib aimmo

python get_latest_aimmo_unity_release.py

rm -rf lib/pytz lib/pytz*.dist-info

./manage.py collectstatic --noinput
