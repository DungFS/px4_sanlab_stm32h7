#!/bin/bash
# Installation script for sanlab_stm32h7 PX4 board support
# Usage: ./install_px4.sh <path-to-PX4-Autopilot>

if [[ $# != 1 ]]; then
  echo "USAGE: ./install_px4.sh <PX4-Autopilot full path, e.g. ~/PX4-Autopilot>"
  exit 1
fi

if [ ! -d "$1" ]; then
    echo "❌ Error: '$1' is not a valid directory."
    exit 1
fi

INSTALL_PATH=$(realpath -s "$1")
echo "📂 Using install path: $INSTALL_PATH"

# Ensure destination folder exists
mkdir -p "$INSTALL_PATH/boards/sanlab"

echo "📥 Copying sanlab/stm32h7 board files into PX4-Autopilot..."
cp -r PX4-Autopilot/boards/sanlab/stm32h7 "$INSTALL_PATH/boards/sanlab/"

echo "✅ Complete."
echo "You may now build PX4 using:"
echo "cd $INSTALL_PATH"
echo "make sanlab_stm32h7_default"
