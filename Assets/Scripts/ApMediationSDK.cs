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
