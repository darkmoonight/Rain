# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Isar / community fork
-keep class isar.** { *; }
-keepclassmembers class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Keep native methods
-keepclassmembers class * {
  native <methods>;
}
