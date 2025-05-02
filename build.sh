#!/bin/bash

# === Config ===
PLUGIN_NAME="ap-mediation-sdk"
UNITY_PACKAGE_NAME="ApMediationSdk.unitypackage"


# Load env vars from .env if it exists
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Build Unity Package
if command -v "$UNITY_EXECUTABLE" &> /dev/null; then
  echo "📦 Exporting UnityPackage..."
  "$UNITY_EXECUTABLE" -quit -batchmode -projectPath "$PLUGIN_NAME" \
    -exportPackage "Assets/Plugins/Android" "Assets/Scripts" "../$UNITY_PACKAGE_NAME"
  echo "✅ Exported: $UNITY_PACKAGE_NAME"
else
  echo "⚠️  Unity not found at: $UNITY_EXECUTABLE — skipping .unitypackage export."
fi