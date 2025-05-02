#!/bin/bash

# === Config ===
PLUGIN_NAME="ap-mediation-sdk"
SDK_VERSION="2.0.2"
DEPENDENCY_GROUP="com.adpushup"
DEPENDENCY_ARTIFACT="apmediationsdk"
UNITY_PACKAGE_NAME="ApMediationSdk.unitypackage"

# === Clean previous assets ===
if [ -d "$PLUGIN_NAME/Assets" ]; then
  echo "🧹 Cleaning existing Assets folder..."
  rm -rf "$PLUGIN_NAME/Assets"
fi

# === Create folders ===
echo "📂 Creating folders..."
mkdir -p $PLUGIN_NAME/Assets/Plugins/Android
mkdir -p $PLUGIN_NAME/Assets/Scripts

# === dependencies.xml ===
cat > $PLUGIN_NAME/Assets/Plugins/Android/$PLUGIN_NAME-dependencies.xml <<EOF
<dependencies>
  <androidPackage spec="$DEPENDENCY_GROUP:$DEPENDENCY_ARTIFACT:$SDK_VERSION" />
</dependencies>
EOF

# === C# Wrapper ===
cat > $PLUGIN_NAME/Assets/Scripts/ApMediationSDK.cs <<EOF
using UnityEngine;

public static class ApMediationSDK {
    public static void EnableDebug(bool isEnabled) {
#if UNITY_ANDROID && !UNITY_EDITOR
        using (AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        using (AndroidJavaObject context = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity"))
        using (AndroidJavaClass sdkClass = new AndroidJavaClass("com.adpushup.apmediationsdk.ApMediationSdk")) {
            sdkClass.CallStatic("enableDebug", context, isEnabled);
        }
#endif
    }
}
EOF

# === README.md ===
cat > $PLUGIN_NAME/README.md <<EOF
# AdPushup Mediation SDK - Unity Plugin

Easily integrate AdPushup's Ap Mediation Adapter into your Unity games using Google AdMob.

---
## 📦 Installation

1. **Install Prerequisites**

   - [Google Mobile Ads Unity Plugin](https://developers.google.com/admob/unity/start)
   - [External Dependency Manager for Unity (EDM4U)](https://github.com/googlesamples/unity-jar-resolver)

2. **Import the Plugin**

   - Download the latest \`ApMediationSdk.unitypackage\` from Releases
   - In Unity: \`Assets > Import Package > Custom Package...\`
   - Select \`ApMediationSdk.unitypackage\` and import all

3. **Resolve Dependencies**

   - EDM4U will automatically detect the `*.dependencies.xml` file and fetch the required adapter (`com.adpushup:apmediationsdk:$SDK_VERSION`) from Maven Central.

---

## 🐞 Enable Debugging (Optional)

If you'd like to enable debug logging from AdPushup SDK, call:

\`\`\`csharp
ApMediationSDK.EnableDebug(true);
\`\`\`

Make sure to call this before initializing AdMob.

---

## ✅ Unity Compatibility

- Unity 2019.4+
- Android only (iOS Coming Soon)
- Requires Google Mobile Ads + EDM4U

---

## 🔧 Troubleshooting
If dependencies don't resolve automatically, go to:
Assets > External Dependency Manager > Android Resolver > Resolve

Make sure your project has internet access and gradle properly configured.

---

## 📁 Advanced

If you prefer manual setup instead of .unitypackage, you can copy the Assets/ folder into your Unity project directly.

---

EOF