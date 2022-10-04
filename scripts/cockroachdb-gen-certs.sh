#!/usr/bin/env bash
set -eu

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

SCRIPT=$(get_abs_filename "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
COMMONPATH=$(dirname "$SCRIPTPATH")
ANSIBLEPATH="$(dirname ${SCRIPTPATH})/ansible"
PLAYBOOKPATH="${ANSIBLEPATH}/playbooks"

export ANSIBLE_CONFIG="${ANSIBLEPATH}/ansible.cfg"


ansible-playbook "${PLAYBOOKPATH}/cockroachdb/cockroachdb-create-cert.yaml"