# Flutter (avoid broad io.flutter.** keep — it pulls Play Core deferred APIs into R8)
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugins.** { *; }

# Flutter embedding references Play Core splitinstall; app does not use deferred components.
-dontwarn com.google.android.play.core.**

# Isar / community fork
-keep class isar.** { *; }
-keepclassmembers class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Keep native methods
-keepclassmembers class * {
  native <methods>;
}
