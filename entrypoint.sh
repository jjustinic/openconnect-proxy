#!/bin/bash

set -euf -o pipefail

polipo proxyAddress=0.0.0.0 proxyPort=8123 socksParentProxy=localhost:1080 &

OPENCONNECT_PASSWORD_FILE=$(mktemp)
echo "${OPENCONNECT_PASSWORD}" > "${OPENCONNECT_PASSWORD_FILE}"
if [[ -n "${OPENCONNECT_PUSH:-}" ]]; then
    echo "${OPENCONNECT_PUSH}" >> "${OPENCONNECT_PASSWORD_FILE}"
fi

cat "${OPENCONNECT_PASSWORD_FILE}" | openconnect --script-tun --script "ocproxy -D 1080" --authgroup "${OPENCONNECT_GROUP}" -u "${OPENCONNECT_USER}" --passwd-on-stdin "${OPENCONNECT_HOST}"
