#!/bin/sh -l

# first argument is the workspace relative directory or zip file to upload
# second argument is the user name to upload to
# third argument is the game name to upload to
# forth argument is the channel to upload to
# fifth argument is the butler api secret

set -e

export BUTLER_API_KEY=$5

echo "butler -V"
butler -V

echo "cd ${GITHUB_WORKSPACE}"
cd ${GITHUB_WORKSPACE}

echo "butler login"
butler login

echo "butler push $1 ${2}/${3}:${4}"
butler push $1 ${2}/${3}:${4}

echo "butler logout"
butler logout

echo "Done"