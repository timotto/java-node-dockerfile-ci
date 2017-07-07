#!/bin/sh

git clone java-node-dockerfile-source updated-java-node-dockerfile-source
tar cC java-node-dockerfile-build . | tar xC updated-java-node-dockerfile-source
git -C updated-java-node-dockerfile-source \
add .
git -C updated-java-node-dockerfile-source \
-c user.name="${git_user}" \
-c user.email="${git_email}" \
commit \
  -q \
  -m "${commit_message}"
