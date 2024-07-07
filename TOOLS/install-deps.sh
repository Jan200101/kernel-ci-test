#/bin/env bash

set -eux

TOPDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")"
SPECDIR="${TOPDIR}/SPECS"

dnf -y install rpm-build dnf-utils
dnf -y builddep "${SPECDIR}/kernel.spec"
