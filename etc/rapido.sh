#!/bin/bash

CONFIG_FILE="/etc/rapido/config.cfg"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found. Creating default."
    echo "default_setting=value" > "$CONFIG_FILE"
fi

# Read a value from the configuration file
source "$CONFIG_FILE"
echo "Default setting: $default_setting"
