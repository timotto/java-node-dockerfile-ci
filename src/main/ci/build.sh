#!/bin/sh -ex

cat \
  java-dockerfile-source/${java_dockerfile_path} \
  node-dockerfile-source/${node_dockerfile_path} \
  > java-node-dockerfile-build/Dockerfile
cat java-node-dockerfile-build/Dockerfile
