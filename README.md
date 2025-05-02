# AdPushup Mediation SDK - Unity Plugin

Easily integrate AdPushup's Ap Mediation Adapter into your Unity games using Google AdMob.

---
## 📦 Installation

1. **Install Prerequisites**

   - [Google Mobile Ads Unity Plugin](https://developers.google.com/admob/unity/start)
   - [External Dependency Manager for Unity (EDM4U)](https://github.com/googlesamples/unity-jar-resolver)

2. **Import the Plugin**

   - Download the latest `ApMediationSdk.unitypackage` from Releases
   - In Unity: `Assets > Import Package > Custom Package...`
   - Select `ApMediationSdk.unitypackage` and import all

3. **Resolve Dependencies**

   - EDM4U will automatically detect the  file and fetch the required adapter () from Maven Central.

---

## 🐞 Enable Debugging (Optional)

If you'd like to enable debug logging from AdPushup SDK, call:

```csharp
ApMediationSDK.EnableDebug(true);
```

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

