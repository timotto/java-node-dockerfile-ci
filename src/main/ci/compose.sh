#!/bin/sh -ex

combine() {
  cat \
    ${java_src}/${java_tag}/${dockerfile_path} \
    ${node_src}/${node_tag}/${dockerfile_path}
}

froms() { combine | grep ^FROM ; }

build() {
	froms | uniq
  echo ADD /REVISIONS /REVISIONS
	combine | grep -v ^FROM
}

revisions() { 
  while [ -n "$1" ]; do
    echo "$(git -C "$1" remote get-url origin) $(git -C "$1" rev-parse HEAD)"
    shift
  done
}

froms

if [ $(froms | uniq | wc -l) -ne 1 ]; then
  echo "Different base images, cannot combine:" 1>&2
  exit 1
fi

build > "${target}/Dockerfile"

revisions "${java_src}" "${node_src}" "$(dirname "$0")" > "${target}/REVISIONS"
