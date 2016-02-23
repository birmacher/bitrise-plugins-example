#!/bin/bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while [ $# -gt 0 ]
do
  if [[ -z "${args}" ]] ; then
    args=$1
  else
    args=$args' '$1
  fi
  shift
done

echo
echo "Example plugin"
echo "  Plugin which demostrats how bitrise cli's plugin works"

echo
echo "This plugin runs from:"
echo "$THIS_SCRIPT_DIR"

echo
echo "This plugin was called with the following args:"
echo "$args"

echo
echo "Bitrise pass the following environments to this plugins:"
echo "BITRISE_PLUGIN_INPUT_PAYLOAD: $BITRISE_PLUGIN_INPUT_PAYLOAD"
echo "BITRISE_PLUGIN_INPUT_BITRISE_VERSION: $BITRISE_PLUGIN_INPUT_BITRISE_VERSION"
echo "BITRISE_PLUGIN_INPUT_TRIGGER: $BITRISE_PLUGIN_INPUT_TRIGGER"
echo "BITRISE_PLUGIN_INPUT_PLUGIN_MODE: $BITRISE_PLUGIN_INPUT_PLUGIN_MODE"
echo "BITRISE_PLUGIN_INPUT_DATA_DIR: $BITRISE_PLUGIN_INPUT_DATA_DIR"
