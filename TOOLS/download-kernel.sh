#/bin/env bash

set -eux

TOPDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")"
SOURCEDIR="${TOPDIR}/SOURCES"
SPECDIR="${TOPDIR}/SPECS"

TARBALL=$(rpmspec --parse "${SPECDIR}/kernel.spec" | grep Source0 | cut -b 10-)

if [ ! -f "${SOURCEDIR}/${TARBALL}" ]; then
	wget -P ${SOURCEDIR} https://cdn.kernel.org/pub/linux/kernel/v6.x/${TARBALL}
else 
	echo "${TARBALL} already exists"
fi
