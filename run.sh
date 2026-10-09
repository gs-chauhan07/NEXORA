#!/usr/bin/env bash
set -e

VERSION="1.0.1"
APP_NAME="NEXORA-${VERSION}-x86_64.AppImage"

INSTALL_DIR="$HOME/.local/opt/nexora"
APP="$INSTALL_DIR/$APP_NAME"

URL="https://github.com/gs-chauhan07/NEXORA/releases/download/v${VERSION}/${APP_NAME}"

mkdir -p "$INSTALL_DIR"

if [ ! -f "$APP" ]; then
    echo "=========================================="
    echo " NEXORA"
    echo "=========================================="
    echo "[+] Downloading NEXORA v${VERSION}..."

    curl -fL --progress-bar "$URL" -o "$APP"

    chmod +x "$APP"

    echo "[+] NEXORA downloaded."
fi

chmod +x "$APP"

echo "[+] Starting NEXORA v${VERSION}..."

exec "$APP" \
    --ozone-platform=x11 \
    --disable-gpu \
    --disable-gpu-compositing \
    --disable-software-rasterizer