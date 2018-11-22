#!/bin/sh

set -e

IS_IGNORE_SERVER_CERT=${PLUGIN_IGNORE_SERVER_CERT:-$IGNORE_SERVER_CERT}
URL=${PLUGIN_URL:-$URL}
OURPUT_PATH=${PLUGIN_OUTPUT_PATH:-$OUTPUT_PATH}
USERNAME=${PLUGIN_USERNAME:-$USERNAME}
PASSWORD=${PLUGIN_PASSWORD:-$PASSWORD}

if [[ "${IS_IGNORE_SERVER_CERT}" == "true" ]]; then
  svn checkout ${URL} ${OURPUT_PATH} \
    --username ${USERNAME} \
    --password ${PASSWORD} \
    --no-auth-cache \
    --non-interactive \
    --trust-server-cert-failures=unknown-ca,cn-mismatch,expired,not-yet-valid,other
else
  svn checkout ${URL} ${OURPUT_PATH} \
    --username ${USERNAME} \
    --password ${PASSWORD} \
    --no-auth-cache \
    --non-interactive
fi
