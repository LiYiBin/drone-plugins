#!/bin/sh

set -e

SOURCE_ENV_FILE=${PLUGIN_SOURCE_ENV_FILE:-$SOURCE_ENV_FILE}
TARGET_ENV_FILE=${PLUGIN_TARGET_ENV_FILE:-$TARGET_ENV_FILE}

echo --- Start: ENV Replacer $(date +'%Y/%m/%d %H:%M:%S')

# validate variables
if [[ -z "$SOURCE_ENV_FILE" || -z "$TARGET_ENV_FILE" ]]; then
  echo 'You must have source_env_file AND target_env_file variables.'
  exit
fi

# copy env file
cp $SOURCE_ENV_FILE $TARGET_ENV_FILE

# filter enviroment variables
plugin_prefix=PLUGIN_ENV_
default_prefix=ENV_

if [ "$(printenv | grep ^$plugin_prefix)" ]; then
  envList=$(printenv | grep ^$plugin_prefix)
  prefix=$plugin_prefix
elif [ "$(printenv | grep ^$default_prefix)" ]; then
  envList=$(printenv | grep ^$default_prefix)
  prefix=$default_prefix
fi

# validate env list
if [ -z "$prefix" ]; then
  echo 'You do not have any environment variables.'
  exit
fi

for envItem in $envList; do
  envName="$(echo $envItem | awk -F= '$0=$1')"
  envKey=${envName#"$prefix"}

  envValue="$(echo $envItem | awk -F= '$0=$2')"

  echo --- Replace $envKey ---
  sed -i -- "s/${envKey}=.*/${envKey}=${envValue}/g" $TARGET_ENV_FILE
done

echo --- End: ENV Replacer $(date +'%Y/%m/%d %H:%M:%S')
