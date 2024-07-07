#/bin/env bash

set -eux

FEDORA_VER="40"

TOPDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")"

mkdir -p SRPMS RPMS

podman run \
    --rm \
    --mount type=bind,source="${TOPDIR}/SRPMS",target="/home/builder/rpmbuild/SRPMS" \
    --mount type=bind,source="${TOPDIR}/RPMS",target="/home/builder/rpmbuild/RPMS" \
    --mount type=bind,source="${TOPDIR}",target="/kernel" \
    fedora:${FEDORA_VER} \
    /bin/bash -c \
    "/kernel/TOOLS/install-deps.sh && /kernel/TOOLS/download-kernel.sh && /kernel/TOOLS/build.sh -ba /kernel/SPECS/kernel.spec"