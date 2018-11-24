# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#--------------------------1.固定配置区------------------------------#
#--------------------------1.1混淆指令区------------------------------#
-optimizationpasses 5 # 指定代码的压缩级别
-dontusemixedcaseclassnames # 是否使用大小写混合,包名不混合大小写
-dontskipnonpubliclibraryclasses #是否混淆第三方jar,不去忽略非公共的库类
-dontpreverify # 混淆时是否做预校验
-ignorewarnings # 忽略警告，避免打包时某些警告出现
-dontskipnonpubliclibraryclassmembers
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod
-dontoptimize #不优化输入的类文件
-overloadaggressively #混淆时应用侵入式重载
-verbose # 混淆时是否记录日志
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*  # 混淆时所采用的算法

#---------------------------1.2默认保留区----------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.ActivityGroup{
    *;
}
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService

-dontwarn android.support.**
-keep class android.support.** { *; }
-keep interface android.support.** { *; }

-dontwarn android.support.v4.**
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }

-dontwarn android.support.v7.**
-keep class android.support.v7.** {*;}
-keep interface android.support.v7.** {*;}

-keep class * implements android.os.Parcelable {*;} #保持 Parcelable 不被混淆
-keep class * implements java.io.Serializable {*;} #保持Serializable 不被混淆
-keep class * implements java.lang.Runnable {*;}
-keep class * implements java.lang.Cloneable {*;}

-keep public class * extends android.view.** {*;}
-keep public class * implements android.view.** {*;}
-keep public class * implements java.util.Observer {*;}
-keep public class * extends android.widget.**{*;}
-keep public class * implements android.widget.** {*;}
-keep public class * implements android.os.** {*;}

-keepclasseswithmembernames class * { #保持 native 方法不被混淆
    native <methods>;
}

-keepclasseswithmembers class * { #保持自定义控件类不被混淆
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity { #保持自定义控件类不被混淆
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

#Javascript接口
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
#webview
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, jav.lang.String);
}
-keep class **.R$* {
 *;
}
-keepclassmembers class * {
    void *(**On*Event);
}

#---------------------------------2.2.实体类---------------------------------
#---------------------------------2.3与js互相调用的类------------------------

#---------------------------------2.4反射相关的类和方法-----------------------