#!/bin/bash -x

git clean -ffdx

if [ -f ./composer.json ]; then
    composer install
fi

cp DockerFile ..
cp .dockerignore ..
