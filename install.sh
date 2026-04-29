#!/bin/sh
set -e

REPO="LukFury/ium-releases"
BIN_DIR="${IUM_INSTALL_DIR:-/usr/local/bin}"

# Detect OS
OS=$(uname -s)
case "$OS" in
  Linux)  OS="linux"  ;;
  Darwin) OS="macos"  ;;
  *)
    echo "Unsupported OS: $OS"
    echo "Please download manually from https://github.com/$REPO/releases"
    exit 1
    ;;
esac

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
  x86_64)          ARCH="x86_64" ;;
  aarch64 | arm64) ARCH="arm64"  ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# Artifact name (tarball)
ARTIFACT="ium-${OS}-${ARCH}.tar.gz"

# Get latest release tag
echo "Fetching latest IUM release..."
LATEST=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
  | grep '"tag_name"' | head -1 | cut -d'"' -f4)

if [ -z "$LATEST" ]; then
  echo "Could not fetch latest release. Check your internet connection."
  exit 1
fi

URL="https://github.com/$REPO/releases/download/$LATEST/$ARTIFACT"

echo "Downloading IUM $LATEST for $OS/$ARCH..."
curl -fsSL "$URL" -o /tmp/ium.tar.gz

# Extract
cd /tmp
tar -xzf ium.tar.gz

chmod +x ium

# Install — try /usr/local/bin, fall back to ~/.local/bin
if [ -w "$BIN_DIR" ]; then
  sudo mv ium "$BIN_DIR/ium" 2>/dev/null || mv ium "$BIN_DIR/ium"
  echo "IUM $LATEST installed to $BIN_DIR/ium"
else
  FALLBACK="$HOME/.local/bin"
  mkdir -p "$FALLBACK"
  mv ium "$FALLBACK/ium"
  echo "IUM $LATEST installed to $FALLBACK/ium"
  echo ""
  echo "Make sure $FALLBACK is in your PATH:"
  echo "  export PATH=\"\$PATH:$FALLBACK\""
fi

# Remove macOS quarantine flag so Gatekeeper does not block the binary
if [ "$OS" = "macos" ]; then
  xattr -d com.apple.quarantine "$(command -v ium)" 2>/dev/null || true
fi

# Clean up
rm -f /tmp/ium.tar.gz

echo ""
echo "Run 'ium --help' to get started"
