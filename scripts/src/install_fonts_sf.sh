#!/usr/bin/env bash

set -euo pipefail

# Set font path (adjust as needed)
FONT_PATH="${HOME}/.local/share/fonts/sf-pro-test"
SRC_DIR="${FONT_PATH}/src"

# Ensure font directory exists
echo "Creating font directories..."
mkdir -p "$SRC_DIR"
chmod 755 "$SRC_DIR"

# Download DMG file
# echo "Downloading SF Pro DMG..."
# curl -s -L "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg" \
# 	-o "${SRC_DIR}/SF-Pro.dmg"
#
# if [ ! -f "${SRC_DIR}/SF-Pro.dmg" ]; then
# 	echo "Error: Failed to download SF Pro DMG"
# 	exit 1
# fi
#
# Extract DMG file
echo "Extracting DMG file..."

7z x "${SRC_DIR}/SF-Pro.dmg" -o"${SRC_DIR}/" -y

# Extract Payload file (usually a .zip inside the DMG)
echo "Extracting Payload..."
7z x "${SRC_DIR}/SFProFonts/SF Pro Fonts.pkg"
7z x "${SRC_DIR}/SFProFonts.pkg/Payload"
7z x "${SRC_DIR}/Payload~"

# Copy OTF fonts to final destination
echo "Copying OTF fonts..."
mkdir -p "$FONT_PATH"

# Find and copy all .otf files from the expected location
if [ -d "${SRC_DIR}/SFProFonts/Library/Fonts" ]; then
	find "${SRC_DIR}/SFProFonts/Library/Fonts" -name "*.otf" -type f | while read -r font_file; do
		echo "Copying $(basename "$font_file")"
		cp "$font_file" "$FONT_PATH/"
		chmod 644 "${FONT_PATH}/$(basename "$font_file")"
	done
else
	# Alternative: try to find any .otf files in the extracted structure
	echo "Looking for OTF files in extracted contents..."
	find "${SRC_DIR}" -name "*.otf" -type f | while read -r font_file; do
		echo "Copying $(basename "$font_file")"
		cp "$font_file" "$FONT_PATH/"
		chmod 644 "${FONT_PATH}/$(basename "$font_file")"
	done
fi

# Verify fonts were copied
OTF_COUNT=$(find "$FONT_PATH" -name "*.otf" -type f | wc -l)
if [ "$OTF_COUNT" -eq 0 ]; then
	echo "Warning: No OTF fonts were copied to destination"
else
	echo "Successfully copied $OTF_COUNT OTF fonts to $FONT_PATH"
fi

echo "SF Pro font installation complete!"
