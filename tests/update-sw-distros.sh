#!/bin/bash

# Usage: $0 <superbuild_tag> <initial_distro>
# Example: $0 v2020.08 2020.05

export SUPERBUILD_TAG=$1
export INITIAL_DISTRO=$2
export SUPERBUILD_RELEASES_PATH=/workspace/robotology-superbuild/releases
export SW_VERSIONING_TABLE_PATH=/workspace/documentation/docs/sw_versioning_table

rm -Rf /workspace/robotology-superbuild
git clone https://github.com/robotology/robotology-superbuild.git --depth 1 --branch ${SUPERBUILD_TAG} /workspace/robotology-superbuild

rm -Rf ${SW_VERSIONING_TABLE_PATH}
cd ../scripts/sw-distros
./update-sw-distros.rb