#!/usr/bin/env bash

set -euo pipefail

# Set font path (adjust as needed)
FONT_PATH="${HOME}/.local/share/fonts/maple-mono"

# Grab releases from GitHub API
echo "Fetching releases from GitHub..."
DOWNLOAD_URL=$(curl -s -H "Accept: application/vnd.github.v3+json" \
	https://api.github.com/repos/subframe7536/maple-font/releases/latest |
	jq -r '.assets[] | select(.name == "MapleMono-OTF.zip") | .browser_download_url')

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" = "null" ]; then
	echo "Error: Could not extract download URL from API response"
	exit 1
fi

echo "Download URL: $DOWNLOAD_URL"

# Ensure font directory exists
echo "Creating font directory: $FONT_PATH"
mkdir -p "$FONT_PATH"
chmod 755 "$FONT_PATH"

# Download and unzip
echo "Downloading and extracting font..."
TEMP_FILE=$(mktemp)
wget -nv -O "$TEMP_FILE" "$DOWNLOAD_URL"
unzip -q -o "$TEMP_FILE" -d "$FONT_PATH"

# Clean up
rm "$TEMP_FILE"
echo "Font installation complete!"
