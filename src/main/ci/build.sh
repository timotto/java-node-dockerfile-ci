#!/bin/sh -ex

froms=$(cat \
  ${java_src}/${java_tag}/${dockerfile_path} \
  ${node_src}/${node_tag}/${dockerfile_path} \
  | grep ^FROM \
  | uniq \
  | wc -l)

if [ $froms = 1 ]; then
  echo "FROM: $froms" 1>&2
else
  echo "Different base images, cannot combine:" 1>&2
  cat \
    ${java_src}/${java_tag}/${dockerfile_path} \
    ${node_src}/${node_tag}/${dockerfile_path} \
    | grep ^FROM \
    1>&2
fi

cat \
  ${java_src}/${java_tag}/${dockerfile_path} \
  ${node_src}/${node_tag}/${dockerfile_path} \
  > ${target}/Dockerfile
