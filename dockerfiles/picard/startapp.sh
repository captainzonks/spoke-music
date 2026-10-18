#!/usr/bin/env sh
# shellcheck shell=sh
#
# Picard 3.x launcher for jlesage/baseimage-gui
# Invoked by /etc/services.d/app under s6-rc.
#
set -e

# Pin HOME inside /config so all user state lives on the mounted volume.
HOME=/config
export HOME

# Qt cache/runtime dirs need to be writable; baseimage-gui has /tmp tmpfs.
XDG_RUNTIME_DIR=/tmp/runtime-picard
export XDG_RUNTIME_DIR
mkdir -p "${XDG_RUNTIME_DIR}"
chmod 700 "${XDG_RUNTIME_DIR}"

exec /opt/picard/bin/picard --no-restore
