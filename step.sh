#!/bin/bash

# Get the full path to Localazy JAR.
step_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
localazy_jar=$step_dir"/localazy.jar"

# Process inputs

if [ -z "${working_directory}" ]; then
  working_directory="."
fi

params="download"

if [ ! -z "${config_file}" ]; then
  params="$params -c $config_file"
fi

if [ ! -z "${key_file}" ]; then
  params="$params -k $key_file"
fi

if [ ! -z "${read_key}" ]; then
  params="$params -r $read_key"
fi

if [ ! -z "${write_key}" ]; then
  params="$params -w $write_key"
fi

if [ ! -z "${groups_list}" ]; then
  params="$params $groups_list"
fi

if [ ! -z "${custom_command}" ]; then
  params="$custom_command"
fi

# Switch to working directory.
cd working_directory

# Invoke Localazy CLI.
java -jar $localazy_jar $params
