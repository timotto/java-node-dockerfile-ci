#!/bin/sh

build=updated-java-node-dockerfile-source

git clone java-node-dockerfile-source ${build}

tar cC java-node-dockerfile-build . | tar xC ${build}

git -C ${build} add .

git -C ${build} \
  -c user.name="${git_user}" \
  -c user.email="${git_email}" \
  commit \
    -q \
    -m "${commit_message}"
