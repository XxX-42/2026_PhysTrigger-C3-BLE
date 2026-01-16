# Project Architecture: 2026_PhysTrigger-C3-BLE_v2

## Directory Tree (Filtered)
```text
2026_PhysTrigger-C3-BLE_v2/
├── .flutter-plugins-dependencies
├── .gitignore
├── .metadata
├── 2026_PhysTrigger-C3-BLE_v2_code_only.md
├── README.md
├── aggregate.py
├── analysis_options.yaml
├── app
│   ├── .gitignore
│   ├── build.gradle.kts
│   ├── proguard-rules.pro
│   └── src
│       ├── androidTest
│       │   └── java
│       │       └── com
│       │           └── example
│       │               └── myapplication
│       │                   └── ExampleInstrumentedTest.kt
│       ├── main
│       │   ├── AndroidManifest.xml
│       │   ├── java
│       │   │   └── com
│       │   │       └── example
│       │   │           └── myapplication
│       │   │               ├── MainActivity.kt
│       │   │               └── ui
│       │   │                   └── theme
│       │   │                       ├── Color.kt
│       │   │                       ├── Theme.kt
│       │   │                       └── Type.kt
│       │   └── res
│       │       ├── drawable
│       │       │   ├── ic_launcher_background.xml
│       │       │   └── ic_launcher_foreground.xml
│       │       ├── mipmap-anydpi-v26
│       │       │   ├── ic_launcher.xml
│       │       │   └── ic_launcher_round.xml
│       │       ├── mipmap-hdpi
│       │       │   ├── ic_launcher.webp
│       │       │   └── ic_launcher_round.webp
│       │       ├── mipmap-mdpi
│       │       │   ├── ic_launcher.webp
│       │       │   └── ic_launcher_round.webp
│       │       ├── mipmap-xhdpi
│       │       │   ├── ic_launcher.webp
│       │       │   └── ic_launcher_round.webp
│       │       ├── mipmap-xxhdpi
│       │       │   ├── ic_launcher.webp
│       │       │   └── ic_launcher_round.webp
│       │       ├── mipmap-xxxhdpi
│       │       │   ├── ic_launcher.webp
│       │       │   └── ic_launcher_round.webp
│       │       ├── values
│       │       │   ├── colors.xml
│       │       │   ├── strings.xml
│       │       │   └── themes.xml
│       │       └── xml
│       │           ├── backup_rules.xml
│       │           └── data_extraction_rules.xml
│       └── test
│           └── java
│               └── com
│                   └── example
│                       └── myapplication
│                           └── ExampleUnitTest.kt
├── build.gradle.kts
├── firmware
│   └── PhysTrigger_ESP32
│       ├── PhysTrigger_ESP32.ino
│       ├── SafetyMonitor.cpp
│       └── SafetyMonitor.h
├── gradle
│   ├── libs.versions.toml
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradle.properties
├── lib
│   ├── core
│   │   ├── core.dart
│   │   ├── exceptions
│   │   │   └── ble_exception.dart
│   │   ├── interfaces
│   │   │   └── i_ble_service.dart
│   │   ├── models
│   │   │   ├── ble_connection_state.dart
│   │   │   ├── ble_device.dart
│   │   │   └── ble_service_info.dart
│   │   ├── services
│   │   │   └── flutter_blue_plus_service.dart
│   │   ├── utils
│   │   │   ├── android_permissions.dart
│   │   │   ├── byte_utils.dart
│   │   │   └── result.dart
│   │   └── viewmodels
│   │       └── ble_controller_viewmodel.dart
│   ├── lib.md
│   ├── main.dart
│   └── ui
│       ├── screens
│       │   ├── control_screen.dart
│       │   ├── device_scan_page.dart
│       │   └── slider_control_page.dart
│       ├── ui.dart
│       └── widgets
│           ├── hold_action_button.dart
│           └── temperature_chart.dart
├── phys_trigger_ble.iml
├── pubspec.yaml
├── settings.gradle.kts
├── sketch_jan3a
│   └── sketch_jan3a.ino
└── test
    └── widget_test.dart
```

---

## File: .flutter-plugins-dependencies
```text
{"info":"This is a generated file; do not edit or check into version control.","plugins":{"ios":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_foundation-2.6.0\\\\","native_build":false,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_apple","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_apple-9.4.7\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"shared_preferences_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_foundation-2.5.6\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false}],"android":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_android","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_android-2.2.22\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_android","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_android-12.1.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"shared_preferences_android","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_android-2.4.18\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"macos":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_foundation-2.6.0\\\\","native_build":false,"dependencies":[],"dev_dependency":false},{"name":"shared_preferences_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_foundation-2.5.6\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false}],"linux":[{"name":"path_provider_linux","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_linux-2.2.1\\\\","native_build":false,"dependencies":[],"dev_dependency":false},{"name":"shared_preferences_linux","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_linux-2.4.1\\\\","native_build":false,"dependencies":["path_provider_linux"],"dev_dependency":false}],"windows":[{"name":"path_provider_windows","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_windows-2.3.0\\\\","native_build":false,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_windows","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_windows-0.2.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"shared_preferences_windows","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_windows-2.4.1\\\\","native_build":false,"dependencies":["path_provider_windows"],"dev_dependency":false}],"web":[{"name":"permission_handler_html","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_html-0.1.3+5\\\\","dependencies":[],"dev_dependency":false},{"name":"shared_preferences_web","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\shared_preferences_web-2.4.3\\\\","dependencies":[],"dev_dependency":false}]},"dependencyGraph":[{"name":"flutter_blue_plus","dependencies":[]},{"name":"path_provider","dependencies":["path_provider_android","path_provider_foundation","path_provider_linux","path_provider_windows"]},{"name":"path_provider_android","dependencies":[]},{"name":"path_provider_foundation","dependencies":[]},{"name":"path_provider_linux","dependencies":[]},{"name":"path_provider_windows","dependencies":[]},{"name":"permission_handler","dependencies":["permission_handler_android","permission_handler_apple","permission_handler_html","permission_handler_windows"]},{"name":"permission_handler_android","dependencies":[]},{"name":"permission_handler_apple","dependencies":[]},{"name":"permission_handler_html","dependencies":[]},{"name":"permission_handler_windows","dependencies":[]},{"name":"shared_preferences","dependencies":["shared_preferences_android","shared_preferences_foundation","shared_preferences_linux","shared_preferences_web","shared_preferences_windows"]},{"name":"shared_preferences_android","dependencies":[]},{"name":"shared_preferences_foundation","dependencies":[]},{"name":"shared_preferences_linux","dependencies":["path_provider_linux"]},{"name":"shared_preferences_web","dependencies":[]},{"name":"shared_preferences_windows","dependencies":["path_provider_windows"]}],"date_created":"2026-01-16 08:32:51.339192","version":"3.38.5","swift_package_manager_enabled":{"ios":false,"macos":false}}
```

---
## File: .gitignore
```text
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.build/
.buildlog/
.history
.svn/
.swiftpm/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins-dependencies
.pub-cache/
.pub/
/build/
/coverage/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

```

---
## File: .metadata
```text
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "f6ff1529fd6d8af5f706051d9251ac9231c83407"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: f6ff1529fd6d8af5f706051d9251ac9231c83407
      base_revision: f6ff1529fd6d8af5f706051d9251ac9231c83407
    - platform: windows
      create_revision: f6ff1529fd6d8af5f706051d9251ac9231c83407
      base_revision: f6ff1529fd6d8af5f706051d9251ac9231c83407

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'

```

---
## File: README.md
```md
# phys_trigger_ble

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```

---
## File: analysis_options.yaml
```yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer are surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options

```

---
## File: build.gradle.kts
```kts
// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.android) apply false
    alias(libs.plugins.kotlin.compose) apply false
}
```

---
## File: gradle.properties
```properties
# Project-wide Gradle settings.
# IDE (e.g. Android Studio) users:
# Gradle settings configured through the IDE *will override*
# any settings specified in this file.
# For more details on how to configure your build environment visit
# http://www.gradle.org/docs/current/userguide/build_environment.html
# Specifies the JVM arguments used for the daemon process.
# The setting is particularly useful for tweaking memory settings.
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
# When configured, Gradle will run in incubating parallel mode.
# This option should only be used with decoupled projects. For more details, visit
# https://developer.android.com/r/tools/gradle-multi-project-decoupled-projects
# org.gradle.parallel=true
# AndroidX package structure to make it clearer which packages are bundled with the
# Android operating system, and which are packaged with your app's APK
# https://developer.android.com/topic/libraries/support-library/androidx-rn
android.useAndroidX=true
# Kotlin code style for this project: "official" or "obsolete":
kotlin.code.style=official
# Enables namespacing of each library's R class so that its R class includes only the
# resources declared in the library itself and none from the library's dependencies,
# thereby reducing the size of the R class for that library
android.nonTransitiveRClass=true
```

---
## File: phys_trigger_ble.iml
```iml
<?xml version="1.0" encoding="UTF-8"?>
<module type="JAVA_MODULE" version="4">
  <component name="NewModuleRootManager" inherit-compiler-output="true">
    <exclude-output />
    <content url="file://$MODULE_DIR$">
      <sourceFolder url="file://$MODULE_DIR$/lib" isTestSource="false" />
      <sourceFolder url="file://$MODULE_DIR$/test" isTestSource="true" />
      <excludeFolder url="file://$MODULE_DIR$/.dart_tool" />
      <excludeFolder url="file://$MODULE_DIR$/.idea" />
      <excludeFolder url="file://$MODULE_DIR$/build" />
    </content>
    <orderEntry type="sourceFolder" forTests="false" />
    <orderEntry type="library" name="Dart SDK" level="project" />
    <orderEntry type="library" name="Flutter Plugins" level="project" />
    <orderEntry type="library" name="Dart Packages" level="project" />
  </component>
</module>

```

---
## File: pubspec.yaml
```yaml
name: phys_trigger_ble
description: "BLE Remote Control App for PhysTrigger hardware"
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ^3.5.0

dependencies:
  flutter:
    sdk: flutter

  # BLE Communication (supports Android, iOS, macOS, Windows, Linux)
  flutter_blue_plus: 1.34.5

  # Permission Handling
  # Required for Android 12+ runtime permissions
  permission_handler: ^11.3.0

  # State Management (optional, for ChangeNotifier)
  provider: ^6.1.0

  # Real-time Chart Visualization
  # For displaying temperature curves
  fl_chart: ^0.69.0
  
  # Local Storage for persisting last connected device
  shared_preferences: ^2.2.2

  # Cupertino Icons (iOS style)
  cupertino_icons: ^1.0.6
  flutter_blue_plus_windows: ^1.26.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true

  # Assets (if needed later)
  # assets:
  #   - assets/images/

```

---
## File: settings.gradle.kts
```kts
pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "My Application"
include(":app")

```

---
## File: app\.gitignore
```text
/build
```

---
## File: app\build.gradle.kts
```kts
plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
}

android {
    namespace = "com.example.myapplication"
    compileSdk {
        version = release(36)
    }

    defaultConfig {
        applicationId = "com.example.myapplication"
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    kotlinOptions {
        jvmTarget = "11"
    }
    buildFeatures {
        compose = true
    }
}

dependencies {
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.compose.ui.graphics)
    implementation(libs.androidx.compose.ui.tooling.preview)
    implementation(libs.androidx.compose.material3)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.compose.ui.test.junit4)
    debugImplementation(libs.androidx.compose.ui.tooling)
    debugImplementation(libs.androidx.compose.ui.test.manifest)
}
```

---
## File: app\proguard-rules.pro
```pro
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
```

---
## File: app\src\androidTest\java\com\example\myapplication\ExampleInstrumentedTest.kt
```kt
package com.example.myapplication

import androidx.test.platform.app.InstrumentationRegistry
import androidx.test.ext.junit.runners.AndroidJUnit4

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @Test
    fun useAppContext() {
        // Context of the app under test.
        val appContext = InstrumentationRegistry.getInstrumentation().targetContext
        assertEquals("com.example.myapplication", appContext.packageName)
    }
}
```

---
## File: app\src\main\AndroidManifest.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application
        android:allowBackup="true"
        android:dataExtractionRules="@xml/data_extraction_rules"
        android:fullBackupContent="@xml/backup_rules"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.MyApplication">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:label="@string/app_name"
            android:theme="@style/Theme.MyApplication">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

---
## File: app\src\main\java\com\example\myapplication\MainActivity.kt
```kt
package com.example.myapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.myapplication.ui.theme.MyApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            MyApplicationTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Greeting(
                        name = "Android",
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MyApplicationTheme {
        Greeting("Android")
    }
}
```

---
## File: app\src\main\java\com\example\myapplication\ui\theme\Color.kt
```kt
package com.example.myapplication.ui.theme

import androidx.compose.ui.graphics.Color

val Purple80 = Color(0xFFD0BCFF)
val PurpleGrey80 = Color(0xFFCCC2DC)
val Pink80 = Color(0xFFEFB8C8)

val Purple40 = Color(0xFF6650a4)
val PurpleGrey40 = Color(0xFF625b71)
val Pink40 = Color(0xFF7D5260)
```

---
## File: app\src\main\java\com\example\myapplication\ui\theme\Theme.kt
```kt
package com.example.myapplication.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext

private val DarkColorScheme = darkColorScheme(
    primary = Purple80,
    secondary = PurpleGrey80,
    tertiary = Pink80
)

private val LightColorScheme = lightColorScheme(
    primary = Purple40,
    secondary = PurpleGrey40,
    tertiary = Pink40

    /* Other default colors to override
    background = Color(0xFFFFFBFE),
    surface = Color(0xFFFFFBFE),
    onPrimary = Color.White,
    onSecondary = Color.White,
    onTertiary = Color.White,
    onBackground = Color(0xFF1C1B1F),
    onSurface = Color(0xFF1C1B1F),
    */
)

@Composable
fun MyApplicationTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    // Dynamic color is available on Android 12+
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }

        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        content = content
    )
}
```

---
## File: app\src\main\java\com\example\myapplication\ui\theme\Type.kt
```kt
package com.example.myapplication.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

// Set of Material typography styles to start with
val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        lineHeight = 24.sp,
        letterSpacing = 0.5.sp
    )
    /* Other default text styles to override
    titleLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 22.sp,
        lineHeight = 28.sp,
        letterSpacing = 0.sp
    ),
    labelSmall = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Medium,
        fontSize = 11.sp,
        lineHeight = 16.sp,
        letterSpacing = 0.5.sp
    )
    */
)
```

---
## File: app\src\main\res\drawable\ic_launcher_background.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="108"
    android:viewportHeight="108">
    <path
        android:fillColor="#3DDC84"
        android:pathData="M0,0h108v108h-108z" />
    <path
        android:fillColor="#00000000"
        android:pathData="M9,0L9,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,0L19,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M29,0L29,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M39,0L39,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M49,0L49,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M59,0L59,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M69,0L69,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M79,0L79,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M89,0L89,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M99,0L99,108"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,9L108,9"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,19L108,19"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,29L108,29"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,39L108,39"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,49L108,49"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,59L108,59"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,69L108,69"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,79L108,79"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,89L108,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M0,99L108,99"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,29L89,29"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,39L89,39"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,49L89,49"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,59L89,59"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,69L89,69"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M19,79L89,79"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M29,19L29,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M39,19L39,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M49,19L49,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M59,19L59,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M69,19L69,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
    <path
        android:fillColor="#00000000"
        android:pathData="M79,19L79,89"
        android:strokeWidth="0.8"
        android:strokeColor="#33FFFFFF" />
</vector>

```

---
## File: app\src\main\res\drawable\ic_launcher_foreground.xml
```xml
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:aapt="http://schemas.android.com/aapt"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="108"
    android:viewportHeight="108">
    <path android:pathData="M31,63.928c0,0 6.4,-11 12.1,-13.1c7.2,-2.6 26,-1.4 26,-1.4l38.1,38.1L107,108.928l-32,-1L31,63.928z">
        <aapt:attr name="android:fillColor">
            <gradient
                android:endX="85.84757"
                android:endY="92.4963"
                android:startX="42.9492"
                android:startY="49.59793"
                android:type="linear">
                <item
                    android:color="#44000000"
                    android:offset="0.0" />
                <item
                    android:color="#00000000"
                    android:offset="1.0" />
            </gradient>
        </aapt:attr>
    </path>
    <path
        android:fillColor="#FFFFFF"
        android:fillType="nonZero"
        android:pathData="M65.3,45.828l3.8,-6.6c0.2,-0.4 0.1,-0.9 -0.3,-1.1c-0.4,-0.2 -0.9,-0.1 -1.1,0.3l-3.9,6.7c-6.3,-2.8 -13.4,-2.8 -19.7,0l-3.9,-6.7c-0.2,-0.4 -0.7,-0.5 -1.1,-0.3C38.8,38.328 38.7,38.828 38.9,39.228l3.8,6.6C36.2,49.428 31.7,56.028 31,63.928h46C76.3,56.028 71.8,49.428 65.3,45.828zM43.4,57.328c-0.8,0 -1.5,-0.5 -1.8,-1.2c-0.3,-0.7 -0.1,-1.5 0.4,-2.1c0.5,-0.5 1.4,-0.7 2.1,-0.4c0.7,0.3 1.2,1 1.2,1.8C45.3,56.528 44.5,57.328 43.4,57.328L43.4,57.328zM64.6,57.328c-0.8,0 -1.5,-0.5 -1.8,-1.2s-0.1,-1.5 0.4,-2.1c0.5,-0.5 1.4,-0.7 2.1,-0.4c0.7,0.3 1.2,1 1.2,1.8C66.5,56.528 65.6,57.328 64.6,57.328L64.6,57.328z"
        android:strokeWidth="1"
        android:strokeColor="#00000000" />
</vector>
```

---
## File: app\src\main\res\mipmap-anydpi-v26\ic_launcher.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@drawable/ic_launcher_background" />
    <foreground android:drawable="@drawable/ic_launcher_foreground" />
    <monochrome android:drawable="@drawable/ic_launcher_foreground" />
</adaptive-icon>
```

---
## File: app\src\main\res\mipmap-anydpi-v26\ic_launcher_round.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@drawable/ic_launcher_background" />
    <foreground android:drawable="@drawable/ic_launcher_foreground" />
    <monochrome android:drawable="@drawable/ic_launcher_foreground" />
</adaptive-icon>
```

---
## File: app\src\main\res\values\colors.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="purple_200">#FFBB86FC</color>
    <color name="purple_500">#FF6200EE</color>
    <color name="purple_700">#FF3700B3</color>
    <color name="teal_200">#FF03DAC5</color>
    <color name="teal_700">#FF018786</color>
    <color name="black">#FF000000</color>
    <color name="white">#FFFFFFFF</color>
</resources>
```

---
## File: app\src\main\res\values\strings.xml
```xml
<resources>
    <string name="app_name">My Application</string>
</resources>
```

---
## File: app\src\main\res\values\themes.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>

    <style name="Theme.MyApplication" parent="android:Theme.Material.Light.NoActionBar" />
</resources>
```

---
## File: app\src\main\res\xml\backup_rules.xml
```xml
<?xml version="1.0" encoding="utf-8"?><!--
   Sample backup rules file; uncomment and customize as necessary.
   See https://developer.android.com/guide/topics/data/autobackup
   for details.
   Note: This file is ignored for devices older than API 31
   See https://developer.android.com/about/versions/12/backup-restore
-->
<full-backup-content>
    <!--
   <include domain="sharedpref" path="."/>
   <exclude domain="sharedpref" path="device.xml"/>
-->
</full-backup-content>
```

---
## File: app\src\main\res\xml\data_extraction_rules.xml
```xml
<?xml version="1.0" encoding="utf-8"?><!--
   Sample data extraction rules file; uncomment and customize as necessary.
   See https://developer.android.com/about/versions/12/backup-restore#xml-changes
   for details.
-->
<data-extraction-rules>
    <cloud-backup>
        <!-- TODO: Use <include> and <exclude> to control what is backed up.
        <include .../>
        <exclude .../>
        -->
    </cloud-backup>
    <!--
    <device-transfer>
        <include .../>
        <exclude .../>
    </device-transfer>
    -->
</data-extraction-rules>
```

---
## File: app\src\test\java\com\example\myapplication\ExampleUnitTest.kt
```kt
package com.example.myapplication

import org.junit.Test

import org.junit.Assert.*

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
class ExampleUnitTest {
    @Test
    fun addition_isCorrect() {
        assertEquals(4, 2 + 2)
    }
}
```

---
## File: firmware\PhysTrigger_ESP32\PhysTrigger_ESP32.ino
```ino
/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * PhysTrigger ESP32 BLE Reference Firmware
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * 
 * Purpose: Test/debug firmware for PhysTrigger Flutter BLE app
 * Library: NimBLE-Arduino (lighter & more stable than Bluedroid)
 * 
 * Install NimBLE:
 *   Arduino IDE: Sketch -> Include Library -> Manage Libraries -> "NimBLE-Arduino"
 *   PlatformIO: lib_deps = h2zero/NimBLE-Arduino@^1.4.0
 * 
 * Board Settings (ESP32-C3 example):
 *   - Board: ESP32C3 Dev Module
 *   - USB CDC On Boot: Enabled (for Serial output)
 *   - Flash Mode: QIO
 * 
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 */

#include <NimBLEDevice.h>

// ============================================================================
// BLE Configuration - MUST MATCH Flutter App (byte_utils.dart)
// ============================================================================

// Device name shown in scan results
#define DEVICE_NAME "PhysTrigger_Device"

// Service UUID - Used for scan filtering in Flutter
// Full 128-bit format required by BLE spec
// Short form: FFE0
#define SERVICE_UUID "0000FFE0-0000-1000-8000-00805F9B34FB"

// Characteristic UUID - The data channel for read/write
// Short form: FFE1
#define CHARACTERISTIC_UUID "0000FFE1-0000-1000-8000-00805F9B34FB"

// ============================================================================
// Hardware Configuration
// ============================================================================

// Onboard LED pin (varies by board)
// ESP32 DevKit: GPIO 2
// ESP32-C3: GPIO 8 (some boards), GPIO 2 (others)
// ESP32-S3: GPIO 48 (RGB) or check your board
#define LED_PIN 2

// ============================================================================
// Global Variables
// ============================================================================

NimBLEServer* pServer = nullptr;
NimBLECharacteristic* pCharacteristic = nullptr;
bool deviceConnected = false;
bool oldDeviceConnected = false;

// ============================================================================
// Server Callbacks - Connection Management
// ============================================================================

class ServerCallbacks : public NimBLEServerCallbacks {
  /**
   * Called when a client connects
   */
  void onConnect(NimBLEServer* pServer) override {
    deviceConnected = true;
    
    // Turn ON LED to indicate connection
    digitalWrite(LED_PIN, HIGH);
    
    Serial.println("════════════════════════════════════════");
    Serial.println("✓ Device Connected");
    Serial.println("════════════════════════════════════════");
  }

  /**
   * Called when a client disconnects
   * 
   * CRITICAL: Must restart advertising after disconnect!
   * Otherwise the device becomes invisible to scanners.
   */
  void onDisconnect(NimBLEServer* pServer) override {
    deviceConnected = false;
    
    // Turn OFF LED
    digitalWrite(LED_PIN, LOW);
    
    Serial.println("════════════════════════════════════════");
    Serial.println("✗ Device Disconnected");
    Serial.println("  Restarting advertising...");
    Serial.println("════════════════════════════════════════");
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // IMPORTANT: Restart advertising after disconnect
    // Without this, the device won't appear in scans!
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    NimBLEDevice::startAdvertising();
  }
};

// ============================================================================
// Characteristic Callbacks - Data Reception
// ============================================================================

class CharacteristicCallbacks : public NimBLECharacteristicCallbacks {
  /**
   * Called when the Flutter app writes data to FFE1
   * 
   * Data format from HoldActionButton:
   *   - Press:   [0x01] (or other command codes)
   *   - Release: [0x00] (stop command)
   */
  void onWrite(NimBLECharacteristic* pCharacteristic) override {
    // Get the raw data
    std::string value = pCharacteristic->getValue();
    
    if (value.length() > 0) {
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // Debug: Print received bytes in HEX format
      // This helps verify the Flutter app is sending
      // correct commands matching byte_utils.dart
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      Serial.print("Received: ");
      for (size_t i = 0; i < value.length(); i++) {
        uint8_t byte = (uint8_t)value[i];
        
        // Print in "0x01" format
        Serial.print("0x");
        if (byte < 0x10) Serial.print("0"); // Leading zero for single digits
        Serial.print(byte, HEX);
        
        if (i < value.length() - 1) Serial.print(" ");
      }
      Serial.println();
      
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // Command Logic - Match BleCommands in byte_utils.dart
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      uint8_t command = (uint8_t)value[0];
      
      switch (command) {
        case 0x00:
          Serial.println("  → ACTION: RELEASE (Stop)");
          // Add your motor/actuator stop logic here
          break;
          
        case 0x01:
          Serial.println("  → ACTION: PRESS (Forward)");
          // Add your motor forward logic here
          break;
          
        case 0x02:
          Serial.println("  → ACTION: PRESS (Backward)");
          // Add your motor backward logic here
          break;
          
        case 0x03:
          Serial.println("  → ACTION: PRESS (Left)");
          // Add your motor left logic here
          break;
          
        case 0x04:
          Serial.println("  → ACTION: PRESS (Right)");
          // Add your motor right logic here
          break;
          
        default:
          Serial.print("  → ACTION: UNKNOWN (");
          Serial.print(command);
          Serial.println(")");
          break;
      }
    }
  }
};

// ============================================================================
// Setup - Initialize BLE Server
// ============================================================================

void setup() {
  // Initialize Serial for debugging
  Serial.begin(115200);
  delay(1000); // Wait for serial monitor
  
  Serial.println();
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  Serial.println("  PhysTrigger BLE Reference Firmware");
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  Serial.print("  Device Name: ");
  Serial.println(DEVICE_NAME);
  Serial.print("  Service:     ");
  Serial.println(SERVICE_UUID);
  Serial.print("  Characteristic: ");
  Serial.println(CHARACTERISTIC_UUID);
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  
  // Initialize LED
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Initialize NimBLE
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  NimBLEDevice::init(DEVICE_NAME);
  
  // Optional: Set transmit power for better range
  // NimBLEDevice::setPower(ESP_PWR_LVL_P9); // Max power
  
  // Create BLE Server
  pServer = NimBLEDevice::createServer();
  pServer->setCallbacks(new ServerCallbacks());
  
  // Create Service with UUID matching Flutter app
  NimBLEService* pService = pServer->createService(SERVICE_UUID);
  
  // Create Characteristic with required properties:
  // - WRITE: Standard write with response (reliable)
  // - WRITE_NR (No Response): Fast write without confirmation
  // - NOTIFY: Server can push data to client
  pCharacteristic = pService->createCharacteristic(
    CHARACTERISTIC_UUID,
    NIMBLE_PROPERTY::WRITE |
    NIMBLE_PROPERTY::WRITE_NR |
    NIMBLE_PROPERTY::NOTIFY |
    NIMBLE_PROPERTY::READ
  );
  
  // Set callbacks for write events
  pCharacteristic->setCallbacks(new CharacteristicCallbacks());
  
  // Start the service
  pService->start();
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Start Advertising
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  NimBLEAdvertising* pAdvertising = NimBLEDevice::getAdvertising();
  
  // Add service UUID to advertisement so Flutter can filter by it
  pAdvertising->addServiceUUID(pService->getUUID());
  
  // Enable scan response for device name
  pAdvertising->setScanResponse(true);
  
  // Start advertising
  pAdvertising->start();
  
  Serial.println();
  Serial.println("✓ BLE Server started. Waiting for connections...");
  Serial.println();
}

// ============================================================================
// Main Loop
// ============================================================================

void loop() {
  // Handle connection state changes
  if (!deviceConnected && oldDeviceConnected) {
    // Just disconnected - give stack time to reset
    delay(500);
    oldDeviceConnected = deviceConnected;
  }
  
  if (deviceConnected && !oldDeviceConnected) {
    // Just connected
    oldDeviceConnected = deviceConnected;
  }
  
  // Optional: Blink LED slowly when waiting for connection
  if (!deviceConnected) {
    static unsigned long lastBlink = 0;
    if (millis() - lastBlink > 1000) {
      digitalWrite(LED_PIN, !digitalRead(LED_PIN));
      lastBlink = millis();
    }
  }
  
  delay(10); // Small delay to prevent watchdog issues
}

// ============================================================================
// TROUBLESHOOTING GUIDE
// ============================================================================
/*

┌─────────────────────────────────────────────────────────────────────────────┐
│ PlatformException(connect, status: 133) - Most Common Android BLE Error    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ Error 133 (GATT_ERROR) is a generic "something went wrong" error.          │
│ Common causes and solutions:                                                │
│                                                                             │
│ 1. DEVICE BONDING ISSUE                                                     │
│    • Go to Android Settings → Bluetooth → Paired Devices                    │
│    • Remove/Forget the ESP32 device                                         │
│    • Restart Bluetooth on phone                                             │
│    • Try connecting again                                                   │
│                                                                             │
│ 2. ESP32 NOT ADVERTISING                                                    │
│    • After disconnect, advertising must be restarted                        │
│    • This firmware handles it in onDisconnect()                             │
│    • If still an issue, power cycle the ESP32                               │
│                                                                             │
│ 3. TOO MANY CACHED CONNECTIONS                                              │
│    • Android caches BLE connections                                         │
│    • Clear Bluetooth cache:                                                 │
│      Settings → Apps → Bluetooth → Storage → Clear Cache                    │
│                                                                             │
│ 4. GATT SERVER BUSY                                                         │
│    • Add delay between rapid connect/disconnect cycles                      │
│    • Wait 500ms-1s before retrying connection                               │
│                                                                             │
│ 5. DISTANCE/SIGNAL ISSUE                                                    │
│    • Move phone closer to ESP32                                             │
│    • Increase TX power: NimBLEDevice::setPower(ESP_PWR_LVL_P9)              │
│                                                                             │
│ 6. FLUTTER APP DEBUG                                                        │
│    • Check Flutter console for detailed error messages                      │
│    • Verify UUIDs match exactly (case-insensitive)                          │
│    • Ensure characteristics are discovered before write                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│ How to Modify UUIDs for Different Hardware                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ To match a different BLE peripheral:                                        │
│                                                                             │
│ 1. Use a BLE scanner app (LightBlue, nRF Connect) to find the device        │
│                                                                             │
│ 2. Note down the Service UUID and Characteristic UUID                       │
│                                                                             │
│ 3. Update these files:                                                      │
│    • ESP32: Change SERVICE_UUID and CHARACTERISTIC_UUID above               │
│    • Flutter: Update BleUuids in lib/core/utils/byte_utils.dart             │
│                                                                             │
│ Common BLE Module UUIDs:                                                    │
│    HM-10:   FFE0 / FFE1 (default)                                           │
│    HC-08:   FFE0 / FFE1                                                     │
│    JDY-08:  FFE0 / FFE1                                                     │
│    Custom:  Use UUID generator (uuidgenerator.net)                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

*/

```

---
## File: firmware\PhysTrigger_ESP32\SafetyMonitor.cpp
```cpp
/**
 * @file SafetyMonitor.cpp
 * @brief Implementation of thermal safety protection for ESP32 heating vest
 */

#include "SafetyMonitor.h"

// ═══════════════════════════════════════════════════════════════════════════
// Constructor
// ═══════════════════════════════════════════════════════════════════════════

SafetyMonitor::SafetyMonitor()
    : _currentFault(SafetyFault::NONE)
    , _isSafe(true)
    , _highPowerStartTime(0)
    , _highPowerStartTemp(0.0f)
    , _inHighPowerMode(false)
{
    _tempHistory.reserve(MAX_HISTORY_SIZE);
}

// ═══════════════════════════════════════════════════════════════════════════
// Public Methods
// ═══════════════════════════════════════════════════════════════════════════

void SafetyMonitor::update(float temperature, uint8_t pwmPercent) {
    // Already faulted - require explicit reset
    if (!_isSafe) {
        return;
    }
    
    // Add new sample to history
    _addSample(temperature);
    
    // Prune old samples (keep 5 seconds of history)
    _pruneOldSamples();
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 1: Absolute temperature cutoff
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkOverTemp(temperature)) {
        _currentFault = SafetyFault::OVER_TEMP;
        _isSafe = false;
        Serial.printf("[SAFETY] FAULT: Over temperature! %.1f°C > %.1f°C\n", 
                      temperature, MAX_TEMP_CUTOFF);
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 2: Sensor disconnection (invalid reading)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkSensorDisconnected(temperature)) {
        _currentFault = SafetyFault::SENSOR_DISCONNECTED;
        _isSafe = false;
        Serial.printf("[SAFETY] FAULT: Sensor disconnected! %.1f°C invalid\n", 
                      temperature);
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 3: Rapid temperature change (acceleration protection)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkRapidTempChange()) {
        // Fault type determined inside the check
        _isSafe = false;
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 4: Heater fault (no temp rise despite high power)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkHeaterFault(pwmPercent, temperature)) {
        _currentFault = SafetyFault::HEATER_FAULT;
        _isSafe = false;
        Serial.println("[SAFETY] FAULT: Heater element failure detected!");
        return;
    }
}

bool SafetyMonitor::isSafe() const {
    return _isSafe;
}

SafetyFault SafetyMonitor::getFault() const {
    return _currentFault;
}

const char* SafetyMonitor::getFaultString() const {
    switch (_currentFault) {
        case SafetyFault::NONE:
            return "No fault";
        case SafetyFault::OVER_TEMP:
            return "Over temperature (>55°C)";
        case SafetyFault::SENSOR_DISCONNECTED:
            return "Temperature sensor disconnected";
        case SafetyFault::RAPID_TEMP_DROP:
            return "Rapid temperature drop (sensor detached?)";
        case SafetyFault::THERMAL_RUNAWAY:
            return "Thermal runaway detected";
        case SafetyFault::HEATER_FAULT:
            return "Heater element fault (no temp rise)";
        default:
            return "Unknown fault";
    }
}

void SafetyMonitor::reset() {
    _currentFault = SafetyFault::NONE;
    _isSafe = true;
    _tempHistory.clear();
    _highPowerStartTime = 0;
    _highPowerStartTemp = 0.0f;
    _inHighPowerMode = false;
    Serial.println("[SAFETY] Monitor reset");
}

float SafetyMonitor::getCurrentTemp() const {
    if (_tempHistory.empty()) {
        return NAN;
    }
    return _tempHistory.back().temperature;
}

float SafetyMonitor::getTempFromPast(float secondsAgo) const {
    unsigned long targetTime = millis() - (unsigned long)(secondsAgo * 1000);
    return _getTempAtTime(targetTime);
}

// ═══════════════════════════════════════════════════════════════════════════
// Private Methods
// ═══════════════════════════════════════════════════════════════════════════

void SafetyMonitor::_addSample(float temperature) {
    TempSample sample = {
        .temperature = temperature,
        .timestamp = millis()
    };
    
    // Circular buffer behavior
    if (_tempHistory.size() >= MAX_HISTORY_SIZE) {
        _tempHistory.erase(_tempHistory.begin());
    }
    
    _tempHistory.push_back(sample);
}

void SafetyMonitor::_pruneOldSamples() {
    unsigned long cutoffTime = millis() - HISTORY_DURATION_MS;
    
    // Remove samples older than 5 seconds
    while (!_tempHistory.empty() && _tempHistory.front().timestamp < cutoffTime) {
        _tempHistory.erase(_tempHistory.begin());
    }
}

bool SafetyMonitor::_checkOverTemp(float temperature) {
    return temperature > MAX_TEMP_CUTOFF;
}

bool SafetyMonitor::_checkSensorDisconnected(float temperature) {
    // NaN check
    if (isnan(temperature)) {
        return true;
    }
    
    // Invalid range check
    if (temperature < MIN_TEMP_VALID || temperature > 150.0f) {
        return true;
    }
    
    return false;
}

bool SafetyMonitor::_checkRapidTempChange() {
    // Need at least 2 samples to calculate rate of change
    if (_tempHistory.size() < 2) {
        return false;
    }
    
    unsigned long now = millis();
    unsigned long windowStart = now - DELTA_WINDOW_MS;
    
    // Get temperature from 2 seconds ago
    float tempThen = _getTempAtTime(windowStart);
    if (isnan(tempThen)) {
        return false; // Not enough history yet
    }
    
    float tempNow = _tempHistory.back().temperature;
    float delta = tempNow - tempThen;
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Rapid DROP: Sensor likely detached from skin
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (delta < -MAX_TEMP_DELTA_2S) {
        _currentFault = SafetyFault::RAPID_TEMP_DROP;
        Serial.printf("[SAFETY] FAULT: Rapid temp drop! %.1f°C in 2s\n", delta);
        return true;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Rapid RISE: Thermal runaway
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (delta > MAX_TEMP_DELTA_2S) {
        _currentFault = SafetyFault::THERMAL_RUNAWAY;
        Serial.printf("[SAFETY] FAULT: Thermal runaway! +%.1f°C in 2s\n", delta);
        return true;
    }
    
    return false;
}

bool SafetyMonitor::_checkHeaterFault(uint8_t pwmPercent, float temperature) {
    unsigned long now = millis();
    
    // Check if we're in high-power mode
    if (pwmPercent >= HIGH_POWER_THRESHOLD) {
        if (!_inHighPowerMode) {
            // Just entered high-power mode - start timer
            _inHighPowerMode = true;
            _highPowerStartTime = now;
            _highPowerStartTemp = temperature;
            Serial.printf("[SAFETY] High power mode started at %.1f°C\n", temperature);
        } else {
            // Already in high-power mode - check duration
            unsigned long elapsed = now - _highPowerStartTime;
            unsigned long timeoutMs = RUNAWAY_TIMEOUT_MINUTES * 60 * 1000;
            
            if (elapsed >= timeoutMs) {
                // 10 minutes elapsed - check if temperature rose
                float tempRise = temperature - _highPowerStartTemp;
                
                if (tempRise < MIN_EXPECTED_TEMP_RISE) {
                    // No significant temperature rise - heater fault!
                    Serial.printf("[SAFETY] Heater fault: Only +%.1f°C after %lu min at >80%% power\n",
                                  tempRise, RUNAWAY_TIMEOUT_MINUTES);
                    return true;
                } else {
                    // Temperature is rising normally, reset timer
                    _highPowerStartTime = now;
                    _highPowerStartTemp = temperature;
                }
            }
        }
    } else {
        // Exited high-power mode
        if (_inHighPowerMode) {
            _inHighPowerMode = false;
            Serial.println("[SAFETY] High power mode ended");
        }
    }
    
    return false;
}

float SafetyMonitor::_getTempAtTime(unsigned long targetTime) const {
    if (_tempHistory.empty()) {
        return NAN;
    }
    
    // If target time is before our oldest sample, use oldest
    if (targetTime <= _tempHistory.front().timestamp) {
        return _tempHistory.front().temperature;
    }
    
    // If target time is after our newest sample, use newest
    if (targetTime >= _tempHistory.back().timestamp) {
        return _tempHistory.back().temperature;
    }
    
    // Linear interpolation between samples
    for (size_t i = 1; i < _tempHistory.size(); i++) {
        if (_tempHistory[i].timestamp >= targetTime) {
            // Interpolate between i-1 and i
            const TempSample& before = _tempHistory[i - 1];
            const TempSample& after = _tempHistory[i];
            
            float ratio = (float)(targetTime - before.timestamp) / 
                          (float)(after.timestamp - before.timestamp);
            
            return before.temperature + ratio * (after.temperature - before.temperature);
        }
    }
    
    return NAN;
}

```

---
## File: firmware\PhysTrigger_ESP32\SafetyMonitor.h
```h
/**
 * @file SafetyMonitor.h
 * @brief Thermal safety protection for ESP32 heating vest controller
 * 
 * This class implements multiple safety mechanisms to prevent:
 * - Overheating beyond safe limits
 * - Thermal runaway detection
 * - Sensor fault detection (detachment, malfunction)
 * - Heater element failure
 * 
 * @author PhysTrigger Team
 * @date 2026-01-15
 */

#ifndef SAFETY_MONITOR_H
#define SAFETY_MONITOR_H

#include <Arduino.h>
#include <vector>

// ═══════════════════════════════════════════════════════════════════════════
// Safety Configuration Constants
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Maximum safe temperature (absolute cutoff)
 * @warning Exceeding this temperature will trigger immediate shutdown
 */
constexpr float MAX_TEMP_CUTOFF = 55.0f;

/**
 * @brief Minimum valid temperature reading
 * @note Below this value, sensor is likely disconnected or shorted
 */
constexpr float MIN_TEMP_VALID = -10.0f;

/**
 * @brief Maximum temperature change allowed in 2 seconds
 * @note Exceeding this indicates sensor fault or thermal runaway
 */
constexpr float MAX_TEMP_DELTA_2S = 5.0f;

/**
 * @brief Time window for rate-of-change detection (milliseconds)
 */
constexpr unsigned long DELTA_WINDOW_MS = 2000;

/**
 * @brief History buffer duration (milliseconds)
 */
constexpr unsigned long HISTORY_DURATION_MS = 5000;

/**
 * @brief PWM threshold for "high power" mode (0-100%)
 */
constexpr uint8_t HIGH_POWER_THRESHOLD = 80;

/**
 * @brief Maximum continuous high-power operation without temp rise (minutes)
 */
constexpr unsigned long RUNAWAY_TIMEOUT_MINUTES = 10;

/**
 * @brief Minimum expected temperature rise during high-power mode (°C)
 */
constexpr float MIN_EXPECTED_TEMP_RISE = 2.0f;

// ═══════════════════════════════════════════════════════════════════════════
// Safety State Enum
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Safety fault codes for diagnostic reporting
 */
enum class SafetyFault : uint8_t {
    NONE = 0,                    ///< No fault detected
    OVER_TEMP = 1,               ///< Temperature exceeded MAX_TEMP_CUTOFF
    SENSOR_DISCONNECTED = 2,     ///< Temperature below MIN_TEMP_VALID
    RAPID_TEMP_DROP = 3,         ///< Sensor detachment detected (rapid cooling)
    THERMAL_RUNAWAY = 4,         ///< Rapid uncontrolled heating
    HEATER_FAULT = 5,            ///< No temp rise despite high power
};

// ═══════════════════════════════════════════════════════════════════════════
// Temperature Sample Structure
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Temperature reading with timestamp
 */
struct TempSample {
    float temperature;
    unsigned long timestamp;
};

// ═══════════════════════════════════════════════════════════════════════════
// SafetyMonitor Class
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Thermal safety monitor for heating vest
 * 
 * @code{.cpp}
 * SafetyMonitor safety;
 * 
 * void loop() {
 *     float temp = readTemperature();
 *     uint8_t pwm = getCurrentPwm();
 *     
 *     safety.update(temp, pwm);
 *     
 *     if (!safety.isSafe()) {
 *         disableHeater();
 *         Serial.printf("SAFETY FAULT: %s\n", safety.getFaultString());
 *     }
 * }
 * @endcode
 */
class SafetyMonitor {
public:
    /**
     * @brief Construct a new Safety Monitor
     */
    SafetyMonitor();

    /**
     * @brief Update safety monitor with new readings
     * 
     * @param temperature Current temperature reading (°C)
     * @param pwmPercent Current PWM duty cycle (0-100)
     * 
     * @note Call this every loop iteration (recommended: every 100-500ms)
     */
    void update(float temperature, uint8_t pwmPercent);

    /**
     * @brief Check if system is in safe operating condition
     * 
     * @return true System is safe to continue operation
     * @return false STOP IMMEDIATELY - safety fault detected
     */
    bool isSafe() const;

    /**
     * @brief Get current fault code
     * 
     * @return SafetyFault Current fault, or NONE if safe
     */
    SafetyFault getFault() const;

    /**
     * @brief Get human-readable fault description
     * 
     * @return const char* Fault description string
     */
    const char* getFaultString() const;

    /**
     * @brief Reset safety monitor after fault is cleared
     * 
     * @warning Only call after verifying system is safe!
     */
    void reset();

    /**
     * @brief Get current temperature from history
     * 
     * @return float Latest temperature reading
     */
    float getCurrentTemp() const;

    /**
     * @brief Get temperature from N seconds ago
     * 
     * @param secondsAgo How many seconds in the past
     * @return float Temperature at that time, or NAN if unavailable
     */
    float getTempFromPast(float secondsAgo) const;

private:
    // Current state
    SafetyFault _currentFault;
    bool _isSafe;
    
    // Temperature history buffer (circular buffer)
    std::vector<TempSample> _tempHistory;
    static constexpr size_t MAX_HISTORY_SIZE = 100;
    
    // Runaway detection state
    unsigned long _highPowerStartTime;
    float _highPowerStartTemp;
    bool _inHighPowerMode;
    
    // Private methods
    void _addSample(float temperature);
    void _pruneOldSamples();
    bool _checkOverTemp(float temperature);
    bool _checkSensorDisconnected(float temperature);
    bool _checkRapidTempChange();
    bool _checkHeaterFault(uint8_t pwmPercent, float temperature);
    float _getTempAtTime(unsigned long targetTime) const;
};

#endif // SAFETY_MONITOR_H

```

---
## File: gradle\libs.versions.toml
```toml
[versions]
agp = "8.13.2"
kotlin = "2.0.21"
coreKtx = "1.10.1"
junit = "4.13.2"
junitVersion = "1.1.5"
espressoCore = "3.5.1"
lifecycleRuntimeKtx = "2.6.1"
activityCompose = "1.8.0"
composeBom = "2024.09.00"

[libraries]
androidx-core-ktx = { group = "androidx.core", name = "core-ktx", version.ref = "coreKtx" }
junit = { group = "junit", name = "junit", version.ref = "junit" }
androidx-junit = { group = "androidx.test.ext", name = "junit", version.ref = "junitVersion" }
androidx-espresso-core = { group = "androidx.test.espresso", name = "espresso-core", version.ref = "espressoCore" }
androidx-lifecycle-runtime-ktx = { group = "androidx.lifecycle", name = "lifecycle-runtime-ktx", version.ref = "lifecycleRuntimeKtx" }
androidx-activity-compose = { group = "androidx.activity", name = "activity-compose", version.ref = "activityCompose" }
androidx-compose-bom = { group = "androidx.compose", name = "compose-bom", version.ref = "composeBom" }
androidx-compose-ui = { group = "androidx.compose.ui", name = "ui" }
androidx-compose-ui-graphics = { group = "androidx.compose.ui", name = "ui-graphics" }
androidx-compose-ui-tooling = { group = "androidx.compose.ui", name = "ui-tooling" }
androidx-compose-ui-tooling-preview = { group = "androidx.compose.ui", name = "ui-tooling-preview" }
androidx-compose-ui-test-manifest = { group = "androidx.compose.ui", name = "ui-test-manifest" }
androidx-compose-ui-test-junit4 = { group = "androidx.compose.ui", name = "ui-test-junit4" }
androidx-compose-material3 = { group = "androidx.compose.material3", name = "material3" }

[plugins]
android-application = { id = "com.android.application", version.ref = "agp" }
kotlin-android = { id = "org.jetbrains.kotlin.android", version.ref = "kotlin" }
kotlin-compose = { id = "org.jetbrains.kotlin.plugin.compose", version.ref = "kotlin" }


```

---
## File: gradle\wrapper\gradle-wrapper.properties
```properties
#Thu Jan 15 18:22:24 CST 2026
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.13-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists

```

---
## File: lib\lib.md
```md
# Project Architecture: lib

## Directory Tree
```text
lib/
├── aggregate.py
├── core
│   ├── core.dart
│   ├── exceptions
│   │   └── ble_exception.dart
│   ├── interfaces
│   │   └── i_ble_service.dart
│   ├── models
│   │   ├── ble_connection_state.dart
│   │   ├── ble_device.dart
│   │   └── ble_service_info.dart
│   ├── services
│   │   └── flutter_blue_plus_service.dart
│   ├── utils
│   │   ├── android_permissions.dart
│   │   └── byte_utils.dart
│   └── viewmodels
│       └── ble_controller_viewmodel.dart
├── main.dart
└── ui
    ├── screens
    │   ├── control_screen.dart
    │   ├── device_scan_page.dart
    │   └── slider_control_page.dart
    ├── ui.dart
    └── widgets
        ├── hold_action_button.dart
        └── temperature_chart.dart
```

---

## File: main.dart
```dart
/// PhysTrigger Heating Vest - Main Entry Point
///
/// Implements robust error handling via runZonedGuarded and strict initialization order.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'ui/screens/device_scan_page.dart';

Future<void> main() async {
  // Fix 2: Safety Wrapper
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Catch-all for Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('[FLUTTER ERROR] ${details.exception}');
      debugPrint('[STACK TRACE] ${details.stack}');
    };

    runApp(const PhysTriggerApp());
  }, (Object error, StackTrace stack) {
    // Catch-all for async/Dart errors
    debugPrint('[FATAL APP ERROR] $error');
    debugPrint('[STACK TRACE] $stack');
  });
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Layer 1: BLE Service
        Provider<IBleService>(
          create: (_) => FlutterBluePlusService(),
          dispose: (_, service) => service.dispose(),
        ),

        // Layer 2: ViewModel
        ChangeNotifierProxyProvider<IBleService, BleControllerViewModel>(
          create: (context) {
            final viewModel = BleControllerViewModel(
              context.read<IBleService>(),
            );
            // Critical: Initialize permission/scan logic AFTER creation
            viewModel.initialize();
            return viewModel;
          },
          update: (_, service, viewModel) =>
              viewModel ?? BleControllerViewModel(service),
        ),
      ],
      child: MaterialApp(
        title: 'PhysTrigger Heating Vest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0D1117),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF58A6FF),
            secondary: Color(0xFF238636),
            surface: Color(0xFF161B22),
          ),
          fontFamily: 'Segoe UI',
          useMaterial3: true,
        ),
        home: const DeviceScanPage(),
      ),
    );
  }
}

```

---
## File: core\core.dart
```dart
/// Core module exports
///
/// Provides a single import point for all core functionality.
/// This barrel file exposes the public API of the core module.
library;

// ═══════════════════════════════════════════════════════════════════════════
// Interfaces (Contracts)
// ═══════════════════════════════════════════════════════════════════════════
export 'interfaces/i_ble_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Domain Models
// ═══════════════════════════════════════════════════════════════════════════
export 'models/ble_device.dart';
export 'models/ble_connection_state.dart';
export 'models/ble_service_info.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Exceptions
// ═══════════════════════════════════════════════════════════════════════════
export 'exceptions/ble_exception.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Services (Implementations)
// ═══════════════════════════════════════════════════════════════════════════
export 'services/flutter_blue_plus_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Utilities
// ═══════════════════════════════════════════════════════════════════════════
export 'utils/byte_utils.dart';
export 'utils/android_permissions.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ViewModels
// ═══════════════════════════════════════════════════════════════════════════
export 'viewmodels/ble_controller_viewmodel.dart';

```

---
## File: core\exceptions\ble_exception.dart
```dart
/// Comprehensive exception hierarchy for BLE operations.
///
/// Uses Dart 3 sealed classes for exhaustive pattern matching support.
/// Each exception type carries contextual information for debugging.
library;

/// Base exception for all BLE-related errors.
///
/// This is a sealed class enabling exhaustive switch statements:
/// ```dart
/// switch (exception) {
///   case BlePermissionDeniedException():
///     // Handle permission denial
///   case BleAdapterException():
///     // Handle adapter issues
///   // ... all cases must be handled
/// }
/// ```
sealed class BleException implements Exception {
  /// Human-readable error message.
  final String message;

  /// Original error from the underlying library (for debugging).
  final Object? cause;

  const BleException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return '$runtimeType: $message\nCaused by: $cause';
    }
    return '$runtimeType: $message';
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Permission Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when required permissions are not granted.
final class BlePermissionDeniedException extends BleException {
  /// Which permission was denied.
  final BlePermissionType permissionType;

  const BlePermissionDeniedException(
    this.permissionType, [
    String message = 'Required permission was denied',
    Object? cause,
  ]) : super(message, cause);
}

/// Types of permissions required for BLE operations.
enum BlePermissionType {
  /// General Bluetooth permission.
  bluetooth,

  /// Location permission (required on Android 11 and below for scanning).
  location,

  /// Bluetooth scan permission (Android 12+).
  bluetoothScan,

  /// Bluetooth connect permission (Android 12+).
  bluetoothConnect,
}

// ═══════════════════════════════════════════════════════════════════════════
// Adapter State Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when Bluetooth adapter is not available or turned off.
final class BleAdapterException extends BleException {
  /// Current state of the adapter.
  final BleAdapterState adapterState;

  const BleAdapterException(
    this.adapterState, [
    String message = 'Bluetooth adapter is not ready',
    Object? cause,
  ]) : super(message, cause);
}

/// States of the Bluetooth adapter.
enum BleAdapterState {
  /// Adapter state is unknown.
  unknown,

  /// Adapter is not available on this device.
  unavailable,

  /// Bluetooth is turned off.
  off,

  /// Bluetooth is turning on.
  turningOn,

  /// Bluetooth is on and ready.
  on,

  /// Bluetooth is turning off.
  turningOff,
}

// ═══════════════════════════════════════════════════════════════════════════
// Connection Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when connection times out.
final class BleConnectionTimeoutException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  /// Timeout duration that was exceeded.
  final Duration timeout;

  const BleConnectionTimeoutException(
    this.deviceId,
    this.timeout, [
    String message = 'Connection timed out',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when connection fails for reasons other than timeout.
final class BleConnectionFailedException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  const BleConnectionFailedException(
    this.deviceId, [
    String message = 'Failed to establish connection',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when an operation requires a connection but device is not connected.
final class BleNotConnectedException extends BleException {
  const BleNotConnectedException([
    String message = 'No device is connected',
    Object? cause,
  ]) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Operation Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when a write operation fails.
final class BleWriteException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleWriteException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Write operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a read operation fails.
final class BleReadException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleReadException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Read operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when service discovery fails.
final class BleServiceDiscoveryException extends BleException {
  const BleServiceDiscoveryException([
    String message = 'Failed to discover services',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a requested service or characteristic is not found.
final class BleCharacteristicNotFoundException extends BleException {
  /// Service UUID that was searched (may be null if not applicable).
  final String? serviceUuid;

  /// Characteristic UUID that was not found.
  final String? characteristicUuid;

  const BleCharacteristicNotFoundException({
    this.serviceUuid,
    this.characteristicUuid,
    String message = 'Characteristic not found',
    Object? cause,
  }) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Scan Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when scanning fails.
final class BleScanException extends BleException {
  const BleScanException([
    String message = 'Scan operation failed',
    Object? cause,
  ]) : super(message, cause);
}

```

---
## File: core\interfaces\i_ble_service.dart
```dart
/// Pure abstract interface for BLE communication layer.
///
/// All return types are Domain Models, never exposing third-party library types.
/// This ensures the UI layer remains completely decoupled from implementation details.
///
/// Implementations must handle platform-specific permissions:
/// - Android 10-11: ACCESS_FINE_LOCATION
/// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT
/// - iOS: Bluetooth usage description in Info.plist
/// - Windows: No special permissions required
library;

import 'dart:async';

import '../exceptions/ble_exception.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Abstract interface for BLE service operations.
///
/// Follows Interface Segregation Principle - clients depend only on
/// the methods they use.
abstract class IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Reactive Streams (Observable State)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Stream of discovered devices during scanning.
  ///
  /// Emits [BleDevice] objects as they are discovered.
  /// The stream continues until [stopScan] is called or timeout expires.
  Stream<BleDevice> get scanResults;

  /// Stream of connection state changes.
  ///
  /// Emits [BleConnectionState] whenever the connection state changes.
  /// UI should react to this stream to update connection indicators.
  Stream<BleConnectionState> get connectionState;

  /// Stream of raw data received from characteristic notifications.
  ///
  /// Emits byte arrays when subscribed characteristics send data.
  /// Must call [subscribeToNotifications] first to receive data.
  Stream<List<int>> get dataReceived;

  /// Current connection state (synchronous access).
  BleConnectionState get currentConnectionState;

  /// Currently connected device, or null if not connected.
  BleDevice? get connectedDevice;

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// [filterByServiceUuids] - Optional UUIDs to filter devices.
  ///   Only devices advertising these services will be reported.
  /// [timeout] - Auto-stop scanning after this duration (default: 10s).
  ///
  /// Results are emitted via [scanResults] stream.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if permissions are not granted
  /// - [BleAdapterException] if Bluetooth is off
  /// - [BleScanException] for other scan failures
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  });

  /// Stop ongoing scan.
  ///
  /// Safe to call even if no scan is in progress.
  Future<void> stopScan();

  /// Whether a scan is currently running.
  bool get isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a device by its unique identifier.
  ///
  /// [deviceId] - Platform-specific ID (MAC on Android, UUID on iOS/Windows).
  /// [timeout] - Connection timeout (default: 15s).
  ///
  /// After successful connection, [connectionState] stream emits [BleConnectionState.connected].
  ///
  /// Throws:
  /// - [BleConnectionTimeoutException] if connection times out
  /// - [BleConnectionFailedException] for other connection failures
  /// - [BleAdapterException] if Bluetooth is off
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  });

  /// Disconnect from currently connected device.
  ///
  /// Safe to call even if not connected.
  /// After disconnection, [connectionState] stream emits [BleConnectionState.disconnected].
  Future<void> disconnect();

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover all services and characteristics on connected device.
  ///
  /// Must be called after successful [connect].
  /// Returns a list of [BleServiceInfo] containing service and characteristic metadata.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleServiceDiscoveryException] if discovery fails
  Future<List<BleServiceInfo>> discoverServices();

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Write bytes to a characteristic.
  ///
  /// [serviceUuid] - Target service UUID.
  /// [characteristicUuid] - Target characteristic UUID.
  /// [data] - Bytes to write (0-255 range per element).
  /// [withResponse] - If true, wait for write confirmation (slower but reliable).
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleWriteException] if write fails
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  });

  /// Read bytes from a characteristic.
  ///
  /// Returns the current value of the characteristic.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleReadException] if read fails
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Subscribe to notifications on a characteristic.
  ///
  /// After subscription, data will be emitted via [dataReceived] stream.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Unsubscribe from notifications on a characteristic.
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  /// Initialize the BLE service.
  ///
  /// Should be called once at app startup.
  /// Requests necessary permissions based on platform.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if required permissions are denied
  /// - [BleAdapterException] if Bluetooth is unavailable
  Future<void> initialize();

  /// Release all resources.
  ///
  /// Disconnects from any connected device and cleans up streams.
  /// Should be called when the service is no longer needed.
  Future<void> dispose();
}

```

---
## File: core\models\ble_connection_state.dart
```dart
/// Connection state enumeration for BLE devices.
///
/// Represents the lifecycle of a BLE connection:
/// disconnected → connecting → connected → disconnecting → disconnected
library;

/// Connection state for BLE device.
enum BleConnectionState {
  /// No active connection.
  disconnected,

  /// Connection attempt in progress.
  connecting,

  /// Successfully connected and ready for operations.
  connected,

  /// Disconnection in progress.
  disconnecting,
}

/// Extension methods for [BleConnectionState].
extension BleConnectionStateX on BleConnectionState {
  /// Whether data operations (read/write) are currently possible.
  bool get isOperational => this == BleConnectionState.connected;

  /// Whether a state transition is in progress.
  bool get isTransitioning =>
      this == BleConnectionState.connecting ||
      this == BleConnectionState.disconnecting;

  /// Whether the device is not connected (disconnected or disconnecting).
  bool get isDisconnected =>
      this == BleConnectionState.disconnected ||
      this == BleConnectionState.disconnecting;

  /// Human-readable label for UI display.
  String get label {
    switch (this) {
      case BleConnectionState.disconnected:
        return 'Disconnected';
      case BleConnectionState.connecting:
        return 'Connecting...';
      case BleConnectionState.connected:
        return 'Connected';
      case BleConnectionState.disconnecting:
        return 'Disconnecting...';
    }
  }

  /// Icon code point for Material Icons.
  int get iconCodePoint {
    switch (this) {
      case BleConnectionState.disconnected:
        return 0xe1b2; // bluetooth_disabled
      case BleConnectionState.connecting:
        return 0xe1a7; // bluetooth_searching
      case BleConnectionState.connected:
        return 0xe1a8; // bluetooth_connected
      case BleConnectionState.disconnecting:
        return 0xe1a7; // bluetooth_searching
    }
  }
}

```

---
## File: core\models\ble_device.dart
```dart
/// Domain model representing a discovered BLE device.
///
/// This is a pure data class with no dependencies on third-party libraries,
/// ensuring the UI layer remains decoupled from BLE implementation details.
library;

import 'package:flutter/foundation.dart';

/// Immutable representation of a discovered BLE device.
@immutable
class BleDevice {
  /// Unique identifier (MAC address on Android, UUID on iOS/Windows).
  final String id;

  /// Advertised device name (may be empty if not advertised).
  final String name;

  /// Signal strength in dBm (typically -30 to -100).
  final int rssi;

  /// List of advertised service UUIDs.
  final List<String> serviceUuids;

  /// Raw manufacturer-specific data keyed by company identifier.
  final Map<int, List<int>> manufacturerData;

  const BleDevice({
    required this.id,
    this.name = '',
    this.rssi = 0,
    this.serviceUuids = const [],
    this.manufacturerData = const {},
  });

  /// Whether this device has a valid advertised name.
  bool get hasName => name.isNotEmpty;

  /// Signal strength category based on RSSI.
  BleSignalStrength get signalStrength {
    if (rssi >= -50) return BleSignalStrength.excellent;
    if (rssi >= -60) return BleSignalStrength.good;
    if (rssi >= -70) return BleSignalStrength.fair;
    return BleSignalStrength.weak;
  }

  /// Create a copy with updated values.
  BleDevice copyWith({
    String? id,
    String? name,
    int? rssi,
    List<String>? serviceUuids,
    Map<int, List<int>>? manufacturerData,
  }) {
    return BleDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      rssi: rssi ?? this.rssi,
      serviceUuids: serviceUuids ?? this.serviceUuids,
      manufacturerData: manufacturerData ?? this.manufacturerData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BleDevice && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BleDevice(id: $id, name: $name, rssi: $rssi)';
}

/// Signal strength categories based on RSSI values.
enum BleSignalStrength {
  /// RSSI >= -50 dBm
  excellent,

  /// RSSI >= -60 dBm
  good,

  /// RSSI >= -70 dBm
  fair,

  /// RSSI < -70 dBm
  weak,
}

```

---
## File: core\models\ble_service_info.dart
```dart
/// Domain models for BLE service and characteristic discovery results.
///
/// These models abstract away the underlying BLE library's data structures,
/// providing a clean interface for the UI layer.
library;

import 'package:flutter/foundation.dart';

/// Represents a discovered BLE service.
@immutable
class BleServiceInfo {
  /// Service UUID (typically in 128-bit or 16-bit format).
  final String uuid;

  /// List of characteristics discovered within this service.
  final List<BleCharacteristicInfo> characteristics;

  const BleServiceInfo({
    required this.uuid,
    this.characteristics = const [],
  });

  /// Find a characteristic by UUID.
  BleCharacteristicInfo? findCharacteristic(String characteristicUuid) {
    final normalizedUuid = characteristicUuid.toLowerCase();
    return characteristics.cast<BleCharacteristicInfo?>().firstWhere(
          (c) => c!.uuid.toLowerCase() == normalizedUuid,
          orElse: () => null,
        );
  }

  @override
  String toString() =>
      'BleServiceInfo(uuid: $uuid, characteristics: ${characteristics.length})';
}

/// Represents a discovered BLE characteristic.
@immutable
class BleCharacteristicInfo {
  /// Characteristic UUID.
  final String uuid;

  /// Whether this characteristic supports read operations.
  final bool canRead;

  /// Whether this characteristic supports write with response.
  final bool canWrite;

  /// Whether this characteristic supports write without response.
  final bool canWriteWithoutResponse;

  /// Whether this characteristic supports notifications.
  final bool canNotify;

  /// Whether this characteristic supports indications.
  final bool canIndicate;

  const BleCharacteristicInfo({
    required this.uuid,
    this.canRead = false,
    this.canWrite = false,
    this.canWriteWithoutResponse = false,
    this.canNotify = false,
    this.canIndicate = false,
  });

  /// Whether any write operation is supported.
  bool get isWriteable => canWrite || canWriteWithoutResponse;

  /// Whether any subscription mode is supported.
  bool get isSubscribable => canNotify || canIndicate;

  @override
  String toString() => 'BleCharacteristicInfo(uuid: $uuid, '
      'read: $canRead, write: $canWrite, notify: $canNotify)';
}

```

---
## File: core\services\flutter_blue_plus_service.dart
```dart
/// FlutterBluePlus implementation of [IBleService].
///
/// This class provides the concrete BLE functionality using the `flutter_blue_plus`
/// library. It handles all platform differences (Windows, Android, iOS) transparently
/// and maps all library-specific types to our domain models.
///
/// ## Architecture Notes
/// - All FBP types are converted to domain models at the boundary
/// - Stream subscriptions are carefully managed to prevent memory leaks
/// - Exceptions are translated to our [BleException] hierarchy
///
/// ## Usage
/// ```dart
/// final bleService = FlutterBluePlusService();
/// await bleService.initialize();
///
/// bleService.scanResults.listen((device) {
///   print('Found: ${device.name}');
/// });
///
/// await bleService.scan();
/// ```
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart' hide BleDevice;
import 'package:permission_handler/permission_handler.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Concrete implementation of [IBleService] using flutter_blue_plus.
///
/// This implementation:
/// - Supports Android, iOS, macOS, Windows, and Linux
/// - Handles platform-specific permission requirements
/// - Converts all FBP types to domain models
/// - Provides comprehensive error handling
class FlutterBluePlusService implements IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Private State
  // ═══════════════════════════════════════════════════════════════════════════

  /// Currently connected FBP device (internal reference).
  BluetoothDevice? _fbpDevice;

  /// Discovered services cache (for characteristic lookup).
  List<BluetoothService>? _discoveredServices;

  /// Scan results stream controller.
  final StreamController<BleDevice> _scanResultsController =
      StreamController<BleDevice>.broadcast();

  /// Connection state stream controller.
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  /// Data received stream controller (for notifications).
  final StreamController<List<int>> _dataReceivedController =
      StreamController<List<int>>.broadcast();

  /// Current connection state cache.
  BleConnectionState _currentConnectionState = BleConnectionState.disconnected;

  /// Connected device info cache.
  BleDevice? _connectedDevice;

  /// Whether a scan is currently running.
  bool _isScanning = false;

  /// Active subscriptions for cleanup.
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;
  final List<StreamSubscription<List<int>>> _notificationSubscriptions = [];

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Reactive Streams
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Stream<BleDevice> get scanResults => _scanResultsController.stream;

  @override
  Stream<BleConnectionState> get connectionState =>
      _connectionStateController.stream;

  @override
  Stream<List<int>> get dataReceived => _dataReceivedController.stream;

  @override
  BleConnectionState get currentConnectionState => _currentConnectionState;

  @override
  BleDevice? get connectedDevice => _connectedDevice;

  @override
  bool get isScanning => _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> initialize() async {
    try {
      // Check if Bluetooth is supported on this device
      if (await FlutterBluePlus.isSupported == false) {
        throw const BleAdapterException(
          BleAdapterState.unavailable,
          'Bluetooth is not supported on this device',
        );
      }

      // Request platform-specific permissions
      await _requestPermissions();

      // Check adapter state
      // On Windows, we must explicitly wait for the adapter to be ready
      // unlike Android where we can try to turn it on.
      if (Platform.isWindows) {
        await FlutterBluePlus.adapterState
            .where((state) => state == BluetoothAdapterState.on)
            .first
            .timeout(
              const Duration(seconds: 3),
              onTimeout: () => throw const BleAdapterException(
                BleAdapterState.off,
                'Bluetooth adapter not ready. Please check if Bluetooth is enabled.',
              ),
            );
      } else {
        final adapterState = await FlutterBluePlus.adapterState.first;
        if (adapterState != BluetoothAdapterState.on) {
          // Attempt to turn on Bluetooth (Android only)
          if (Platform.isAndroid) {
            try {
              await FlutterBluePlus.turnOn();
              // Wait for adapter to be on (with timeout)
              await FlutterBluePlus.adapterState
                  .where((state) => state == BluetoothAdapterState.on)
                  .first
                  .timeout(const Duration(seconds: 10));
            } catch (e) {
              throw BleAdapterException(
                _mapAdapterState(adapterState),
                'Failed to enable Bluetooth. Please enable it manually.',
                e,
              );
            }
          } else {
            throw BleAdapterException(
              _mapAdapterState(adapterState),
              'Bluetooth is turned off. Please enable Bluetooth in Settings.',
            );
          }
        }
      }

      debugPrint('FlutterBluePlusService: Initialized successfully');
    } on BleException {
      rethrow;
    } catch (e) {
      throw BleAdapterException(
        BleAdapterState.unknown,
        'Failed to initialize BLE service',
        e,
      );
    }
  }

  @override
  Future<void> dispose() async {
    // Cancel all subscriptions
    await _scanSubscription?.cancel();
    await _connectionSubscription?.cancel();
    for (final sub in _notificationSubscriptions) {
      await sub.cancel();
    }
    _notificationSubscriptions.clear();

    // Disconnect if connected
    await disconnect();

    // Close stream controllers
    await _scanResultsController.close();
    await _connectionStateController.close();
    await _dataReceivedController.close();

    debugPrint('FlutterBluePlusService: Disposed');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Scanning
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      // Verify adapter is on
      await _ensureAdapterOn();

      // Convert service UUIDs to FBP Guid format
      final List<Guid> withServices = filterByServiceUuids
              ?.map((uuid) => Guid(uuid))
              .toList() ??
          [];

      // Start scanning
      _isScanning = true;

      // Safety: Ensure any previous scan is stopped to prevent state conflicts
      // This fixes common "already scanning" errors on Windows/Android
      try {
        await FlutterBluePlus.stopScan();
      } catch (e) {
        // Ignore errors stopping scan
      }

      await FlutterBluePlus.startScan(
        withServices: withServices,
        timeout: timeout,
        androidUsesFineLocation: false,
      );

      // Listen to scan results and convert to domain model
      _scanSubscription = FlutterBluePlus.scanResults.listen(
        (results) {
          for (final result in results) {
            final device = _mapScanResultToDevice(result);
            _scanResultsController.add(device);
          }
        },
        onError: (error) {
          debugPrint('FlutterBluePlusService: Stream Error: $error');
          _scanResultsController.addError(
            BleScanException('Scan stream error', error),
          );
        },
      );

      // Auto-stop when scan completes
      FlutterBluePlus.isScanning.where((s) => !s).first.then((_) {
        _isScanning = false;
      });

      debugPrint('FlutterBluePlusService: Scan started');
    } on BleException {
      _isScanning = false;
      rethrow;
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Raw Scan Error: $e');
      throw BleScanException('Failed to start scan: $e', e);
    }
  }

  @override
  Future<void> stopScan() async {
    try {
      await FlutterBluePlus.stopScan();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Scan stopped');
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Error stopping scan: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Constants - UUIDs
  // ═══════════════════════════════════════════════════════════════════════════
  static const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String CHAR_UUID_CTRL = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Connection
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      _updateConnectionState(BleConnectionState.connecting);

      // Get device reference from ID
      // Use BluetoothDeviceWindows.fromId which properly handles Windows platform
      // by delegating to WinBle, and falls back to standard FBP for Android.
      final device = BluetoothDeviceWindows.fromId(deviceId);
      _fbpDevice = device;
      
      debugPrint('FlutterBluePlusService: Connecting to device. Type: ${device.runtimeType}');

      // Setup connection state listener BEFORE connecting
      _connectionSubscription?.cancel();
      _connectionSubscription = device.connectionState.listen((state) {
        final mappedState = _mapConnectionState(state);
        _updateConnectionState(mappedState);

        if (state == BluetoothConnectionState.disconnected) {
          _cleanupConnection();
        }
      });

      // Attempt connection
      await device.connect(
        timeout: timeout,
        autoConnect: false,
      );

      // ───────────────────────────────────────────────────────────────────────
      // Android Specific: Request High MTU
      // ───────────────────────────────────────────────────────────────────────
      if (Platform.isAndroid) {
        try {
          await device.requestMtu(512);
        } catch (e) {
          debugPrint('Failed to request MTU: $e');
          // Non-fatal, continue
        }
      }

      // ───────────────────────────────────────────────────────────────────────
      // Safe Discovery & Validation
      // ───────────────────────────────────────────────────────────────────────
      _discoveredServices = await device.discoverServices();

      // Validate Service Exists
      final service = _discoveredServices?.firstWhere(
        (s) => s.uuid.str.toLowerCase() == SERVICE_UUID.toLowerCase(),
        orElse: () => throw BleServiceDiscoveryException(
          'Target Service NOT found: $SERVICE_UUID',
        ),
      );

      // Validate Characteristic Exists
      // We check for CTRL characteristic as a minimum requirement
      final char = service?.characteristics.firstWhere(
        (c) => c.uuid.str.toLowerCase() == CHAR_UUID_CTRL.toLowerCase(),
        orElse: () => throw BleCharacteristicNotFoundException(
          serviceUuid: SERVICE_UUID,
          characteristicUuid: CHAR_UUID_CTRL,
          message: 'Target Characteristic NOT found: $CHAR_UUID_CTRL',
        ),
      );

      if (service == null || char == null) {
         // Should be caught by orElse, but double check
         throw BleConnectionFailedException(deviceId, 'Service or Characteristic validation failed');
      }

      // Cache connected device info
      _connectedDevice = BleDevice(
        id: deviceId,
        name: device.platformName.isNotEmpty
            ? device.platformName
            : 'Unknown Device',
        rssi: 0,
      );

      debugPrint('FlutterBluePlusService: Connected & Validated $deviceId');
    } on TimeoutException {
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionTimeoutException(deviceId, timeout);
    } on BleException {
      // Diconnect to clean up if validation failed
      await _fbpDevice?.disconnect(); 
      _updateConnectionState(BleConnectionState.disconnected);
      rethrow;
    } catch (e) {
      // Diconnect to clean up
      await _fbpDevice?.disconnect();
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionFailedException(
        deviceId,
        'Failed to connect: ${e.toString()}',
        e,
      );
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      _updateConnectionState(BleConnectionState.disconnecting);

      await _connectionSubscription?.cancel();
      _connectionSubscription = null;

      if (_fbpDevice != null) {
        await _fbpDevice!.disconnect();
      }

      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);

      debugPrint('FlutterBluePlusService: Disconnected');
    } catch (e) {
      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);
      debugPrint('FlutterBluePlusService: Disconnect error: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<List<BleServiceInfo>> discoverServices() async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    try {
      _discoveredServices = await _fbpDevice!.discoverServices();

      final services = _discoveredServices!.map((fbpService) {
        final characteristics = fbpService.characteristics.map((fbpChar) {
          return BleCharacteristicInfo(
            uuid: fbpChar.uuid.str.toUpperCase(),
            canRead: fbpChar.properties.read,
            canWrite: fbpChar.properties.write,
            canWriteWithoutResponse: fbpChar.properties.writeWithoutResponse,
            canNotify: fbpChar.properties.notify,
            canIndicate: fbpChar.properties.indicate,
          );
        }).toList();

        return BleServiceInfo(
          uuid: fbpService.uuid.str.toUpperCase(),
          characteristics: characteristics,
        );
      }).toList();

      debugPrint(
          'FlutterBluePlusService: Discovered ${services.length} services');
      return services;
    } catch (e) {
      throw BleServiceDiscoveryException('Failed to discover services', e);
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      // Determine write mode based on characteristic properties and request
      final useWithoutResponse =
          characteristic.properties.writeWithoutResponse && !withResponse;

      await characteristic.write(
        data,
        withoutResponse: useWithoutResponse,
      );

      debugPrint(
        'FlutterBluePlusService: Wrote ${data.length} bytes '
        '(withoutResponse: $useWithoutResponse)',
      );
    } catch (e) {
      throw BleWriteException(serviceUuid, characteristicUuid,
          'Write operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      final value = await characteristic.read();
      debugPrint('FlutterBluePlusService: Read ${value.length} bytes');
      return value;
    } catch (e) {
      throw BleReadException(serviceUuid, characteristicUuid,
          'Read operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(true);

      final subscription = characteristic.onValueReceived.listen((value) {
        _dataReceivedController.add(value);
      });
      _notificationSubscriptions.add(subscription);

      debugPrint(
        'FlutterBluePlusService: Subscribed to notifications on $characteristicUuid',
      );
    } catch (e) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
        message: 'Failed to subscribe to notifications: ${e.toString()}',
        cause: e,
      );
    }
  }

  @override
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(false);
      debugPrint(
        'FlutterBluePlusService: Unsubscribed from notifications on $characteristicUuid',
      );
    } catch (e) {
      debugPrint('FlutterBluePlusService: Error unsubscribing: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Private Helper Methods
  // ═══════════════════════════════════════════════════════════════════════════

  /// Request platform-specific permissions.
  Future<void> _requestPermissions() async {
    if (!Platform.isAndroid) return;

    // Android 12+ (API 31+) requires new Bluetooth permissions
    if (await _isAndroid12OrHigher()) {
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (scanStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.bluetoothScan);
      }
      if (connectStatus.isDenied) {
        throw const BlePermissionDeniedException(
            BlePermissionType.bluetoothConnect);
      }
    } else {
      // Android 10-11 requires location permission for scanning
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.location);
      }
    }
  }

  /// Check if running Android 12 (API 31) or higher.
  Future<bool> _isAndroid12OrHigher() async {
    // If bluetoothScan permission exists and isn't permanently denied due to
    // API level, we're on Android 12+
    final status = await Permission.bluetoothScan.status;
    return status != PermissionStatus.permanentlyDenied;
  }

  /// Ensure Bluetooth adapter is on before operations.
  Future<void> _ensureAdapterOn() async {
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      throw BleAdapterException(
        _mapAdapterState(adapterState),
        'Bluetooth is not enabled',
      );
    }
  }

  /// Map FBP ScanResult to our BleDevice domain model.
  BleDevice _mapScanResultToDevice(ScanResult result) {
    // Extract service UUIDs from advertisement data
    final serviceUuids = result.advertisementData.serviceUuids
        .map((guid) => guid.str.toUpperCase())
        .toList();

    // Extract manufacturer data
    final manufacturerData = <int, List<int>>{};
    result.advertisementData.manufacturerData.forEach((key, value) {
      manufacturerData[key] = value;
    });

    return BleDevice(
      // RemoteId works consistently across platforms when converted to string
      id: result.device.remoteId.str,
      name: result.device.platformName.isNotEmpty
          ? result.device.platformName
          : result.advertisementData.advName,
      rssi: result.rssi,
      serviceUuids: serviceUuids,
      manufacturerData: manufacturerData,
    );
  }

  /// Map FBP BluetoothConnectionState to our BleConnectionState.
  BleConnectionState _mapConnectionState(BluetoothConnectionState fbpState) {
    switch (fbpState) {
      case BluetoothConnectionState.disconnected:
        return BleConnectionState.disconnected;
      case BluetoothConnectionState.connected:
        return BleConnectionState.connected;
      default:
        // FBP doesn't have connecting/disconnecting states in the enum,
        // but they are implied during operations
        return BleConnectionState.disconnected;
    }
  }

  /// Map FBP BluetoothAdapterState to our BleAdapterState.
  BleAdapterState _mapAdapterState(BluetoothAdapterState fbpState) {
    switch (fbpState) {
      case BluetoothAdapterState.unknown:
        return BleAdapterState.unknown;
      case BluetoothAdapterState.unavailable:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.unauthorized:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.turningOn:
        return BleAdapterState.turningOn;
      case BluetoothAdapterState.on:
        return BleAdapterState.on;
      case BluetoothAdapterState.turningOff:
        return BleAdapterState.turningOff;
      case BluetoothAdapterState.off:
        return BleAdapterState.off;
    }
  }

  /// Update connection state and notify listeners.
  void _updateConnectionState(BleConnectionState state) {
    if (_currentConnectionState != state) {
      _currentConnectionState = state;
      _connectionStateController.add(state);
      debugPrint('FlutterBluePlusService: Connection state -> ${state.label}');
    }
  }

  /// Cleanup connection-related state.
  void _cleanupConnection() {
    _fbpDevice = null;
    _discoveredServices = null;
    _connectedDevice = null;

    // Cancel notification subscriptions
    for (final sub in _notificationSubscriptions) {
      sub.cancel();
    }
    _notificationSubscriptions.clear();
  }

  /// Find a characteristic by service and characteristic UUID.
  ///
  /// Throws [BleNotConnectedException] if not connected.
  /// Throws [BleCharacteristicNotFoundException] if not found.
  Future<BluetoothCharacteristic> _findCharacteristic(
    String serviceUuid,
    String characteristicUuid,
  ) async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    // Discover services if not already done
    if (_discoveredServices == null) {
      await discoverServices();
    }

    final normalizedServiceUuid = serviceUuid.toUpperCase();
    final normalizedCharUuid = characteristicUuid.toUpperCase();

    // Find the service
    BluetoothService? targetService;
    for (final service in _discoveredServices!) {
      if (service.uuid.str.toUpperCase() == normalizedServiceUuid) {
        targetService = service;
        break;
      }
    }

    if (targetService == null) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        message: 'Service not found: $serviceUuid',
      );
    }

    // Find the characteristic
    for (final char in targetService.characteristics) {
      if (char.uuid.str.toUpperCase() == normalizedCharUuid) {
        return char;
      }
    }

    throw BleCharacteristicNotFoundException(
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
      message: 'Characteristic not found: $characteristicUuid',
    );
  }
}

```

---
## File: core\utils\android_permissions.dart
```dart
/// Android BLE Permission Helper - Bulletproof Implementation
///
/// Handles Android 12+ (API 31+) split permissions and Legacy (API < 31) location permissions.
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Request BLE permissions with logic for all Android versions.
///
/// Returns `true` only if crucial permissions are granted.
Future<bool> requestAndroidPermissions({
  VoidCallback? onOpenSettings,
}) async {
  if (!Platform.isAndroid) return true;

  // Use permission_handler's built-in SDK check/support
  // It automatically handles manifest merging if configured correctly,
  // but explicit requests are safer.
  
  Map<Permission, PermissionStatus> statuses;

  // Check if we are potentially on Android 12+
  // We can infer this if BLUETOOTH_SCAN is supported/declared.
  // Note: Permission.bluetoothScan.status won't crash on older Android, 
  // it just returns restricted/denied usually.
  
  // Strategy: Request everything relevant.
  // The plugin handles API level checks internally.
  
  if (await Permission.bluetoothScan.status.isRestricted || 
      await _isAndroid12OrHigher()) {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 12+ (S / API 31+)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Request SCAN and CONNECT together
    statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    final scan = statuses[Permission.bluetoothScan];
    final connect = statuses[Permission.bluetoothConnect];
    
    if (scan == PermissionStatus.granted && connect == PermissionStatus.granted) {
      return true;
    }
    
    if (scan == PermissionStatus.permanentlyDenied || connect == PermissionStatus.permanentlyDenied) {
      onOpenSettings?.call();
      return false;
    }
    
    return false;
  } else {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 11 and below (API < 31)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Requires LOCATION for BLE scanning
    final status = await Permission.locationWhenInUse.request();
    
    if (status.isGranted) return true;
    
    if (status.isPermanentlyDenied) {
      onOpenSettings?.call();
    }
    return false;
  }
}

/// Helper: Roughly detect Android 12+ environment
Future<bool> _isAndroid12OrHigher() async {
  // On older Android, bluetoothScan usually returns restricted/unavailable state immediately.
  // But reliable check is checking OS version directly if needed. 
  // For safety, we try to create the intent if needed, but here we stick to permission_handler.
  
  // Note: permission_handler 10.0+ handles this well.
  // Using a heuristic: if bluetoothScan is NOT permanently denied by default, it might be 12+.
  // Actually, simplest is to just request.
  
  // Using device info plugin would be best, but we don't want extra dependencies.
  // We rely on the fact that requesting `bluetoothScan` on Android 10 returns success immediately/ignores it?
  // No, permission_handler returns `restricted` on older Android for new permissions.
  
  // If `bluetoothScan` is Restricted, we assume old Android.
  var status = await Permission.bluetoothScan.status;
  return !status.isRestricted; 
}

```

---
## File: core\utils\byte_utils.dart
```dart
/// Byte conversion utilities for BLE communication
/// 
/// Ensures data format strictly conforms to the protocol:
/// - All data must be List<int> (Byte Array)
/// - Each element must be in range 0-255 (unsigned byte)
library;

import 'dart:convert'; // For utf8 decoder
import 'package:flutter/foundation.dart';

/// Converts a single hex value to a byte list
/// 
/// Example:
/// ```dart
/// hexToByte(0x01);  // Returns [1]
/// hexToByte(0xA5);  // Returns [165]
/// hexToByte(0xFF);  // Returns [255]
/// ```
List<int> hexToByte(int hexValue) {
  assert(hexValue >= 0 && hexValue <= 255, 
    'Hex value must be in range 0x00-0xFF (0-255)');
  return [hexValue];
}

/// Converts a hex string to a byte list
/// 
/// Supports formats:
/// - "A5" or "a5" (single byte)
/// - "A5DD02" or "A5 DD 02" (multi-byte)
/// - "0xA5" or "0XA5" (with prefix)
/// 
/// Example:
/// ```dart
/// hexStringToBytes("A5DD02");     // Returns [165, 221, 2]
/// hexStringToBytes("A5 DD 02");   // Returns [165, 221, 2]
/// hexStringToBytes("0xA5");       // Returns [165]
/// ```
List<int> hexStringToBytes(String hexString) {
  // Remove common prefixes and spaces
  String cleaned = hexString
      .replaceAll('0x', '')
      .replaceAll('0X', '')
      .replaceAll(' ', '')
      .toUpperCase();
  
  // Ensure even number of characters
  if (cleaned.length % 2 != 0) {
    cleaned = '0$cleaned';
  }
  
  final List<int> bytes = [];
  for (int i = 0; i < cleaned.length; i += 2) {
    final hexPair = cleaned.substring(i, i + 2);
    final value = int.parse(hexPair, radix: 16);
    bytes.add(value);
  }
  
  return bytes;
}

/// Converts a byte list to a hex string for debugging
/// 
/// Example:
/// ```dart
/// bytesToHexString([165, 221, 2]);  // Returns "A5 DD 02"
/// ```
String bytesToHexString(List<int> bytes) {
  return bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
}

/// Validates that all bytes are in valid range (0-255)
/// 
/// Throws [ArgumentError] if any byte is out of range
void validateBytes(List<int> bytes) {
  for (int i = 0; i < bytes.length; i++) {
    if (bytes[i] < 0 || bytes[i] > 255) {
      throw ArgumentError(
        'Byte at index $i (value: ${bytes[i]}) is out of range 0-255'
      );
    }
  }
}

/// Converts slider percentage to byte array for BLE transmission
/// 
/// ESP32 firmware expects UINT8 (0-100) directly, no conversion needed.
/// The firmware internally maps this to PWM duty cycle (0-255).
/// 
/// Example:
/// ```dart
/// sliderValueToBytes(0);    // Returns [0]   - 0% heating
/// sliderValueToBytes(50);   // Returns [50]  - 50% heating
/// sliderValueToBytes(100);  // Returns [100] - 100% heating
/// ```
List<int> sliderValueToBytes(int percentage) {
  assert(percentage >= 0 && percentage <= 100, 
    'Slider value must be in range 0-100');
  return [percentage];
}

/// BLE UUID constants for PhysTrigger Heating Vest
/// 
/// These UUIDs match the ESP32 firmware in sketch_jan3a.ino
abstract class BleUuids {
  /// PhysTrigger Heating Vest Service UUID
  static const String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  
  /// PWM Control Characteristic UUID (Write/Write No Response)
  /// Accepts UINT8 values from 0-100 representing heating intensity percentage
  static const String characteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  
  /// Temperature Notification Characteristic UUID (Read/Notify)
  /// Broadcasts temperature readings as UTF8 string (e.g., "25.82")
  static const String tempCharacteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a9';
  
  /// Target device name for scanning
  static const String targetDeviceName = 'PhysTrigger_Vest';
}

/// Parse temperature from UTF8 bytes
/// 
/// ESP32 sends temperature as UTF8 string (e.g., "25.82")
/// This function converts bytes to string and parses to double
double parseTemperature(List<int> bytes) {
  try {
    final str = utf8.decode(bytes);
    return double.tryParse(str) ?? 0.0;
  } catch (e) {
    debugPrint('Temperature parse error: $e');
    return 0.0;
  }
}

```

---
## File: core\viewmodels\ble_controller_viewmodel.dart
```dart
/// BLE Controller ViewModel - MVVM State Management Layer
///
/// Bridges the UI layer with [IBleService] for BLE operations.
/// Uses [ChangeNotifier] for reactive state management with Provider.
///
/// ## Architecture
/// - Receives [IBleService] via constructor injection (DI-ready)
/// - Exposes observable state properties for UI binding
/// - Translates all [BleException] errors to user-friendly messages
///
/// ## Usage
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => BleControllerViewModel(FlutterBluePlusService()),
/// )
/// ```
library;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';
import '../utils/byte_utils.dart';

/// ViewModel for BLE device control operations.
///
/// This class follows MVVM pattern and provides:
/// - Reactive state updates via [ChangeNotifier]
/// - Command methods for UI actions
/// - Error handling with user-friendly messages
class BleControllerViewModel extends ChangeNotifier {
  // ═══════════════════════════════════════════════════════════════════════════
  // Dependencies (Injected)
  // ═══════════════════════════════════════════════════════════════════════════

  /// BLE service interface - never instantiated internally.
  final IBleService _bleService;

  // ═══════════════════════════════════════════════════════════════════════════
  // Observable State Properties
  // ═══════════════════════════════════════════════════════════════════════════

  /// List of discovered devices from scan.
  List<BleDevice> _scanResults = [];

  /// Unmodifiable view of scan results for UI binding.
  List<BleDevice> get scanResults => List.unmodifiable(_scanResults);

  /// Current connection state.
  BleConnectionState _connectionState = BleConnectionState.disconnected;

  /// Current connection state for UI binding.
  BleConnectionState get connectionState => _connectionState;

  /// Currently connected device (null if disconnected).
  BleDevice? _connectedDevice;

  /// Currently connected device for UI binding.
  BleDevice? get connectedDevice => _connectedDevice;

  /// Whether a scan is currently in progress.
  bool _isScanning = false;

  /// Whether scanning is active for UI binding.
  bool get isScanning => _isScanning;

  /// Last error message for UI display (null if no error).
  String? _errorMessage;

  /// Error message for UI snackbar/dialog display.
  String? get errorMessage => _errorMessage;

  /// Discovered services on connected device.
  List<BleServiceInfo> _discoveredServices = [];

  /// Discovered services for UI binding.
  List<BleServiceInfo> get discoveredServices =>
      List.unmodifiable(_discoveredServices);

  /// Temperature history for chart display (last 30 readings).
  final List<double> _temperatureHistory = [];

  /// Temperature history for UI chart binding.
  List<double> get temperatureHistory => List.unmodifiable(_temperatureHistory);

  /// Current temperature reading.
  double _currentTemperature = 0.0;

  /// Current temperature for UI display.
  double get currentTemperature => _currentTemperature;

  /// Last sent command bytes (for debug display).
  List<int>? _lastSentCommand;

  /// Last sent command for debug UI.
  List<int>? get lastSentCommand => _lastSentCommand;

  /// Last sent command as hex string for debug display.
  String get lastSentCommandHex =>
      _lastSentCommand != null ? bytesToHexString(_lastSentCommand!) : '--';

  // ═══════════════════════════════════════════════════════════════════════════
  // Convenience Getters
  // ═══════════════════════════════════════════════════════════════════════════

  /// Whether device is currently connected.
  bool get isConnected => _connectionState == BleConnectionState.connected;

  /// Whether connection is in progress.
  bool get isConnecting => _connectionState == BleConnectionState.connecting;

  /// Whether disconnection is in progress.
  bool get isDisconnecting =>
      _connectionState == BleConnectionState.disconnecting;

  /// Whether any transitional state is active.
  bool get isBusy => _connectionState.isTransitioning || _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Stream Subscriptions (must be disposed!)
  // ═══════════════════════════════════════════════════════════════════════════

  StreamSubscription<BleConnectionState>? _connectionStateSubscription;
  StreamSubscription<BleDevice>? _scanResultsSubscription;
  StreamSubscription<List<int>>? _dataReceivedSubscription;
  Timer? _scanTimeoutTimer;

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence (for auto-reconnect)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String _keyLastDeviceId = 'last_connected_device_id';
  String? _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Constructor & Initialization
  // ═══════════════════════════════════════════════════════════════════════════

  /// Creates a new ViewModel with the given BLE service.
  ///
  /// The service is injected via constructor for testability and flexibility.
  /// Call [initialize] after construction to setup streams and permissions.
  BleControllerViewModel(this._bleService) {
    _setupServiceListeners();
  }

  /// Initialize the BLE service and request permissions.
  ///
  /// Should be called once after construction.
  /// Updates [errorMessage] if initialization fails.
  Future<void> initialize() async {
    try {
      await _bleService.initialize();
      _lastSavedDeviceId = await _loadLastDeviceId();
      debugPrint('BleControllerViewModel: Initialized successfully');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Failed to initialize BLE: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: $e');
    }
  }

  /// Setup listeners for service streams.
  void _setupServiceListeners() {
    // Listen to connection state changes
    _connectionStateSubscription = _bleService.connectionState.listen(
      (state) {
        _connectionState = state;

        if (state == BleConnectionState.connected) {
          _connectedDevice = _bleService.connectedDevice;
          _errorMessage = null;
        } else if (state == BleConnectionState.disconnected) {
          _connectedDevice = null;
          _discoveredServices = [];
        }

        notifyListeners();
        debugPrint('BleControllerViewModel: Connection state -> ${state.label}');
      },
      onError: (error) {
        if (error is BleException) {
          _errorMessage = error.message;
        } else {
          _errorMessage = error.toString();
        }
        notifyListeners();
      },
    );

    // Listen to data received (notifications)
    _dataReceivedSubscription = _bleService.dataReceived.listen(
      (data) {
        // Parse temperature if data looks like UTF8 temperature string
        if (data.isNotEmpty) {
          final temp = parseTemperature(data);
          if (temp > 0) {
            _currentTemperature = temp;
            _temperatureHistory.add(temp);

            // Keep only last 30 readings
            if (_temperatureHistory.length > 30) {
              _temperatureHistory.removeAt(0);
            }

            notifyListeners();
          }
        }
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// Clears previous results and starts a new scan.
  /// Updates [isScanning] and [scanResults] reactively.
  /// Auto-stops after 15 seconds.
  Future<void> startScan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_isScanning) return;

    _isScanning = true;
    _scanResults = [];
    _errorMessage = null;
    notifyListeners();

    try {
      // Start scan on service
      await _bleService.scan(
        filterByServiceUuids: filterByServiceUuids,
        timeout: timeout,
      );

      // Listen to scan results
      _scanResultsSubscription = _bleService.scanResults.listen(
        (device) {
          _handleScanResult(device);
        },
        onError: (error) {
          if (error is BleException) {
            _errorMessage = error.message;
          } else {
            _errorMessage = error.toString();
          }
          _isScanning = false;
          notifyListeners();
        },
        onDone: () {
          _isScanning = false;
          notifyListeners();
        },
      );

      // Safety timeout
      _scanTimeoutTimer = Timer(timeout, () {
        stopScan();
      });

      debugPrint('BleControllerViewModel: Scan started');
    } on BleException catch (e) {
      _errorMessage = e.message;
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Scan failed: $e';
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: $e');
    }
  }

  /// Handle incoming scan result.
  void _handleScanResult(BleDevice device) {
    // Skip devices without names
    if (!device.hasName) return;

    // Check if we already have this device
    final existingIndex = _scanResults.indexWhere((d) => d.id == device.id);

    if (existingIndex >= 0) {
      // Update existing device with new RSSI
      _scanResults[existingIndex] = device;
    } else {
      // Add new device
      _scanResults.add(device);
      debugPrint(
          'BleControllerViewModel: Found device: ${device.name} [${device.id}]');
    }

    notifyListeners();
  }

  /// Stop the current scan.
  Future<void> stopScan() async {
    _scanTimeoutTimer?.cancel();
    _scanTimeoutTimer = null;

    await _scanResultsSubscription?.cancel();
    _scanResultsSubscription = null;

    try {
      await _bleService.stopScan();
    } catch (e) {
      debugPrint('BleControllerViewModel: Error stopping scan: $e');
    }

    _isScanning = false;
    notifyListeners();

    debugPrint('BleControllerViewModel: Scan stopped');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a discovered device.
  ///
  /// Returns true if connection was successful.
  /// Updates [connectionState] and [connectedDevice] reactively.
  Future<bool> connect(BleDevice device) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await _bleService.connect(device.id);

      // Save device ID for future auto-reconnect
      if (_bleService.currentConnectionState == BleConnectionState.connected) {
        await _saveLastDeviceId(device.id);
      }

      debugPrint('BleControllerViewModel: Connected to ${device.name}');
      return true;
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: ${e.message}');
      return false;
    } catch (e) {
      _errorMessage = 'Connection failed: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: $e');
      return false;
    }
  }

  /// Disconnect from the current device.
  ///
  /// Sends safety shutdown command (0%) before disconnecting.
  Future<void> disconnect() async {
    _errorMessage = null;

    // Safety: Send 0% command before disconnecting
    if (isConnected) {
      try {
        debugPrint(
            'BleControllerViewModel: Safety shutdown - sending 0% before disconnect');
        await writeSliderValue(0);
        await Future.delayed(const Duration(milliseconds: 200));
      } catch (e) {
        debugPrint('BleControllerViewModel: Safety shutdown failed: $e');
      }
    }

    try {
      await _bleService.disconnect();
      debugPrint('BleControllerViewModel: Disconnected');
    } on BleException catch (e) {
      _errorMessage = e.message;
      debugPrint('BleControllerViewModel: Disconnect error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Disconnect failed: $e';
      debugPrint('BleControllerViewModel: Disconnect error: $e');
    }

    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover services on the connected device.
  ///
  /// Updates [discoveredServices] with results.
  Future<void> discoverServices() async {
    if (!isConnected) {
      _errorMessage = 'Cannot discover services: not connected';
      notifyListeners();
      return;
    }

    try {
      _discoveredServices = await _bleService.discoverServices();
      notifyListeners();
      debugPrint(
          'BleControllerViewModel: Discovered ${_discoveredServices.length} services');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Discovery error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Send raw bytes to the connected device.
  ///
  /// Updates [lastSentCommand] for debug display.
  Future<void> sendCommand(List<int> bytes) async {
    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot send - not connected');
      return;
    }

    try {
      validateBytes(bytes);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent ${bytesToHexString(bytes)}');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Send error: ${e.message}');
    }
  }

  /// Send slider value (0-100) to connected device.
  ///
  /// The firmware maps this percentage to PWM duty cycle.
  Future<void> writeSliderValue(int percentage) async {
    if (percentage < 0 || percentage > 100) {
      debugPrint('BleControllerViewModel: Invalid slider value: $percentage');
      return;
    }

    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot write slider - not connected');
      return;
    }

    try {
      final bytes = sliderValueToBytes(percentage);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
        withResponse: false,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent slider value: $percentage%');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Write error: ${e.message}');
    }
  }

  /// Subscribe to notifications on a characteristic.
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    if (!isConnected) {
      _errorMessage = 'Cannot subscribe: not connected';
      notifyListeners();
      return;
    }

    try {
      await _bleService.subscribeToNotifications(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
      );
      debugPrint('BleControllerViewModel: Subscribed to $characteristicUuid');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Subscribe error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Error Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Clear the current error message.
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence Helpers
  // ═══════════════════════════════════════════════════════════════════════════

  /// Save device ID to local storage.
  Future<void> _saveLastDeviceId(String deviceId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLastDeviceId, deviceId);
      _lastSavedDeviceId = deviceId;
      debugPrint('BleControllerViewModel: Saved device ID: $deviceId');
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to save device ID: $e');
    }
  }

  /// Load last connected device ID from storage.
  Future<String?> _loadLastDeviceId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final deviceId = prefs.getString(_keyLastDeviceId);
      debugPrint('BleControllerViewModel: Loaded device ID: $deviceId');
      return deviceId;
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to load device ID: $e');
      return null;
    }
  }

  /// Get the last saved device ID (for auto-reconnect).
  String? get lastSavedDeviceId => _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  void dispose() {
    // Cancel all stream subscriptions
    _connectionStateSubscription?.cancel();
    _scanResultsSubscription?.cancel();
    _dataReceivedSubscription?.cancel();
    _scanTimeoutTimer?.cancel();

    // Dispose the underlying service
    _bleService.dispose();

    super.dispose();
    debugPrint('BleControllerViewModel: Disposed');
  }
}

```

---
## File: ui\ui.dart
```dart
/// UI module exports
/// 
/// Provides a single import point for all UI widgets
library;

export 'widgets/hold_action_button.dart';
export 'screens/control_screen.dart';

```

---
## File: ui\screens\control_screen.dart
```dart
/// Control Screen - Main UI for BLE device interaction
///
/// Dynamic view switching:
/// - Disconnected: Shows scan button + device list
/// - Connected: Shows disconnect button + control pad
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/hold_action_button.dart';

/// Main control screen with scan/connect/control functionality
class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text('PhysTrigger BLE'),
        backgroundColor: const Color(0xFF16213E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              // Main content area
              Expanded(
                child: viewModel.isConnected
                    ? _buildControlPanel(context, viewModel)
                    : _buildScanPanel(context, viewModel),
              ),

              // Debug info bar at bottom
              _buildDebugBar(viewModel),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // State A: Disconnected - Scan Panel
  // ============================================================

  Widget _buildScanPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Scan button
          ElevatedButton.icon(
            onPressed: viewModel.isScanning ? viewModel.stopScan : viewModel.startScan,
            icon: viewModel.isScanning
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.bluetooth_searching),
            label: Text(viewModel.isScanning ? '停止扫描' : '扫描设备'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3460),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Device list header
          Text(
            '发现的设备 (${viewModel.scanResults.length})',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Device list
          Expanded(
            child: viewModel.scanResults.isEmpty
                ? Center(
                    child: Text(
                      viewModel.isScanning ? '正在扫描...' : '点击上方按钮开始扫描',
                      style: const TextStyle(color: Colors.white38),
                    ),
                  )
                : ListView.builder(
                    itemCount: viewModel.scanResults.length,
                    itemBuilder: (context, index) {
                      final device = viewModel.scanResults[index];
                      return _buildDeviceListTile(context, viewModel, device);
                    },
                  ),
          ),

          // Error message
          if (viewModel.errorMessage != null)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.redAccent),
              ),
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDeviceListTile(
    BuildContext context,
    BleControllerViewModel viewModel,
    BleDevice device,
  ) {
    // Display "Unknown Device (MAC)" if name is empty
    final displayName = device.name.isNotEmpty
        ? device.name
        : 'Unknown Device (${device.id})';

    return Card(
      color: const Color(0xFF16213E),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.bluetooth, color: Colors.blueAccent),
        title: Text(
          displayName,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'RSSI: ${device.rssi} dBm',
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        trailing: viewModel.isConnecting
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.chevron_right, color: Colors.white38),
        onTap: viewModel.isConnecting
            ? null
            : () async {
                await viewModel.connect(device);
              },
      ),
    );
  }

  // ============================================================
  // State B: Connected - Control Panel
  // ============================================================

  Widget _buildControlPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Connection status header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.greenAccent),
            ),
            child: Row(
              children: [
                const Icon(Icons.bluetooth_connected, color: Colors.greenAccent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '已连接',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        viewModel.connectedDevice?.name ?? 'Unknown',
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: viewModel.disconnect,
                  child: const Text(
                    '断开连接',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Directional control pad
          Expanded(
            child: Center(
              child: DirectionalPad(
                onCommand: viewModel.sendCommand,
                buttonSize: 80,
                enabled: viewModel.isConnected,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Additional action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoldActionButton(
                label: 'STOP',
                icon: Icons.stop_circle_outlined,
                pressCommand: const [0x00], // STOP command
                releaseCommand: const [0x00], // STOP command
                onCommand: viewModel.sendCommand,
                size: 70,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade900,
                enabled:viewModel.isConnected,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Debug Bar (always visible at bottom)
  // ============================================================

  Widget _buildDebugBar(BleControllerViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F1A),
        border: Border(
          top: BorderSide(color: Colors.white12),
        ),
      ),
      child: Row(
        children: [
          // Connection state indicator
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getConnectionColor(viewModel.connectionState),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _getConnectionText(viewModel.connectionState),
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),

          const Spacer(),

          // Last sent command
          const Text(
            '最后指令: ',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              viewModel.lastSentCommandHex,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConnectionColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return Colors.greenAccent;
      case BleConnectionState.connecting:
      case BleConnectionState.disconnecting:
        return Colors.orangeAccent;
      case BleConnectionState.disconnected:
        return Colors.redAccent;
    }
  }

  String _getConnectionText(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return '已连接';
      case BleConnectionState.connecting:
        return '连接中...';
      case BleConnectionState.disconnecting:
        return '断开中...';
      case BleConnectionState.disconnected:
        return '未连接';
    }
  }
}

```

---
## File: ui\screens\device_scan_page.dart
```dart
/// Device Connect Page - Simple Connection UI
/// 
/// Single button to scan and connect to PhysTrigger_Vest.
/// After successful connection, navigates to SliderControlPage.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import 'slider_control_page.dart';

/// Simple landing page with connect button
class DeviceScanPage extends StatefulWidget {
  const DeviceScanPage({super.key});

  @override
  State<DeviceScanPage> createState() => _DeviceScanPageState();
}

class _DeviceScanPageState extends State<DeviceScanPage> {
  bool _isConnecting = false;
  Timer? _scanTimer;

  @override
  void dispose() {
    _scanTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          // Navigate to control page when connected
          if (viewModel.isConnected) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const SliderControlPage(),
                ),
              );
            });
          }

          final showLoading = _isConnecting || viewModel.isScanning || viewModel.isConnecting;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: showLoading
                            ? [const Color(0xFF58A6FF), const Color(0xFF388BFD)]
                            : [const Color(0xFF238636), const Color(0xFF2EA043)],
                      ),
                    ),
                    child: Icon(
                      showLoading
                          ? Icons.bluetooth_searching
                          : Icons.bluetooth,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Title
                  const Text(
                    'PhysTrigger Vest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Status Text
                  Text(
                    _getStatusText(viewModel),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  // Connected Device ID
                  if (viewModel.connectedDevice != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${viewModel.connectedDevice!.id}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 48),
                  
                  // Connect Button or Loading
                  if (showLoading)
                    const Column(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xFF58A6FF),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '正在连接...',
                          style: TextStyle(
                            color: Color(0xFF58A6FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: () => _startConnection(viewModel),
                      icon: const Icon(Icons.power_settings_new, size: 24),
                      label: const Text(
                        '连接设备',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF238636),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  
                  // Error Message
                  if (viewModel.errorMessage != null) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDA3633).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFDA3633),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              viewModel.errorMessage!,
                              style: const TextStyle(
                                color: Color(0xFFDA3633),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getStatusText(BleControllerViewModel viewModel) {
    if (viewModel.isConnecting) return '正在连接 PhysTrigger_Vest...';
    if (_isConnecting || viewModel.isScanning) return '正在搜索 PhysTrigger_Vest...';
    if (viewModel.isConnected) return '已连接';
    return '点击下方按钮连接加热马甲';
  }

  void _startConnection(BleControllerViewModel viewModel) {
    setState(() => _isConnecting = true);
    
    // Start scan
    viewModel.startScan();
    
    // Poll for PhysTrigger device every 500ms
    _scanTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final results = viewModel.scanResults;
      
      // Find PhysTrigger device by name
      BleDevice? targetDevice;
      for (final device in results) {
        if (device.name.toLowerCase().contains('phystrigger')) {
          targetDevice = device;
          debugPrint('[DeviceScanPage] Found PhysTrigger: ${device.name} [${device.id}]');
          break;
        }
      }
      
      if (targetDevice != null) {
        timer.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        debugPrint('[DeviceScanPage] Connecting to: ${targetDevice.name} [${targetDevice.id}]');
        viewModel.connect(targetDevice);
        
        setState(() => _isConnecting = false);
      }
    });
    
    // Timeout after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (_scanTimer?.isActive ?? false) {
        _scanTimer?.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        setState(() => _isConnecting = false);
      }
    });
  }
}

```

---
## File: ui\screens\slider_control_page.dart
```dart
/// Slider Control Page for PhysTrigger Heating Vest
/// 
/// Main UI screen with:
/// - Connection status display in AppBar
/// - Large vertical slider (0-100%)
/// - Real-time BLE communication
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/temperature_chart.dart';
import 'device_scan_page.dart';

/// Main control screen for heating vest slider control
class SliderControlPage extends StatefulWidget {
  const SliderControlPage({super.key});

  @override
  State<SliderControlPage> createState() => _SliderControlPageState();
}

class _SliderControlPageState extends State<SliderControlPage> {
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: _buildAppBar(context),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Connection Status Card
                    _buildConnectionStatusCard(viewModel),
                    
                    const SizedBox(height: 48),
                    
                    // Slider Control Section
                    if (viewModel.isConnected) ...[
                      _buildSliderControl(viewModel),
                    ] else ...[
                      _buildDisconnectedMessage(viewModel),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// AppBar with connection status badge
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'PhysTrigger Heating Vest',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFF161B22),
      elevation: 0,
      actions: [
        Consumer<BleControllerViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: _buildConnectionBadge(context, viewModel),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Connection status badge for AppBar with hover disconnect
  Widget _buildConnectionBadge(BuildContext context, BleControllerViewModel viewModel) {
    if (viewModel.isConnected) {
      // Connected state with hover to disconnect
      return _HoverDisconnectBadge(
        onDisconnect: () async {
          await viewModel.disconnect();
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const DeviceScanPage()),
            );
          }
        },
      );
    } else if (viewModel.isScanning || viewModel.isConnecting) {
      return _buildStatusBadge('搜索中...', const Color(0xFFF0883E), Icons.bluetooth_searching);
    } else {
      return _buildStatusBadge('断开', const Color(0xFFDA3633), Icons.bluetooth_disabled);
    }
  }
  
  Widget _buildStatusBadge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Connection status detail card
  Widget _buildConnectionStatusCard(BleControllerViewModel viewModel) {
    return Card(
      elevation: 8,
      color: const Color(0xFF161B22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF30363D).withOpacity(0.8),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Device Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: viewModel.isConnected
                      ? [const Color(0xFF238636), const Color(0xFF2EA043)]
                      : [const Color(0xFF8B949E), const Color(0xFF6E7681)],
                ),
              ),
              child: Icon(
                viewModel.isConnected
                    ? Icons.bluetooth_connected
                    : Icons.bluetooth_disabled,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 16),

            // Device Name
            Text(
              viewModel.connectedDevice?.name ?? BleUuids.targetDeviceName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Connection Details
            if (viewModel.isConnected) ...[
              Text(
                viewModel.connectedDevice?.id ?? '',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
            ] else if (viewModel.errorMessage != null) ...[
              Text(
                viewModel.errorMessage!,
                style: const TextStyle(
                  color: Color(0xFFDA3633),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Main slider control widget
  Widget _buildSliderControl(BleControllerViewModel viewModel) {
    return Column(
      children: [
        // Temperature Chart (NEW)
        if (viewModel.temperatureHistory.isNotEmpty)
          TemperatureChart(
            temperatureData: viewModel.temperatureHistory,
            currentTemperature: viewModel.currentTemperature,
          ),
        
        if (viewModel.temperatureHistory.isNotEmpty)
          const SizedBox(height: 32),
        
        // Heating Intensity Label
        const Text(
          '加热强度',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 32),

        // Current Value Display
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Color.lerp(
                  const Color(0xFF161B22),
                  const Color(0xFFF0883E),
                  _currentValue / 100,
                )!,
                const Color(0xFF161B22),
              ],
            ),
            border: Border.all(
              color: Color.lerp(
                const Color(0xFF30363D),
                const Color(0xFFF0883E),
                _currentValue / 100,
              )!,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              '${_currentValue.toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 48),

        // Horizontal Slider (CHANGED from vertical)
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 12,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 16,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 24,
            ),
            activeTrackColor: const Color(0xFFF0883E),
            inactiveTrackColor: const Color(0xFF30363D),
            thumbColor: const Color(0xFFF0883E),
            overlayColor: const Color(0xFFF0883E).withOpacity(0.2),
            valueIndicatorColor: const Color(0xFFF0883E),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${_currentValue.toInt()}%',
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
            onChangeEnd: (value) {
              // Send to BLE when user finishes adjusting
              viewModel.writeSliderValue(value.toInt());
            },
          ),
        ),

        const SizedBox(height: 32),

        // Value Range Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '100%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Last Sent Command Debug Info
        if (viewModel.lastSentCommandHex != '--')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF21262D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.send,
                  color: Color(0xFF58A6FF),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '最后发送: ${viewModel.lastSentCommandHex}',
                  style: const TextStyle(
                    color: Color(0xFF58A6FF),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Message shown when not connected
  Widget _buildDisconnectedMessage(BleControllerViewModel viewModel) {
    return Column(
      children: [
        Icon(
          Icons.power_off,
          size: 80,
          color: Colors.white.withOpacity(0.3),
        ),
        const SizedBox(height: 24),
        Text(
          viewModel.isScanning ? '正在搜索设备...' : '设备未连接',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        if (!viewModel.isScanning)
          ElevatedButton.icon(
            onPressed: () => viewModel.startScan(),
            icon: const Icon(Icons.refresh),
            label: const Text('重新扫描'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF238636),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
      ],
    );
  }
}

/// Hover-enabled disconnect badge
/// Shows "已连接" normally, changes to "断开连接" on hover
class _HoverDisconnectBadge extends StatefulWidget {
  final VoidCallback onDisconnect;
  
  const _HoverDisconnectBadge({required this.onDisconnect});

  @override
  State<_HoverDisconnectBadge> createState() => _HoverDisconnectBadgeState();
}

class _HoverDisconnectBadgeState extends State<_HoverDisconnectBadge> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovering 
        ? const Color(0xFFDA3633) 
        : const Color(0xFF3FB950);
    final text = _isHovering ? '断开连接' : '已连接';
    final icon = _isHovering 
        ? Icons.bluetooth_disabled 
        : Icons.bluetooth_connected;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onDisconnect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---
## File: ui\widgets\hold_action_button.dart
```dart
/// HoldActionButton - A custom button that sends BLE commands on press/release
/// 
/// This widget replicates the TouchDown/TouchUp behavior from MIT App Inventor:
/// - **onTapDown (TouchDown)**: Sends the "press" command (e.g., 0x01 for forward)
/// - **onTapUp (TouchUp)**: Sends the "release" command (e.g., 0x00 for stop)
/// - **onTapCancel**: Handles edge case when finger slides out of button area
/// 
/// Desktop support:
/// - MouseRegion adds "click" cursor on hover
/// - GestureDetector handles left mouse button as touch
/// 
/// Visual feedback includes scale animation and color change to simulate
/// physical button feel.
library;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Callback type for BLE command actions
typedef BleCommandCallback = Future<void> Function(List<int> data);

/// A button that executes different actions on press and release
/// 
/// Mimics the MIT App Inventor TouchDown/TouchUp pattern for BLE control.
/// 
/// Example usage:
/// ```dart
/// HoldActionButton(
///   label: 'FORWARD',
///   icon: Icons.arrow_upward,
///   pressCommand: [0x01],    // Send on TouchDown
///   releaseCommand: [0x00],  // Send on TouchUp/Cancel
///   onCommand: (data) async {
///     await bleService.writeBytes('FFE0', 'FFE1', data);
///   },
/// )
/// ```
class HoldActionButton extends StatefulWidget {
  /// Button label text
  final String label;
  
  /// Optional icon displayed above/beside the label
  final IconData? icon;
  
  /// Command bytes to send when button is pressed (TouchDown)
  /// Default: [0x01] (forward command)
  final List<int> pressCommand;
  
  /// Command bytes to send when button is released (TouchUp/Cancel)
  /// Default: [0x00] (stop command)
  final List<int> releaseCommand;
  
  /// Callback to execute BLE write operation
  /// Receives the command bytes to send
  final BleCommandCallback onCommand;
  
  /// Button size (width and height)
  final double size;
  
  /// Active color when button is pressed
  final Color activeColor;
  
  /// Inactive color when button is released
  final Color inactiveColor;
  
  /// Whether the button is enabled
  final bool enabled;
  
  /// Enable haptic feedback on press/release
  final bool hapticFeedback;

  const HoldActionButton({
    super.key,
    required this.label,
    required this.onCommand,
    this.icon,
    this.pressCommand = const [0x01],
    this.releaseCommand = const [0x00],
    this.size = 80.0,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.enabled = true,
    this.hapticFeedback = true,
  });

  @override
  State<HoldActionButton> createState() => _HoldActionButtonState();
}

class _HoldActionButtonState extends State<HoldActionButton>
    with SingleTickerProviderStateMixin {
  
  /// Tracks whether the button is currently being pressed
  bool _isPressed = false;
  
  /// Animation controller for scale effect
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup scale animation for visual feedback
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.92, // Shrink to 92% when pressed
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handle button press (TouchDown equivalent)
  /// 
  /// This is called when the user's finger touches the button.
  /// Sends the pressCommand (e.g., 0x01 for forward).
  void _handleTapDown(TapDownDetails details) {
    if (!widget.enabled) return;
    
    setState(() => _isPressed = true);
    _animationController.forward();
    
    // Haptic feedback for tactile response (mobile only)
    // Desktop platforms don't support haptic feedback
    if (widget.hapticFeedback && !_isDesktop) {
      HapticFeedback.mediumImpact();
    }
    
    // Send press command via BLE
    _sendCommand(widget.pressCommand);
  }
  
  /// Check if running on desktop platform
  bool get _isDesktop => 
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Handle button release (TouchUp equivalent)
  /// 
  /// This is called when the user lifts their finger from the button.
  /// Sends the releaseCommand (e.g., 0x00 for stop).
  void _handleTapUp(TapUpDetails details) {
    _release();
  }

  /// Handle finger sliding out of button area (TouchCancel equivalent)
  /// 
  /// IMPORTANT: This edge case is critical for control applications!
  /// 
  /// Scenario: User presses button, then slides finger outside the button
  /// area before lifting. Without handling this:
  /// - onTapUp would never fire
  /// - The device would continue executing the press command indefinitely
  /// 
  /// Solution: onTapCancel fires when the gesture is interrupted, ensuring
  /// the release command is ALWAYS sent.
  void _handleTapCancel() {
    _release();
  }

  /// Common release logic for both TapUp and TapCancel
  void _release() {
    if (!_isPressed) return;
    
    setState(() => _isPressed = false);
    _animationController.reverse();
    
    // Always send release command to ensure device stops
    _sendCommand(widget.releaseCommand);
  }

  /// Execute the BLE command callback
  Future<void> _sendCommand(List<int> command) async {
    try {
      await widget.onCommand(command);
    } catch (e) {
      // Log error but don't crash the UI
      debugPrint('HoldActionButton: Failed to send command $command: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // MouseRegion: Enables desktop "Vue-like" experience
      // - Cursor changes to pointer (hand) on hover
      // - GestureDetector still handles mouse clicks
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      child: MouseRegion(
        cursor: widget.enabled 
            ? SystemMouseCursors.click  // Hand cursor on hover
            : SystemMouseCursors.forbidden,
        child: GestureDetector(
          // Core touch/click event handlers:
          // - Mobile: finger touch
          // - Desktop: left mouse button
          onTapDown: _handleTapDown,   // TouchDown / MouseDown -> Send pressCommand
          onTapUp: _handleTapUp,       // TouchUp / MouseUp -> Send releaseCommand
          onTapCancel: _handleTapCancel, // Edge case: drag out of bounds
          
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              // Color changes based on press state
              color: _getButtonColor(),
              borderRadius: BorderRadius.circular(widget.size / 4),
              boxShadow: _isPressed
                  ? [] // No shadow when pressed (appears "pushed in")
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
              border: Border.all(
                color: _isPressed 
                    ? widget.activeColor.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: widget.size * 0.4,
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.size * 0.15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Determine button color based on state
  Color _getButtonColor() {
    if (!widget.enabled) {
      return widget.inactiveColor.withOpacity(0.5);
    }
    return _isPressed ? widget.activeColor : widget.inactiveColor;
  }
}

/// A directional pad composed of multiple HoldActionButtons
/// 
/// Provides a classic D-pad layout for directional control.
class DirectionalPad extends StatelessWidget {
  final BleCommandCallback onCommand;
  final double buttonSize;
  final bool enabled;

  const DirectionalPad({
    super.key,
    required this.onCommand,
    this.buttonSize = 70.0,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize * 3.5,
      height: buttonSize * 3.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // UP button
          Positioned(
            top: 0,
            child: HoldActionButton(
              label: 'UP',
              icon: Icons.arrow_upward,
              pressCommand: const [0x01],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // DOWN button
          Positioned(
            bottom: 0,
            child: HoldActionButton(
              label: 'DOWN',
              icon: Icons.arrow_downward,
              pressCommand: const [0x02],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // LEFT button
          Positioned(
            left: 0,
            child: HoldActionButton(
              label: 'LEFT',
              icon: Icons.arrow_back,
              pressCommand: const [0x03],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // RIGHT button
          Positioned(
            right: 0,
            child: HoldActionButton(
              label: 'RIGHT',
              icon: Icons.arrow_forward,
              pressCommand: const [0x04],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // Center indicator
          Container(
            width: buttonSize * 0.6,
            height: buttonSize * 0.6,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

---
## File: ui\widgets\temperature_chart.dart
```dart
/// Temperature Chart Widget
/// 
/// Displays real-time temperature data from PhysTrigger Vest
library;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temperatureData;
  final double currentTemperature;

  const TemperatureChart({
    super.key,
    required this.temperatureData,
    required this.currentTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF30363D),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Temperature Display
          Row(
            children: [
              const Icon(
                Icons.thermostat,
                color: Color(0xFFF0883E),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '${currentTemperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  color: Color(0xFFF0883E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '实时温度',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Line Chart
          Expanded(
            child: temperatureData.isEmpty
                ? Center(
                    child: Text(
                      '等待温度数据...',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 5,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: const Color(0xFF30363D),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 10,
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 29,
                      minY: _calculateMinY(),
                      maxY: _calculateMaxY(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _buildSpots(),
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF0883E),
                              Color(0xFFDA3633),
                            ],
                          ),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF0883E).withOpacity(0.3),
                                const Color(0xFFDA3633).withOpacity(0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    return List.generate(
      temperatureData.length,
      (index) => FlSpot(index.toDouble(), temperatureData[index]),
    );
  }

  double _calculateMinY() {
    if (temperatureData.isEmpty) return 0;
    final min = temperatureData.reduce((a, b) => a < b ? a : b);
    return (min - 5).floorToDouble();
  }

  double _calculateMaxY() {
    if (temperatureData.isEmpty) return 50;
    final max = temperatureData.reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }
}

```

---

```

---
## File: lib\main.dart
```dart
/// PhysTrigger Heating Vest - Main Entry Point
///
/// Implements robust error handling via runZonedGuarded and strict initialization order.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'ui/screens/device_scan_page.dart';

Future<void> main() async {
  // Fix 2: Safety Wrapper
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Catch-all for Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('[FLUTTER ERROR] ${details.exception}');
      debugPrint('[STACK TRACE] ${details.stack}');
    };

    runApp(const PhysTriggerApp());
  }, (Object error, StackTrace stack) {
    // Catch-all for async/Dart errors
    debugPrint('[FATAL APP ERROR] $error');
    debugPrint('[STACK TRACE] $stack');
  });
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Layer 1: BLE Service
        Provider<IBleService>(
          create: (_) => FlutterBluePlusService(),
          dispose: (_, service) => service.dispose(),
        ),

        // Layer 2: ViewModel
        ChangeNotifierProxyProvider<IBleService, BleControllerViewModel>(
          create: (context) {
            final viewModel = BleControllerViewModel(
              context.read<IBleService>(),
            );
            // Critical: Initialize permission/scan logic AFTER creation
            viewModel.initialize();
            return viewModel;
          },
          update: (_, service, viewModel) =>
              viewModel ?? BleControllerViewModel(service),
        ),
      ],
      child: MaterialApp(
        title: 'PhysTrigger Heating Vest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0D1117),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF58A6FF),
            secondary: Color(0xFF238636),
            surface: Color(0xFF161B22),
          ),
          fontFamily: 'Segoe UI',
          useMaterial3: true,
        ),
        home: const DeviceScanPage(),
      ),
    );
  }
}

```

---
## File: lib\core\core.dart
```dart
/// Core module exports
///
/// Provides a single import point for all core functionality.
/// This barrel file exposes the public API of the core module.
library;

// ═══════════════════════════════════════════════════════════════════════════
// Interfaces (Contracts)
// ═══════════════════════════════════════════════════════════════════════════
export 'interfaces/i_ble_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Domain Models
// ═══════════════════════════════════════════════════════════════════════════
export 'models/ble_device.dart';
export 'models/ble_connection_state.dart';
export 'models/ble_service_info.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Exceptions
// ═══════════════════════════════════════════════════════════════════════════
export 'exceptions/ble_exception.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Services (Implementations)
// ═══════════════════════════════════════════════════════════════════════════
export 'services/flutter_blue_plus_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Utilities
// ═══════════════════════════════════════════════════════════════════════════
export 'utils/byte_utils.dart';
export 'utils/result.dart';
export 'utils/android_permissions.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ViewModels
// ═══════════════════════════════════════════════════════════════════════════
export 'viewmodels/ble_controller_viewmodel.dart';

```

---
## File: lib\core\exceptions\ble_exception.dart
```dart
/// Comprehensive exception hierarchy for BLE operations.
///
/// Uses Dart 3 sealed classes for exhaustive pattern matching support.
/// Each exception type carries contextual information for debugging.
library;

/// Base exception for all BLE-related errors.
///
/// This is a sealed class enabling exhaustive switch statements:
/// ```dart
/// switch (exception) {
///   case BlePermissionDeniedException():
///     // Handle permission denial
///   case BleAdapterException():
///     // Handle adapter issues
///   // ... all cases must be handled
/// }
/// ```
sealed class BleException implements Exception {
  /// Human-readable error message.
  final String message;

  /// Original error from the underlying library (for debugging).
  final Object? cause;

  const BleException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return '$runtimeType: $message\nCaused by: $cause';
    }
    return '$runtimeType: $message';
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Permission Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when required permissions are not granted.
final class BlePermissionDeniedException extends BleException {
  /// Which permission was denied.
  final BlePermissionType permissionType;

  const BlePermissionDeniedException(
    this.permissionType, [
    String message = 'Required permission was denied',
    Object? cause,
  ]) : super(message, cause);
}

/// Types of permissions required for BLE operations.
enum BlePermissionType {
  /// General Bluetooth permission.
  bluetooth,

  /// Location permission (required on Android 11 and below for scanning).
  location,

  /// Bluetooth scan permission (Android 12+).
  bluetoothScan,

  /// Bluetooth connect permission (Android 12+).
  bluetoothConnect,
}

// ═══════════════════════════════════════════════════════════════════════════
// Adapter State Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when Bluetooth adapter is not available or turned off.
final class BleAdapterException extends BleException {
  /// Current state of the adapter.
  final BleAdapterState adapterState;

  const BleAdapterException(
    this.adapterState, [
    String message = 'Bluetooth adapter is not ready',
    Object? cause,
  ]) : super(message, cause);
}

/// States of the Bluetooth adapter.
enum BleAdapterState {
  /// Adapter state is unknown.
  unknown,

  /// Adapter is not available on this device.
  unavailable,

  /// Bluetooth is turned off.
  off,

  /// Bluetooth is turning on.
  turningOn,

  /// Bluetooth is on and ready.
  on,

  /// Bluetooth is turning off.
  turningOff,
}

// ═══════════════════════════════════════════════════════════════════════════
// Connection Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when connection times out.
final class BleConnectionTimeoutException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  /// Timeout duration that was exceeded.
  final Duration timeout;

  const BleConnectionTimeoutException(
    this.deviceId,
    this.timeout, [
    String message = 'Connection timed out',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when connection fails for reasons other than timeout.
final class BleConnectionFailedException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  const BleConnectionFailedException(
    this.deviceId, [
    String message = 'Failed to establish connection',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when an operation requires a connection but device is not connected.
final class BleNotConnectedException extends BleException {
  const BleNotConnectedException([
    String message = 'No device is connected',
    Object? cause,
  ]) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Operation Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when a write operation fails.
final class BleWriteException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleWriteException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Write operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a read operation fails.
final class BleReadException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleReadException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Read operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when service discovery fails.
final class BleServiceDiscoveryException extends BleException {
  const BleServiceDiscoveryException([
    String message = 'Failed to discover services',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a requested service or characteristic is not found.
final class BleCharacteristicNotFoundException extends BleException {
  /// Service UUID that was searched (may be null if not applicable).
  final String? serviceUuid;

  /// Characteristic UUID that was not found.
  final String? characteristicUuid;

  const BleCharacteristicNotFoundException({
    this.serviceUuid,
    this.characteristicUuid,
    String message = 'Characteristic not found',
    Object? cause,
  }) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Scan Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when scanning fails.
final class BleScanException extends BleException {
  const BleScanException([
    String message = 'Scan operation failed',
    Object? cause,
  ]) : super(message, cause);
}

```

---
## File: lib\core\interfaces\i_ble_service.dart
```dart
/// Pure abstract interface for BLE communication layer.
///
/// All return types are Domain Models, never exposing third-party library types.
/// This ensures the UI layer remains completely decoupled from implementation details.
///
/// Implementations must handle platform-specific permissions:
/// - Android 10-11: ACCESS_FINE_LOCATION
/// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT
/// - iOS: Bluetooth usage description in Info.plist
/// - Windows: No special permissions required
library;

import 'dart:async';

import '../exceptions/ble_exception.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Abstract interface for BLE service operations.
///
/// Follows Interface Segregation Principle - clients depend only on
/// the methods they use.
abstract class IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Reactive Streams (Observable State)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Stream of discovered devices during scanning.
  ///
  /// Emits [BleDevice] objects as they are discovered.
  /// The stream continues until [stopScan] is called or timeout expires.
  Stream<BleDevice> get scanResults;

  /// Stream of connection state changes.
  ///
  /// Emits [BleConnectionState] whenever the connection state changes.
  /// UI should react to this stream to update connection indicators.
  Stream<BleConnectionState> get connectionState;

  /// Stream of raw data received from characteristic notifications.
  ///
  /// Emits byte arrays when subscribed characteristics send data.
  /// Must call [subscribeToNotifications] first to receive data.
  Stream<List<int>> get dataReceived;

  /// Current connection state (synchronous access).
  BleConnectionState get currentConnectionState;

  /// Currently connected device, or null if not connected.
  BleDevice? get connectedDevice;

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// [filterByServiceUuids] - Optional UUIDs to filter devices.
  ///   Only devices advertising these services will be reported.
  /// [timeout] - Auto-stop scanning after this duration (default: 10s).
  ///
  /// Results are emitted via [scanResults] stream.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if permissions are not granted
  /// - [BleAdapterException] if Bluetooth is off
  /// - [BleScanException] for other scan failures
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  });

  /// Stop ongoing scan.
  ///
  /// Safe to call even if no scan is in progress.
  Future<void> stopScan();

  /// Whether a scan is currently running.
  bool get isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a device by its unique identifier.
  ///
  /// [deviceId] - Platform-specific ID (MAC on Android, UUID on iOS/Windows).
  /// [timeout] - Connection timeout (default: 15s).
  ///
  /// After successful connection, [connectionState] stream emits [BleConnectionState.connected].
  ///
  /// Throws:
  /// - [BleConnectionTimeoutException] if connection times out
  /// - [BleConnectionFailedException] for other connection failures
  /// - [BleAdapterException] if Bluetooth is off
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  });

  /// Disconnect from currently connected device.
  ///
  /// Safe to call even if not connected.
  /// After disconnection, [connectionState] stream emits [BleConnectionState.disconnected].
  Future<void> disconnect();

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover all services and characteristics on connected device.
  ///
  /// Must be called after successful [connect].
  /// Returns a list of [BleServiceInfo] containing service and characteristic metadata.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleServiceDiscoveryException] if discovery fails
  Future<List<BleServiceInfo>> discoverServices();

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Write bytes to a characteristic.
  ///
  /// [serviceUuid] - Target service UUID.
  /// [characteristicUuid] - Target characteristic UUID.
  /// [data] - Bytes to write (0-255 range per element).
  /// [withResponse] - If true, wait for write confirmation (slower but reliable).
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleWriteException] if write fails
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  });

  /// Read bytes from a characteristic.
  ///
  /// Returns the current value of the characteristic.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleReadException] if read fails
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Subscribe to notifications on a characteristic.
  ///
  /// After subscription, data will be emitted via [dataReceived] stream.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Unsubscribe from notifications on a characteristic.
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  /// Initialize the BLE service.
  ///
  /// Should be called once at app startup.
  /// Requests necessary permissions based on platform.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if required permissions are denied
  /// - [BleAdapterException] if Bluetooth is unavailable
  Future<void> initialize();

  /// Release all resources.
  ///
  /// Disconnects from any connected device and cleans up streams.
  /// Should be called when the service is no longer needed.
  Future<void> dispose();
}

```

---
## File: lib\core\models\ble_connection_state.dart
```dart
/// Connection state enumeration for BLE devices.
///
/// Represents the lifecycle of a BLE connection:
/// disconnected → connecting → connected → disconnecting → disconnected
library;

/// Connection state for BLE device.
enum BleConnectionState {
  /// No active connection.
  disconnected,

  /// Connection attempt in progress.
  connecting,

  /// Successfully connected and ready for operations.
  connected,

  /// Disconnection in progress.
  disconnecting,
}

/// Extension methods for [BleConnectionState].
extension BleConnectionStateX on BleConnectionState {
  /// Whether data operations (read/write) are currently possible.
  bool get isOperational => this == BleConnectionState.connected;

  /// Whether a state transition is in progress.
  bool get isTransitioning =>
      this == BleConnectionState.connecting ||
      this == BleConnectionState.disconnecting;

  /// Whether the device is not connected (disconnected or disconnecting).
  bool get isDisconnected =>
      this == BleConnectionState.disconnected ||
      this == BleConnectionState.disconnecting;

  /// Human-readable label for UI display.
  String get label {
    switch (this) {
      case BleConnectionState.disconnected:
        return 'Disconnected';
      case BleConnectionState.connecting:
        return 'Connecting...';
      case BleConnectionState.connected:
        return 'Connected';
      case BleConnectionState.disconnecting:
        return 'Disconnecting...';
    }
  }

  /// Icon code point for Material Icons.
  int get iconCodePoint {
    switch (this) {
      case BleConnectionState.disconnected:
        return 0xe1b2; // bluetooth_disabled
      case BleConnectionState.connecting:
        return 0xe1a7; // bluetooth_searching
      case BleConnectionState.connected:
        return 0xe1a8; // bluetooth_connected
      case BleConnectionState.disconnecting:
        return 0xe1a7; // bluetooth_searching
    }
  }
}

```

---
## File: lib\core\models\ble_device.dart
```dart
/// Domain model representing a discovered BLE device.
///
/// This is a pure data class with no dependencies on third-party libraries,
/// ensuring the UI layer remains decoupled from BLE implementation details.
library;

import 'package:flutter/foundation.dart';

/// Immutable representation of a discovered BLE device.
@immutable
class BleDevice {
  /// Unique identifier (MAC address on Android, UUID on iOS/Windows).
  final String id;

  /// Advertised device name (may be empty if not advertised).
  final String name;

  /// Signal strength in dBm (typically -30 to -100).
  final int rssi;

  /// List of advertised service UUIDs.
  final List<String> serviceUuids;

  /// Raw manufacturer-specific data keyed by company identifier.
  final Map<int, List<int>> manufacturerData;

  const BleDevice({
    required this.id,
    this.name = '',
    this.rssi = 0,
    this.serviceUuids = const [],
    this.manufacturerData = const {},
  });

  /// Whether this device has a valid advertised name.
  bool get hasName => name.isNotEmpty;

  /// Signal strength category based on RSSI.
  BleSignalStrength get signalStrength {
    if (rssi >= -50) return BleSignalStrength.excellent;
    if (rssi >= -60) return BleSignalStrength.good;
    if (rssi >= -70) return BleSignalStrength.fair;
    return BleSignalStrength.weak;
  }

  /// Create a copy with updated values.
  BleDevice copyWith({
    String? id,
    String? name,
    int? rssi,
    List<String>? serviceUuids,
    Map<int, List<int>>? manufacturerData,
  }) {
    return BleDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      rssi: rssi ?? this.rssi,
      serviceUuids: serviceUuids ?? this.serviceUuids,
      manufacturerData: manufacturerData ?? this.manufacturerData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BleDevice && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BleDevice(id: $id, name: $name, rssi: $rssi)';
}

/// Signal strength categories based on RSSI values.
enum BleSignalStrength {
  /// RSSI >= -50 dBm
  excellent,

  /// RSSI >= -60 dBm
  good,

  /// RSSI >= -70 dBm
  fair,

  /// RSSI < -70 dBm
  weak,
}

```

---
## File: lib\core\models\ble_service_info.dart
```dart
/// Domain models for BLE service and characteristic discovery results.
///
/// These models abstract away the underlying BLE library's data structures,
/// providing a clean interface for the UI layer.
library;

import 'package:flutter/foundation.dart';

/// Represents a discovered BLE service.
@immutable
class BleServiceInfo {
  /// Service UUID (typically in 128-bit or 16-bit format).
  final String uuid;

  /// List of characteristics discovered within this service.
  final List<BleCharacteristicInfo> characteristics;

  const BleServiceInfo({
    required this.uuid,
    this.characteristics = const [],
  });

  /// Find a characteristic by UUID.
  BleCharacteristicInfo? findCharacteristic(String characteristicUuid) {
    final normalizedUuid = characteristicUuid.toLowerCase();
    return characteristics.cast<BleCharacteristicInfo?>().firstWhere(
          (c) => c!.uuid.toLowerCase() == normalizedUuid,
          orElse: () => null,
        );
  }

  @override
  String toString() =>
      'BleServiceInfo(uuid: $uuid, characteristics: ${characteristics.length})';
}

/// Represents a discovered BLE characteristic.
@immutable
class BleCharacteristicInfo {
  /// Characteristic UUID.
  final String uuid;

  /// Whether this characteristic supports read operations.
  final bool canRead;

  /// Whether this characteristic supports write with response.
  final bool canWrite;

  /// Whether this characteristic supports write without response.
  final bool canWriteWithoutResponse;

  /// Whether this characteristic supports notifications.
  final bool canNotify;

  /// Whether this characteristic supports indications.
  final bool canIndicate;

  const BleCharacteristicInfo({
    required this.uuid,
    this.canRead = false,
    this.canWrite = false,
    this.canWriteWithoutResponse = false,
    this.canNotify = false,
    this.canIndicate = false,
  });

  /// Whether any write operation is supported.
  bool get isWriteable => canWrite || canWriteWithoutResponse;

  /// Whether any subscription mode is supported.
  bool get isSubscribable => canNotify || canIndicate;

  @override
  String toString() => 'BleCharacteristicInfo(uuid: $uuid, '
      'read: $canRead, write: $canWrite, notify: $canNotify)';
}

```

---
## File: lib\core\services\flutter_blue_plus_service.dart
```dart
/// FlutterBluePlus implementation of [IBleService].
///
/// This class provides the concrete BLE functionality using the `flutter_blue_plus`
/// library. It handles all platform differences (Windows, Android, iOS) transparently
/// and maps all library-specific types to our domain models.
///
/// ## Architecture Notes
/// - All FBP types are converted to domain models at the boundary
/// - Stream subscriptions are carefully managed to prevent memory leaks
/// - Exceptions are translated to our [BleException] hierarchy
///
/// ## Usage
/// ```dart
/// final bleService = FlutterBluePlusService();
/// await bleService.initialize();
///
/// bleService.scanResults.listen((device) {
///   print('Found: ${device.name}');
/// });
///
/// await bleService.scan();
/// ```
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart' hide BleDevice;
import 'package:permission_handler/permission_handler.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Concrete implementation of [IBleService] using flutter_blue_plus.
///
/// This implementation:
/// - Supports Android, iOS, macOS, Windows, and Linux
/// - Handles platform-specific permission requirements
/// - Converts all FBP types to domain models
/// - Provides comprehensive error handling
class FlutterBluePlusService implements IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Private State
  // ═══════════════════════════════════════════════════════════════════════════

  /// Currently connected FBP device (internal reference).
  BluetoothDevice? _fbpDevice;

  /// Discovered services cache (for characteristic lookup).
  List<BluetoothService>? _discoveredServices;

  /// Scan results stream controller.
  final StreamController<BleDevice> _scanResultsController =
      StreamController<BleDevice>.broadcast();

  /// Connection state stream controller.
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  /// Data received stream controller (for notifications).
  final StreamController<List<int>> _dataReceivedController =
      StreamController<List<int>>.broadcast();

  /// Current connection state cache.
  BleConnectionState _currentConnectionState = BleConnectionState.disconnected;

  /// Connected device info cache.
  BleDevice? _connectedDevice;

  /// Whether a scan is currently running.
  bool _isScanning = false;

  /// Active subscriptions for cleanup.
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;
  final List<StreamSubscription<List<int>>> _notificationSubscriptions = [];

  /// Guard flag to prevent cleanup during active connection flow.
  /// This prevents the connection listener from nullifying _fbpDevice
  /// when transient 'disconnected' states occur during handshake.
  bool _isConnecting = false;

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Reactive Streams
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Stream<BleDevice> get scanResults => _scanResultsController.stream;

  @override
  Stream<BleConnectionState> get connectionState =>
      _connectionStateController.stream;

  @override
  Stream<List<int>> get dataReceived => _dataReceivedController.stream;

  @override
  BleConnectionState get currentConnectionState => _currentConnectionState;

  @override
  BleDevice? get connectedDevice => _connectedDevice;

  @override
  bool get isScanning => _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> initialize() async {
    try {
      // Check if Bluetooth is supported on this device
      if (await FlutterBluePlus.isSupported == false) {
        throw const BleAdapterException(
          BleAdapterState.unavailable,
          'Bluetooth is not supported on this device',
        );
      }

      // Request platform-specific permissions
      await _requestPermissions();

      // Check adapter state
      // On Windows, we must explicitly wait for the adapter to be ready
      // unlike Android where we can try to turn it on.
      if (Platform.isWindows) {
        await FlutterBluePlus.adapterState
            .where((state) => state == BluetoothAdapterState.on)
            .first
            .timeout(
              const Duration(seconds: 3),
              onTimeout: () => throw const BleAdapterException(
                BleAdapterState.off,
                'Bluetooth adapter not ready. Please check if Bluetooth is enabled.',
              ),
            );
      } else {
        final adapterState = await FlutterBluePlus.adapterState.first;
        if (adapterState != BluetoothAdapterState.on) {
          // Attempt to turn on Bluetooth (Android only)
          if (Platform.isAndroid) {
            try {
              await FlutterBluePlus.turnOn();
              // Wait for adapter to be on (with timeout)
              await FlutterBluePlus.adapterState
                  .where((state) => state == BluetoothAdapterState.on)
                  .first
                  .timeout(const Duration(seconds: 10));
            } catch (e) {
              throw BleAdapterException(
                _mapAdapterState(adapterState),
                'Failed to enable Bluetooth. Please enable it manually.',
                e,
              );
            }
          } else {
            throw BleAdapterException(
              _mapAdapterState(adapterState),
              'Bluetooth is turned off. Please enable Bluetooth in Settings.',
            );
          }
        }
      }

      debugPrint('FlutterBluePlusService: Initialized successfully');
    } on BleException {
      rethrow;
    } catch (e) {
      throw BleAdapterException(
        BleAdapterState.unknown,
        'Failed to initialize BLE service',
        e,
      );
    }
  }

  @override
  Future<void> dispose() async {
    // Cancel all subscriptions
    await _scanSubscription?.cancel();
    await _connectionSubscription?.cancel();
    for (final sub in _notificationSubscriptions) {
      await sub.cancel();
    }
    _notificationSubscriptions.clear();

    // Disconnect if connected
    await disconnect();

    // Close stream controllers
    await _scanResultsController.close();
    await _connectionStateController.close();
    await _dataReceivedController.close();

    debugPrint('FlutterBluePlusService: Disposed');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Scanning
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      // Verify adapter is on
      await _ensureAdapterOn();

      // Convert service UUIDs to FBP Guid format
      final List<Guid> withServices = filterByServiceUuids
              ?.map((uuid) => Guid(uuid))
              .toList() ??
          [];

      // Start scanning
      _isScanning = true;

      // Safety: Ensure any previous scan is stopped to prevent state conflicts
      // This fixes common "already scanning" errors on Windows/Android
      try {
        await FlutterBluePlus.stopScan();
      } catch (e) {
        // Ignore errors stopping scan
      }

      await FlutterBluePlus.startScan(
        withServices: withServices,
        timeout: timeout,
        androidUsesFineLocation: false,
      );

      // Listen to scan results and convert to domain model
      _scanSubscription = FlutterBluePlus.scanResults.listen(
        (results) {
          for (final result in results) {
            final device = _mapScanResultToDevice(result);
            _scanResultsController.add(device);
          }
        },
        onError: (error) {
          debugPrint('FlutterBluePlusService: Stream Error: $error');
          _scanResultsController.addError(
            BleScanException('Scan stream error', error),
          );
        },
      );

      // Auto-stop when scan completes
      FlutterBluePlus.isScanning.where((s) => !s).first.then((_) {
        _isScanning = false;
      });

      debugPrint('FlutterBluePlusService: Scan started');
    } on BleException {
      _isScanning = false;
      rethrow;
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Raw Scan Error: $e');
      throw BleScanException('Failed to start scan: $e', e);
    }
  }

  @override
  Future<void> stopScan() async {
    try {
      await FlutterBluePlus.stopScan();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Scan stopped');
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Error stopping scan: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Constants - UUIDs
  // ═══════════════════════════════════════════════════════════════════════════
  static const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String CHAR_UUID_CTRL = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Connection
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    _isConnecting = true; // Guard against premature cleanup
    try {
      _updateConnectionState(BleConnectionState.connecting);

      // Get device reference from ID
      // Use BluetoothDeviceWindows.fromId which properly handles Windows platform
      // by delegating to WinBle, and falls back to standard FBP for Android.
      final device = BluetoothDeviceWindows.fromId(deviceId);
      _fbpDevice = device;
      
      debugPrint('FlutterBluePlusService: Connecting to device. Type: ${device.runtimeType}');

      // Setup connection state listener BEFORE connecting
      _connectionSubscription?.cancel();
      _connectionSubscription = device.connectionState.listen((state) {
        final mappedState = _mapConnectionState(state);
        _updateConnectionState(mappedState);

        // Only cleanup if truly disconnected AND not mid-connect
        // (transient disconnected states occur during handshake)
        if (state == BluetoothConnectionState.disconnected && !_isConnecting) {
          _cleanupConnection();
        }
      });

      // Attempt connection
      await device.connect(
        timeout: timeout,
        autoConnect: false,
      );

      // ───────────────────────────────────────────────────────────────────────
      // CRITICAL: Wait for GATT Layer to be Ready
      // ───────────────────────────────────────────────────────────────────────
      // device.connect() returning does NOT guarantee the GATT layer is ready
      // for discoverServices(), especially on Android. We must explicitly wait
      // for the connection state stream to emit 'connected'.
      debugPrint('FlutterBluePlusService: Waiting for GATT layer negotiation...');
      try {
        await device.connectionState
            .where((state) => state == BluetoothConnectionState.connected)
            .first
            .timeout(
              const Duration(seconds: 5),
              onTimeout: () => throw BleConnectionFailedException(
                deviceId,
                'Physical link negotiation timed out',
              ),
            );
        debugPrint('FlutterBluePlusService: GATT layer ready.');
      } on BleConnectionFailedException {
        rethrow;
      } catch (e) {
        throw BleConnectionFailedException(
          deviceId,
          'Physical link negotiation timed out',
          e,
        );
      }

      // Re-assign device reference after successful GATT negotiation
      // to ensure it wasn't cleared by any transient state changes
      _fbpDevice = device;

      // ───────────────────────────────────────────────────────────────────────
      // Android Specific: Request High MTU
      // ───────────────────────────────────────────────────────────────────────
      if (Platform.isAndroid) {
        try {
          await device.requestMtu(512);
        } catch (e) {
          debugPrint('Failed to request MTU: $e');
          // Non-fatal, continue
        }
      }

      // ───────────────────────────────────────────────────────────────────────
      // Safe Discovery & Validation
      // ───────────────────────────────────────────────────────────────────────
      _discoveredServices = await device.discoverServices();

      // Validate Service Exists
      final service = _discoveredServices?.firstWhere(
        (s) => s.uuid.str.toLowerCase() == SERVICE_UUID.toLowerCase(),
        orElse: () => throw BleServiceDiscoveryException(
          'Target Service NOT found: $SERVICE_UUID',
        ),
      );

      // Validate Characteristic Exists
      // We check for CTRL characteristic as a minimum requirement
      final char = service?.characteristics.firstWhere(
        (c) => c.uuid.str.toLowerCase() == CHAR_UUID_CTRL.toLowerCase(),
        orElse: () => throw BleCharacteristicNotFoundException(
          serviceUuid: SERVICE_UUID,
          characteristicUuid: CHAR_UUID_CTRL,
          message: 'Target Characteristic NOT found: $CHAR_UUID_CTRL',
        ),
      );

      if (service == null || char == null) {
         // Should be caught by orElse, but double check
         throw BleConnectionFailedException(deviceId, 'Service or Characteristic validation failed');
      }

      // Cache connected device info
      _connectedDevice = BleDevice(
        id: deviceId,
        name: device.platformName.isNotEmpty
            ? device.platformName
            : 'Unknown Device',
        rssi: 0,
      );

      debugPrint('FlutterBluePlusService: Connected & Validated $deviceId');
    } on TimeoutException {
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionTimeoutException(deviceId, timeout);
    } on BleException {
      // Disconnect to clean up if validation failed
      await _fbpDevice?.disconnect(); 
      _updateConnectionState(BleConnectionState.disconnected);
      rethrow;
    } catch (e) {
      // Disconnect to clean up
      await _fbpDevice?.disconnect();
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionFailedException(
        deviceId,
        'Failed to connect: ${e.toString()}',
        e,
      );
    } finally {
      _isConnecting = false; // Always clear guard flag
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      _updateConnectionState(BleConnectionState.disconnecting);

      await _connectionSubscription?.cancel();
      _connectionSubscription = null;

      if (_fbpDevice != null) {
        await _fbpDevice!.disconnect();
      }

      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);

      debugPrint('FlutterBluePlusService: Disconnected');
    } catch (e) {
      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);
      debugPrint('FlutterBluePlusService: Disconnect error: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<List<BleServiceInfo>> discoverServices() async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    try {
      _discoveredServices = await _fbpDevice!.discoverServices();

      final services = _discoveredServices!.map((fbpService) {
        final characteristics = fbpService.characteristics.map((fbpChar) {
          return BleCharacteristicInfo(
            uuid: fbpChar.uuid.str.toUpperCase(),
            canRead: fbpChar.properties.read,
            canWrite: fbpChar.properties.write,
            canWriteWithoutResponse: fbpChar.properties.writeWithoutResponse,
            canNotify: fbpChar.properties.notify,
            canIndicate: fbpChar.properties.indicate,
          );
        }).toList();

        return BleServiceInfo(
          uuid: fbpService.uuid.str.toUpperCase(),
          characteristics: characteristics,
        );
      }).toList();

      debugPrint(
          'FlutterBluePlusService: Discovered ${services.length} services');
      return services;
    } catch (e) {
      throw BleServiceDiscoveryException('Failed to discover services', e);
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      // Determine write mode based on characteristic properties and request
      final useWithoutResponse =
          characteristic.properties.writeWithoutResponse && !withResponse;

      await characteristic.write(
        data,
        withoutResponse: useWithoutResponse,
      );

      debugPrint(
        'FlutterBluePlusService: Wrote ${data.length} bytes '
        '(withoutResponse: $useWithoutResponse)',
      );
    } catch (e) {
      throw BleWriteException(serviceUuid, characteristicUuid,
          'Write operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      final value = await characteristic.read();
      debugPrint('FlutterBluePlusService: Read ${value.length} bytes');
      return value;
    } catch (e) {
      throw BleReadException(serviceUuid, characteristicUuid,
          'Read operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(true);

      final subscription = characteristic.onValueReceived.listen((value) {
        _dataReceivedController.add(value);
      });
      _notificationSubscriptions.add(subscription);

      debugPrint(
        'FlutterBluePlusService: Subscribed to notifications on $characteristicUuid',
      );
    } catch (e) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
        message: 'Failed to subscribe to notifications: ${e.toString()}',
        cause: e,
      );
    }
  }

  @override
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(false);
      debugPrint(
        'FlutterBluePlusService: Unsubscribed from notifications on $characteristicUuid',
      );
    } catch (e) {
      debugPrint('FlutterBluePlusService: Error unsubscribing: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Private Helper Methods
  // ═══════════════════════════════════════════════════════════════════════════

  /// Request platform-specific permissions.
  Future<void> _requestPermissions() async {
    if (!Platform.isAndroid) return;

    // Android 12+ (API 31+) requires new Bluetooth permissions
    if (await _isAndroid12OrHigher()) {
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (scanStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.bluetoothScan);
      }
      if (connectStatus.isDenied) {
        throw const BlePermissionDeniedException(
            BlePermissionType.bluetoothConnect);
      }
    } else {
      // Android 10-11 requires location permission for scanning
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.location);
      }
    }
  }

  /// Check if running Android 12 (API 31) or higher.
  Future<bool> _isAndroid12OrHigher() async {
    // If bluetoothScan permission exists and isn't permanently denied due to
    // API level, we're on Android 12+
    final status = await Permission.bluetoothScan.status;
    return status != PermissionStatus.permanentlyDenied;
  }

  /// Ensure Bluetooth adapter is on before operations.
  Future<void> _ensureAdapterOn() async {
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      throw BleAdapterException(
        _mapAdapterState(adapterState),
        'Bluetooth is not enabled',
      );
    }
  }

  /// Map FBP ScanResult to our BleDevice domain model.
  BleDevice _mapScanResultToDevice(ScanResult result) {
    // Extract service UUIDs from advertisement data
    final serviceUuids = result.advertisementData.serviceUuids
        .map((guid) => guid.str.toUpperCase())
        .toList();

    // Extract manufacturer data
    final manufacturerData = <int, List<int>>{};
    result.advertisementData.manufacturerData.forEach((key, value) {
      manufacturerData[key] = value;
    });

    return BleDevice(
      // RemoteId works consistently across platforms when converted to string
      id: result.device.remoteId.str,
      name: result.device.platformName.isNotEmpty
          ? result.device.platformName
          : result.advertisementData.advName,
      rssi: result.rssi,
      serviceUuids: serviceUuids,
      manufacturerData: manufacturerData,
    );
  }

  /// Map FBP BluetoothConnectionState to our BleConnectionState.
  BleConnectionState _mapConnectionState(BluetoothConnectionState fbpState) {
    switch (fbpState) {
      case BluetoothConnectionState.disconnected:
        return BleConnectionState.disconnected;
      case BluetoothConnectionState.connected:
        return BleConnectionState.connected;
      default:
        // FBP doesn't have connecting/disconnecting states in the enum,
        // but they are implied during operations
        return BleConnectionState.disconnected;
    }
  }

  /// Map FBP BluetoothAdapterState to our BleAdapterState.
  BleAdapterState _mapAdapterState(BluetoothAdapterState fbpState) {
    switch (fbpState) {
      case BluetoothAdapterState.unknown:
        return BleAdapterState.unknown;
      case BluetoothAdapterState.unavailable:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.unauthorized:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.turningOn:
        return BleAdapterState.turningOn;
      case BluetoothAdapterState.on:
        return BleAdapterState.on;
      case BluetoothAdapterState.turningOff:
        return BleAdapterState.turningOff;
      case BluetoothAdapterState.off:
        return BleAdapterState.off;
    }
  }

  /// Update connection state and notify listeners.
  void _updateConnectionState(BleConnectionState state) {
    if (_currentConnectionState != state) {
      _currentConnectionState = state;
      _connectionStateController.add(state);
      debugPrint('FlutterBluePlusService: Connection state -> ${state.label}');
    }
  }

  /// Cleanup connection-related state.
  void _cleanupConnection() {
    _fbpDevice = null;
    _discoveredServices = null;
    _connectedDevice = null;

    // Cancel notification subscriptions
    for (final sub in _notificationSubscriptions) {
      sub.cancel();
    }
    _notificationSubscriptions.clear();
  }

  /// Find a characteristic by service and characteristic UUID.
  ///
  /// Throws [BleNotConnectedException] if not connected.
  /// Throws [BleCharacteristicNotFoundException] if not found.
  Future<BluetoothCharacteristic> _findCharacteristic(
    String serviceUuid,
    String characteristicUuid,
  ) async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    // Discover services if not already done
    if (_discoveredServices == null) {
      await discoverServices();
    }

    final normalizedServiceUuid = serviceUuid.toUpperCase();
    final normalizedCharUuid = characteristicUuid.toUpperCase();

    // Find the service
    BluetoothService? targetService;
    for (final service in _discoveredServices!) {
      if (service.uuid.str.toUpperCase() == normalizedServiceUuid) {
        targetService = service;
        break;
      }
    }

    if (targetService == null) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        message: 'Service not found: $serviceUuid',
      );
    }

    // Find the characteristic
    for (final char in targetService.characteristics) {
      if (char.uuid.str.toUpperCase() == normalizedCharUuid) {
        return char;
      }
    }

    throw BleCharacteristicNotFoundException(
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
      message: 'Characteristic not found: $characteristicUuid',
    );
  }
}

```

---
## File: lib\core\utils\android_permissions.dart
```dart
/// Android BLE Permission Helper - Bulletproof Implementation
///
/// Handles Android 12+ (API 31+) split permissions and Legacy (API < 31) location permissions.
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Request BLE permissions with logic for all Android versions.
///
/// Returns `true` only if crucial permissions are granted.
Future<bool> requestAndroidPermissions({
  VoidCallback? onOpenSettings,
}) async {
  if (!Platform.isAndroid) return true;

  // Use permission_handler's built-in SDK check/support
  // It automatically handles manifest merging if configured correctly,
  // but explicit requests are safer.
  
  Map<Permission, PermissionStatus> statuses;

  // Check if we are potentially on Android 12+
  // We can infer this if BLUETOOTH_SCAN is supported/declared.
  // Note: Permission.bluetoothScan.status won't crash on older Android, 
  // it just returns restricted/denied usually.
  
  // Strategy: Request everything relevant.
  // The plugin handles API level checks internally.
  
  if (await Permission.bluetoothScan.status.isRestricted || 
      await _isAndroid12OrHigher()) {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 12+ (S / API 31+)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Request SCAN and CONNECT together
    statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    final scan = statuses[Permission.bluetoothScan];
    final connect = statuses[Permission.bluetoothConnect];
    
    if (scan == PermissionStatus.granted && connect == PermissionStatus.granted) {
      return true;
    }
    
    if (scan == PermissionStatus.permanentlyDenied || connect == PermissionStatus.permanentlyDenied) {
      onOpenSettings?.call();
      return false;
    }
    
    return false;
  } else {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 11 and below (API < 31)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Requires LOCATION for BLE scanning
    final status = await Permission.locationWhenInUse.request();
    
    if (status.isGranted) return true;
    
    if (status.isPermanentlyDenied) {
      onOpenSettings?.call();
    }
    return false;
  }
}

/// Helper: Roughly detect Android 12+ environment
Future<bool> _isAndroid12OrHigher() async {
  // On older Android, bluetoothScan usually returns restricted/unavailable state immediately.
  // But reliable check is checking OS version directly if needed. 
  // For safety, we try to create the intent if needed, but here we stick to permission_handler.
  
  // Note: permission_handler 10.0+ handles this well.
  // Using a heuristic: if bluetoothScan is NOT permanently denied by default, it might be 12+.
  // Actually, simplest is to just request.
  
  // Using device info plugin would be best, but we don't want extra dependencies.
  // We rely on the fact that requesting `bluetoothScan` on Android 10 returns success immediately/ignores it?
  // No, permission_handler returns `restricted` on older Android for new permissions.
  
  // If `bluetoothScan` is Restricted, we assume old Android.
  var status = await Permission.bluetoothScan.status;
  return !status.isRestricted; 
}

```

---
## File: lib\core\utils\byte_utils.dart
```dart
/// Byte conversion utilities for BLE communication
/// 
/// Ensures data format strictly conforms to the protocol:
/// - All data must be List<int> (Byte Array)
/// - Each element must be in range 0-255 (unsigned byte)
library;

import 'dart:convert'; // For utf8 decoder
import 'package:flutter/foundation.dart';

/// Converts a single hex value to a byte list
/// 
/// Example:
/// ```dart
/// hexToByte(0x01);  // Returns [1]
/// hexToByte(0xA5);  // Returns [165]
/// hexToByte(0xFF);  // Returns [255]
/// ```
List<int> hexToByte(int hexValue) {
  assert(hexValue >= 0 && hexValue <= 255, 
    'Hex value must be in range 0x00-0xFF (0-255)');
  return [hexValue];
}

/// Converts a hex string to a byte list
/// 
/// Supports formats:
/// - "A5" or "a5" (single byte)
/// - "A5DD02" or "A5 DD 02" (multi-byte)
/// - "0xA5" or "0XA5" (with prefix)
/// 
/// Example:
/// ```dart
/// hexStringToBytes("A5DD02");     // Returns [165, 221, 2]
/// hexStringToBytes("A5 DD 02");   // Returns [165, 221, 2]
/// hexStringToBytes("0xA5");       // Returns [165]
/// ```
List<int> hexStringToBytes(String hexString) {
  // Remove common prefixes and spaces
  String cleaned = hexString
      .replaceAll('0x', '')
      .replaceAll('0X', '')
      .replaceAll(' ', '')
      .toUpperCase();
  
  // Ensure even number of characters
  if (cleaned.length % 2 != 0) {
    cleaned = '0$cleaned';
  }
  
  final List<int> bytes = [];
  for (int i = 0; i < cleaned.length; i += 2) {
    final hexPair = cleaned.substring(i, i + 2);
    final value = int.parse(hexPair, radix: 16);
    bytes.add(value);
  }
  
  return bytes;
}

/// Converts a byte list to a hex string for debugging
/// 
/// Example:
/// ```dart
/// bytesToHexString([165, 221, 2]);  // Returns "A5 DD 02"
/// ```
String bytesToHexString(List<int> bytes) {
  return bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
}

/// Validates that all bytes are in valid range (0-255)
/// 
/// Throws [ArgumentError] if any byte is out of range
void validateBytes(List<int> bytes) {
  for (int i = 0; i < bytes.length; i++) {
    if (bytes[i] < 0 || bytes[i] > 255) {
      throw ArgumentError(
        'Byte at index $i (value: ${bytes[i]}) is out of range 0-255'
      );
    }
  }
}

/// Converts slider percentage to byte array for BLE transmission
/// 
/// ESP32 firmware expects UINT8 (0-100) directly, no conversion needed.
/// The firmware internally maps this to PWM duty cycle (0-255).
/// 
/// Example:
/// ```dart
/// sliderValueToBytes(0);    // Returns [0]   - 0% heating
/// sliderValueToBytes(50);   // Returns [50]  - 50% heating
/// sliderValueToBytes(100);  // Returns [100] - 100% heating
/// ```
List<int> sliderValueToBytes(int percentage) {
  assert(percentage >= 0 && percentage <= 100, 
    'Slider value must be in range 0-100');
  return [percentage];
}

/// BLE UUID constants for PhysTrigger Heating Vest
/// 
/// These UUIDs match the ESP32 firmware in sketch_jan3a.ino
abstract class BleUuids {
  /// PhysTrigger Heating Vest Service UUID
  static const String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  
  /// PWM Control Characteristic UUID (Write/Write No Response)
  /// Accepts UINT8 values from 0-100 representing heating intensity percentage
  static const String characteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  
  /// Temperature Notification Characteristic UUID (Read/Notify)
  /// Broadcasts temperature readings as UTF8 string (e.g., "25.82")
  static const String tempCharacteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a9';
  
  /// Target device name for scanning
  static const String targetDeviceName = 'PhysTrigger_Vest';
}

/// Parse temperature from UTF8 bytes
/// 
/// ESP32 sends temperature as UTF8 string (e.g., "25.82")
/// This function converts bytes to string and parses to double
double parseTemperature(List<int> bytes) {
  try {
    final str = utf8.decode(bytes);
    return double.tryParse(str) ?? 0.0;
  } catch (e) {
    debugPrint('Temperature parse error: $e');
    return 0.0;
  }
}

```

---
## File: lib\core\utils\result.dart
```dart
/// Result Type - Functional Error Handling Pattern
///
/// A sealed class that represents either a success or failure outcome.
/// This pattern eliminates the ambiguity of null/exception-based error handling
/// and makes error states explicit and composable.
///
/// ## Usage
/// ```dart
/// Future<Result<User, String>> fetchUser(int id) async {
///   try {
///     final user = await api.getUser(id);
///     return Success(user);
///   } catch (e) {
///     return Failure('Failed to fetch user: $e');
///   }
/// }
///
/// final result = await fetchUser(123);
/// result.when(
///   success: (user) => print('Got user: ${user.name}'),
///   failure: (error) => print('Error: $error'),
/// );
/// ```
library;

/// Sealed Result type for explicit success/failure handling.
///
/// [S] - Success value type
/// [E] - Error value type
sealed class Result<S, E> {
  const Result();

  /// Returns true if this is a [Success] result.
  bool get isSuccess => this is Success<S, E>;

  /// Returns true if this is a [Failure] result.
  bool get isFailure => this is Failure<S, E>;

  /// Get the success value, or null if this is a failure.
  S? get valueOrNull => switch (this) {
        Success(:final value) => value,
        Failure() => null,
      };

  /// Get the error value, or null if this is a success.
  E? get errorOrNull => switch (this) {
        Success() => null,
        Failure(:final error) => error,
      };

  /// Pattern match on the result.
  ///
  /// Both [success] and [failure] callbacks must be provided.
  T when<T>({
    required T Function(S value) success,
    required T Function(E error) failure,
  }) {
    return switch (this) {
      Success(:final value) => success(value),
      Failure(:final error) => failure(error),
    };
  }

  /// Map the success value to a new type.
  Result<T, E> map<T>(T Function(S value) transform) {
    return switch (this) {
      Success(:final value) => Success(transform(value)),
      Failure(:final error) => Failure(error),
    };
  }

  /// Map the error value to a new type.
  Result<S, T> mapError<T>(T Function(E error) transform) {
    return switch (this) {
      Success(:final value) => Success(value),
      Failure(:final error) => Failure(transform(error)),
    };
  }

  /// FlatMap (bind) the success value to a new Result.
  Result<T, E> flatMap<T>(Result<T, E> Function(S value) transform) {
    return switch (this) {
      Success(:final value) => transform(value),
      Failure(:final error) => Failure(error),
    };
  }

  /// Get the success value or a default.
  S getOrElse(S defaultValue) {
    return switch (this) {
      Success(:final value) => value,
      Failure() => defaultValue,
    };
  }

  /// Get the success value or compute a default from the error.
  S getOrElseCompute(S Function(E error) compute) {
    return switch (this) {
      Success(:final value) => value,
      Failure(:final error) => compute(error),
    };
  }
}

/// Represents a successful result containing a value.
final class Success<S, E> extends Result<S, E> {
  /// The success value.
  final S value;

  /// Creates a success result with the given [value].
  const Success(this.value);

  @override
  String toString() => 'Success($value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<S, E> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// Represents a failed result containing an error.
final class Failure<S, E> extends Result<S, E> {
  /// The error value.
  final E error;

  /// Creates a failure result with the given [error].
  const Failure(this.error);

  @override
  String toString() => 'Failure($error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<S, E> &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}

/// Extension for wrapping async operations in Result.
extension ResultFuture<S> on Future<S> {
  /// Wraps a Future in a Result, catching any exceptions as Failure.
  Future<Result<S, E>> toResult<E>(E Function(Object error) onError) async {
    try {
      return Success(await this);
    } catch (e) {
      return Failure(onError(e));
    }
  }
}

/// Convenient type alias for Result with String error.
typedef StringResult<S> = Result<S, String>;

/// Convenient type alias for Result<void, String> (operation success/failure).
typedef OperationResult = Result<void, String>;

```

---
## File: lib\core\viewmodels\ble_controller_viewmodel.dart
```dart
/// BLE Controller ViewModel - MVVM State Management Layer
///
/// Bridges the UI layer with [IBleService] for BLE operations.
/// Uses [ChangeNotifier] for reactive state management with Provider.
///
/// ## Architecture
/// - Receives [IBleService] via constructor injection (DI-ready)
/// - Exposes observable state properties for UI binding
/// - Translates all [BleException] errors to user-friendly messages
///
/// ## Usage
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => BleControllerViewModel(FlutterBluePlusService()),
/// )
/// ```
library;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';
import '../utils/byte_utils.dart';

/// ViewModel for BLE device control operations.
///
/// This class follows MVVM pattern and provides:
/// - Reactive state updates via [ChangeNotifier]
/// - Command methods for UI actions
/// - Error handling with user-friendly messages
class BleControllerViewModel extends ChangeNotifier {
  // ═══════════════════════════════════════════════════════════════════════════
  // Dependencies (Injected)
  // ═══════════════════════════════════════════════════════════════════════════

  /// BLE service interface - never instantiated internally.
  final IBleService _bleService;

  // ═══════════════════════════════════════════════════════════════════════════
  // Observable State Properties
  // ═══════════════════════════════════════════════════════════════════════════

  /// List of discovered devices from scan.
  List<BleDevice> _scanResults = [];

  /// Unmodifiable view of scan results for UI binding.
  List<BleDevice> get scanResults => List.unmodifiable(_scanResults);

  /// Current connection state.
  BleConnectionState _connectionState = BleConnectionState.disconnected;

  /// Current connection state for UI binding.
  BleConnectionState get connectionState => _connectionState;

  /// Currently connected device (null if disconnected).
  BleDevice? _connectedDevice;

  /// Currently connected device for UI binding.
  BleDevice? get connectedDevice => _connectedDevice;

  /// Whether a scan is currently in progress.
  bool _isScanning = false;

  /// Whether scanning is active for UI binding.
  bool get isScanning => _isScanning;

  /// Last error message for UI display (null if no error).
  String? _errorMessage;

  /// Error message for UI snackbar/dialog display.
  String? get errorMessage => _errorMessage;

  /// Discovered services on connected device.
  List<BleServiceInfo> _discoveredServices = [];

  /// Discovered services for UI binding.
  List<BleServiceInfo> get discoveredServices =>
      List.unmodifiable(_discoveredServices);

  /// Temperature history for chart display (last 30 readings).
  final List<double> _temperatureHistory = [];

  /// Temperature history for UI chart binding.
  List<double> get temperatureHistory => List.unmodifiable(_temperatureHistory);

  /// Current temperature reading.
  double _currentTemperature = 0.0;

  /// Current temperature for UI display.
  double get currentTemperature => _currentTemperature;

  /// Last sent command bytes (for debug display).
  List<int>? _lastSentCommand;

  /// Last sent command for debug UI.
  List<int>? get lastSentCommand => _lastSentCommand;

  /// Last sent command as hex string for debug display.
  String get lastSentCommandHex =>
      _lastSentCommand != null ? bytesToHexString(_lastSentCommand!) : '--';

  // ═══════════════════════════════════════════════════════════════════════════
  // Convenience Getters
  // ═══════════════════════════════════════════════════════════════════════════

  /// Whether device is currently connected.
  bool get isConnected => _connectionState == BleConnectionState.connected;

  /// Whether connection is in progress.
  bool get isConnecting => _connectionState == BleConnectionState.connecting;

  /// Whether disconnection is in progress.
  bool get isDisconnecting =>
      _connectionState == BleConnectionState.disconnecting;

  /// Whether any transitional state is active.
  bool get isBusy => _connectionState.isTransitioning || _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Stream Subscriptions (must be disposed!)
  // ═══════════════════════════════════════════════════════════════════════════

  StreamSubscription<BleConnectionState>? _connectionStateSubscription;
  StreamSubscription<BleDevice>? _scanResultsSubscription;
  StreamSubscription<List<int>>? _dataReceivedSubscription;
  Timer? _scanTimeoutTimer;

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence (for auto-reconnect)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String _keyLastDeviceId = 'last_connected_device_id';
  String? _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Constructor & Initialization
  // ═══════════════════════════════════════════════════════════════════════════

  /// Creates a new ViewModel with the given BLE service.
  ///
  /// The service is injected via constructor for testability and flexibility.
  /// Call [initialize] after construction to setup streams and permissions.
  BleControllerViewModel(this._bleService) {
    _setupServiceListeners();
  }

  /// Initialize the BLE service and request permissions.
  ///
  /// Should be called once after construction.
  /// Updates [errorMessage] if initialization fails.
  Future<void> initialize() async {
    try {
      await _bleService.initialize();
      _lastSavedDeviceId = await _loadLastDeviceId();
      debugPrint('BleControllerViewModel: Initialized successfully');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Failed to initialize BLE: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: $e');
    }
  }

  /// Setup listeners for service streams.
  void _setupServiceListeners() {
    // Listen to connection state changes
    _connectionStateSubscription = _bleService.connectionState.listen(
      (state) {
        _connectionState = state;

        if (state == BleConnectionState.connected) {
          _connectedDevice = _bleService.connectedDevice;
          _errorMessage = null;
        } else if (state == BleConnectionState.disconnected) {
          _connectedDevice = null;
          _discoveredServices = [];
        }

        notifyListeners();
        debugPrint('BleControllerViewModel: Connection state -> ${state.label}');
      },
      onError: (error) {
        if (error is BleException) {
          _errorMessage = error.message;
        } else {
          _errorMessage = error.toString();
        }
        notifyListeners();
      },
    );

    // Listen to data received (notifications)
    _dataReceivedSubscription = _bleService.dataReceived.listen(
      (data) {
        // Parse temperature if data looks like UTF8 temperature string
        if (data.isNotEmpty) {
          final temp = parseTemperature(data);
          if (temp > 0) {
            _currentTemperature = temp;
            _temperatureHistory.add(temp);

            // Keep only last 30 readings
            if (_temperatureHistory.length > 30) {
              _temperatureHistory.removeAt(0);
            }

            notifyListeners();
          }
        }
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// Clears previous results and starts a new scan.
  /// Updates [isScanning] and [scanResults] reactively.
  /// Auto-stops after 15 seconds.
  Future<void> startScan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_isScanning) return;

    _isScanning = true;
    _scanResults = [];
    _errorMessage = null;
    notifyListeners();

    try {
      // Start scan on service
      await _bleService.scan(
        filterByServiceUuids: filterByServiceUuids,
        timeout: timeout,
      );

      // Listen to scan results
      _scanResultsSubscription = _bleService.scanResults.listen(
        (device) {
          _handleScanResult(device);
        },
        onError: (error) {
          if (error is BleException) {
            _errorMessage = error.message;
          } else {
            _errorMessage = error.toString();
          }
          _isScanning = false;
          notifyListeners();
        },
        onDone: () {
          _isScanning = false;
          notifyListeners();
        },
      );

      // Safety timeout
      _scanTimeoutTimer = Timer(timeout, () {
        stopScan();
      });

      debugPrint('BleControllerViewModel: Scan started');
    } on BleException catch (e) {
      _errorMessage = e.message;
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Scan failed: $e';
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: $e');
    }
  }

  /// Handle incoming scan result.
  void _handleScanResult(BleDevice device) {
    // Skip devices without names
    if (!device.hasName) return;

    // Check if we already have this device
    final existingIndex = _scanResults.indexWhere((d) => d.id == device.id);

    if (existingIndex >= 0) {
      // Update existing device with new RSSI
      _scanResults[existingIndex] = device;
    } else {
      // Add new device
      _scanResults.add(device);
      debugPrint(
          'BleControllerViewModel: Found device: ${device.name} [${device.id}]');
    }

    notifyListeners();
  }

  /// Stop the current scan.
  Future<void> stopScan() async {
    _scanTimeoutTimer?.cancel();
    _scanTimeoutTimer = null;

    await _scanResultsSubscription?.cancel();
    _scanResultsSubscription = null;

    try {
      await _bleService.stopScan();
    } catch (e) {
      debugPrint('BleControllerViewModel: Error stopping scan: $e');
    }

    _isScanning = false;
    notifyListeners();

    debugPrint('BleControllerViewModel: Scan stopped');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a discovered device.
  ///
  /// Returns true if connection was successful.
  /// Updates [connectionState] and [connectedDevice] reactively.
  Future<bool> connect(BleDevice device) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await _bleService.connect(device.id);

      // Save device ID for future auto-reconnect
      if (_bleService.currentConnectionState == BleConnectionState.connected) {
        await _saveLastDeviceId(device.id);
      }

      debugPrint('BleControllerViewModel: Connected to ${device.name}');
      return true;
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: ${e.message}');
      return false;
    } catch (e) {
      _errorMessage = 'Connection failed: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: $e');
      return false;
    }
  }

  /// Disconnect from the current device.
  ///
  /// Sends safety shutdown command (0%) before disconnecting.
  Future<void> disconnect() async {
    _errorMessage = null;

    // Safety: Send 0% command before disconnecting
    if (isConnected) {
      try {
        debugPrint(
            'BleControllerViewModel: Safety shutdown - sending 0% before disconnect');
        await writeSliderValue(0);
        await Future.delayed(const Duration(milliseconds: 200));
      } catch (e) {
        debugPrint('BleControllerViewModel: Safety shutdown failed: $e');
      }
    }

    try {
      await _bleService.disconnect();
      debugPrint('BleControllerViewModel: Disconnected');
    } on BleException catch (e) {
      _errorMessage = e.message;
      debugPrint('BleControllerViewModel: Disconnect error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Disconnect failed: $e';
      debugPrint('BleControllerViewModel: Disconnect error: $e');
    }

    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover services on the connected device.
  ///
  /// Updates [discoveredServices] with results.
  Future<void> discoverServices() async {
    if (!isConnected) {
      _errorMessage = 'Cannot discover services: not connected';
      notifyListeners();
      return;
    }

    try {
      _discoveredServices = await _bleService.discoverServices();
      notifyListeners();
      debugPrint(
          'BleControllerViewModel: Discovered ${_discoveredServices.length} services');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Discovery error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Send raw bytes to the connected device.
  ///
  /// Updates [lastSentCommand] for debug display.
  Future<void> sendCommand(List<int> bytes) async {
    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot send - not connected');
      return;
    }

    try {
      validateBytes(bytes);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent ${bytesToHexString(bytes)}');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Send error: ${e.message}');
    }
  }

  /// Send slider value (0-100) to connected device.
  ///
  /// The firmware maps this percentage to PWM duty cycle.
  Future<void> writeSliderValue(int percentage) async {
    if (percentage < 0 || percentage > 100) {
      debugPrint('BleControllerViewModel: Invalid slider value: $percentage');
      return;
    }

    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot write slider - not connected');
      return;
    }

    try {
      final bytes = sliderValueToBytes(percentage);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
        withResponse: false,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent slider value: $percentage%');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Write error: ${e.message}');
    }
  }

  /// Subscribe to notifications on a characteristic.
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    if (!isConnected) {
      _errorMessage = 'Cannot subscribe: not connected';
      notifyListeners();
      return;
    }

    try {
      await _bleService.subscribeToNotifications(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
      );
      debugPrint('BleControllerViewModel: Subscribed to $characteristicUuid');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Subscribe error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Error Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Clear the current error message.
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence Helpers
  // ═══════════════════════════════════════════════════════════════════════════

  /// Save device ID to local storage.
  Future<void> _saveLastDeviceId(String deviceId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLastDeviceId, deviceId);
      _lastSavedDeviceId = deviceId;
      debugPrint('BleControllerViewModel: Saved device ID: $deviceId');
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to save device ID: $e');
    }
  }

  /// Load last connected device ID from storage.
  Future<String?> _loadLastDeviceId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final deviceId = prefs.getString(_keyLastDeviceId);
      debugPrint('BleControllerViewModel: Loaded device ID: $deviceId');
      return deviceId;
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to load device ID: $e');
      return null;
    }
  }

  /// Get the last saved device ID (for auto-reconnect).
  String? get lastSavedDeviceId => _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  void dispose() {
    // Cancel all stream subscriptions
    _connectionStateSubscription?.cancel();
    _scanResultsSubscription?.cancel();
    _dataReceivedSubscription?.cancel();
    _scanTimeoutTimer?.cancel();

    // Dispose the underlying service
    _bleService.dispose();

    super.dispose();
    debugPrint('BleControllerViewModel: Disposed');
  }
}

```

---
## File: lib\ui\ui.dart
```dart
/// UI module exports
/// 
/// Provides a single import point for all UI widgets
library;

export 'widgets/hold_action_button.dart';
export 'screens/control_screen.dart';

```

---
## File: lib\ui\screens\control_screen.dart
```dart
/// Control Screen - Main UI for BLE device interaction
///
/// Dynamic view switching:
/// - Disconnected: Shows scan button + device list
/// - Connected: Shows disconnect button + control pad
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/hold_action_button.dart';

/// Main control screen with scan/connect/control functionality
class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text('PhysTrigger BLE'),
        backgroundColor: const Color(0xFF16213E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              // Main content area
              Expanded(
                child: viewModel.isConnected
                    ? _buildControlPanel(context, viewModel)
                    : _buildScanPanel(context, viewModel),
              ),

              // Debug info bar at bottom
              _buildDebugBar(viewModel),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // State A: Disconnected - Scan Panel
  // ============================================================

  Widget _buildScanPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Scan button
          ElevatedButton.icon(
            onPressed: viewModel.isScanning ? viewModel.stopScan : viewModel.startScan,
            icon: viewModel.isScanning
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.bluetooth_searching),
            label: Text(viewModel.isScanning ? '停止扫描' : '扫描设备'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3460),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Device list header
          Text(
            '发现的设备 (${viewModel.scanResults.length})',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Device list
          Expanded(
            child: viewModel.scanResults.isEmpty
                ? Center(
                    child: Text(
                      viewModel.isScanning ? '正在扫描...' : '点击上方按钮开始扫描',
                      style: const TextStyle(color: Colors.white38),
                    ),
                  )
                : ListView.builder(
                    itemCount: viewModel.scanResults.length,
                    itemBuilder: (context, index) {
                      final device = viewModel.scanResults[index];
                      return _buildDeviceListTile(context, viewModel, device);
                    },
                  ),
          ),

          // Error message - using pattern matching for null safety
          if (viewModel.errorMessage case String msg)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.redAccent),
              ),
              child: Text(
                msg,
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDeviceListTile(
    BuildContext context,
    BleControllerViewModel viewModel,
    BleDevice device,
  ) {
    // Display "Unknown Device (MAC)" if name is empty
    final displayName = device.name.isNotEmpty
        ? device.name
        : 'Unknown Device (${device.id})';

    return Card(
      color: const Color(0xFF16213E),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.bluetooth, color: Colors.blueAccent),
        title: Text(
          displayName,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'RSSI: ${device.rssi} dBm',
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        trailing: viewModel.isConnecting
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.chevron_right, color: Colors.white38),
        onTap: viewModel.isConnecting
            ? null
            : () async {
                await viewModel.connect(device);
              },
      ),
    );
  }

  // ============================================================
  // State B: Connected - Control Panel
  // ============================================================

  Widget _buildControlPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Connection status header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.greenAccent),
            ),
            child: Row(
              children: [
                const Icon(Icons.bluetooth_connected, color: Colors.greenAccent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '已连接',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        viewModel.connectedDevice?.name ?? 'Unknown',
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: viewModel.disconnect,
                  child: const Text(
                    '断开连接',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Directional control pad
          Expanded(
            child: Center(
              child: DirectionalPad(
                onCommand: viewModel.sendCommand,
                buttonSize: 80,
                enabled: viewModel.isConnected,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Additional action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoldActionButton(
                label: 'STOP',
                icon: Icons.stop_circle_outlined,
                pressCommand: const [0x00], // STOP command
                releaseCommand: const [0x00], // STOP command
                onCommand: viewModel.sendCommand,
                size: 70,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade900,
                enabled:viewModel.isConnected,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Debug Bar (always visible at bottom)
  // ============================================================

  Widget _buildDebugBar(BleControllerViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F1A),
        border: Border(
          top: BorderSide(color: Colors.white12),
        ),
      ),
      child: Row(
        children: [
          // Connection state indicator
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getConnectionColor(viewModel.connectionState),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _getConnectionText(viewModel.connectionState),
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),

          const Spacer(),

          // Last sent command
          const Text(
            '最后指令: ',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              viewModel.lastSentCommandHex,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConnectionColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return Colors.greenAccent;
      case BleConnectionState.connecting:
      case BleConnectionState.disconnecting:
        return Colors.orangeAccent;
      case BleConnectionState.disconnected:
        return Colors.redAccent;
    }
  }

  String _getConnectionText(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return '已连接';
      case BleConnectionState.connecting:
        return '连接中...';
      case BleConnectionState.disconnecting:
        return '断开中...';
      case BleConnectionState.disconnected:
        return '未连接';
    }
  }
}

```

---
## File: lib\ui\screens\device_scan_page.dart
```dart
/// Device Connect Page - Simple Connection UI
/// 
/// Single button to scan and connect to PhysTrigger_Vest.
/// After successful connection, navigates to SliderControlPage.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import 'slider_control_page.dart';

/// Simple landing page with connect button
class DeviceScanPage extends StatefulWidget {
  const DeviceScanPage({super.key});

  @override
  State<DeviceScanPage> createState() => _DeviceScanPageState();
}

class _DeviceScanPageState extends State<DeviceScanPage> {
  bool _isConnecting = false;
  Timer? _scanTimer;

  @override
  void dispose() {
    _scanTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          // Navigate to control page when connected
          if (viewModel.isConnected) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const SliderControlPage(),
                ),
              );
            });
          }

          final showLoading = _isConnecting || viewModel.isScanning || viewModel.isConnecting;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: showLoading
                            ? [const Color(0xFF58A6FF), const Color(0xFF388BFD)]
                            : [const Color(0xFF238636), const Color(0xFF2EA043)],
                      ),
                    ),
                    child: Icon(
                      showLoading
                          ? Icons.bluetooth_searching
                          : Icons.bluetooth,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Title
                  const Text(
                    'PhysTrigger Vest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Status Text
                  Text(
                    _getStatusText(viewModel),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  // Connected Device ID
                  if (viewModel.connectedDevice != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${viewModel.connectedDevice!.id}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 48),
                  
                  // Connect Button or Loading
                  if (showLoading)
                    const Column(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xFF58A6FF),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '正在连接...',
                          style: TextStyle(
                            color: Color(0xFF58A6FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: () => _startConnection(viewModel),
                      icon: const Icon(Icons.power_settings_new, size: 24),
                      label: const Text(
                        '连接设备',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF238636),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  
                  // Error Message
                  if (viewModel.errorMessage != null) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDA3633).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFDA3633),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              viewModel.errorMessage!,
                              style: const TextStyle(
                                color: Color(0xFFDA3633),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getStatusText(BleControllerViewModel viewModel) {
    if (viewModel.isConnecting) return '正在连接 PhysTrigger_Vest...';
    if (_isConnecting || viewModel.isScanning) return '正在搜索 PhysTrigger_Vest...';
    if (viewModel.isConnected) return '已连接';
    return '点击下方按钮连接加热马甲';
  }

  Future<void> _startConnection(BleControllerViewModel viewModel) async {
    setState(() => _isConnecting = true);
    
    // Clear any previous error before starting
    viewModel.clearError();
    
    // Start scan
    viewModel.startScan();
    
    // Poll for PhysTrigger device every 500ms
    _scanTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      final results = viewModel.scanResults;
      
      // Find PhysTrigger device by name
      BleDevice? targetDevice;
      for (final device in results) {
        if (device.name.toLowerCase().contains('phystrigger')) {
          targetDevice = device;
          debugPrint('[DeviceScanPage] Found PhysTrigger: ${device.name} [${device.id}]');
          break;
        }
      }
      
      if (targetDevice != null) {
        // CRITICAL: Cancel timer IMMEDIATELY before any async work
        // to prevent multiple connection attempts or late state updates
        timer.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        debugPrint('[DeviceScanPage] Connecting to: ${targetDevice.name} [${targetDevice.id}]');
        
        // Await the connection result and handle failure immediately
        final success = await viewModel.connect(targetDevice);
        
        // Check mounted before setState to prevent dispose crash
        if (mounted) {
          setState(() => _isConnecting = false);
        }
        
        if (!success && mounted) {
          // Show SnackBar immediately on failure
          final errorMsg = viewModel.errorMessage ?? 'Connection failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(child: Text(errorMsg)),
                ],
              ),
              backgroundColor: const Color(0xFFDA3633),
              duration: const Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: '重试',
                textColor: Colors.white,
                onPressed: () => _startConnection(viewModel),
              ),
            ),
          );
        }
      }
    });
    
    // Timeout after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (_scanTimer?.isActive ?? false) {
        _scanTimer?.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        // Check mounted before setState to prevent dispose crash
        if (mounted) {
          setState(() => _isConnecting = false);
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.bluetooth_disabled, color: Colors.white),
                  SizedBox(width: 8),
                  Text('未找到 PhysTrigger 设备'),
                ],
              ),
              backgroundColor: const Color(0xFFDA3633),
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: '重试',
                textColor: Colors.white,
                onPressed: () => _startConnection(viewModel),
              ),
            ),
          );
        }
      }
    });
  }
}

```

---
## File: lib\ui\screens\slider_control_page.dart
```dart
/// Slider Control Page for PhysTrigger Heating Vest
/// 
/// Main UI screen with:
/// - Connection status display in AppBar
/// - Large vertical slider (0-100%)
/// - Real-time BLE communication
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/temperature_chart.dart';
import 'device_scan_page.dart';

/// Main control screen for heating vest slider control
class SliderControlPage extends StatefulWidget {
  const SliderControlPage({super.key});

  @override
  State<SliderControlPage> createState() => _SliderControlPageState();
}

class _SliderControlPageState extends State<SliderControlPage> {
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: _buildAppBar(context),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Connection Status Card
                    _buildConnectionStatusCard(viewModel),
                    
                    const SizedBox(height: 48),
                    
                    // Slider Control Section
                    if (viewModel.isConnected) ...[
                      _buildSliderControl(viewModel),
                    ] else ...[
                      _buildDisconnectedMessage(viewModel),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// AppBar with connection status badge
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'PhysTrigger Heating Vest',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFF161B22),
      elevation: 0,
      actions: [
        Consumer<BleControllerViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: _buildConnectionBadge(context, viewModel),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Connection status badge for AppBar with hover disconnect
  Widget _buildConnectionBadge(BuildContext context, BleControllerViewModel viewModel) {
    if (viewModel.isConnected) {
      // Connected state with hover to disconnect
      return _HoverDisconnectBadge(
        onDisconnect: () async {
          await viewModel.disconnect();
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const DeviceScanPage()),
            );
          }
        },
      );
    } else if (viewModel.isScanning || viewModel.isConnecting) {
      return _buildStatusBadge('搜索中...', const Color(0xFFF0883E), Icons.bluetooth_searching);
    } else {
      return _buildStatusBadge('断开', const Color(0xFFDA3633), Icons.bluetooth_disabled);
    }
  }
  
  Widget _buildStatusBadge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Connection status detail card
  Widget _buildConnectionStatusCard(BleControllerViewModel viewModel) {
    return Card(
      elevation: 8,
      color: const Color(0xFF161B22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF30363D).withOpacity(0.8),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Device Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: viewModel.isConnected
                      ? [const Color(0xFF238636), const Color(0xFF2EA043)]
                      : [const Color(0xFF8B949E), const Color(0xFF6E7681)],
                ),
              ),
              child: Icon(
                viewModel.isConnected
                    ? Icons.bluetooth_connected
                    : Icons.bluetooth_disabled,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 16),

            // Device Name
            Text(
              viewModel.connectedDevice?.name ?? BleUuids.targetDeviceName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Connection Details
            if (viewModel.isConnected) ...[
              Text(
                viewModel.connectedDevice?.id ?? '',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
            ] else if (viewModel.errorMessage case String msg) ...[
              Text(
                msg,
                style: const TextStyle(
                  color: Color(0xFFDA3633),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Main slider control widget
  Widget _buildSliderControl(BleControllerViewModel viewModel) {
    return Column(
      children: [
        // Temperature Chart (NEW)
        if (viewModel.temperatureHistory.isNotEmpty)
          TemperatureChart(
            temperatureData: viewModel.temperatureHistory,
            currentTemperature: viewModel.currentTemperature,
          ),
        
        if (viewModel.temperatureHistory.isNotEmpty)
          const SizedBox(height: 32),
        
        // Heating Intensity Label
        const Text(
          '加热强度',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 32),

        // Current Value Display
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Color.lerp(
                  const Color(0xFF161B22),
                  const Color(0xFFF0883E),
                  _currentValue / 100,
                )!,
                const Color(0xFF161B22),
              ],
            ),
            border: Border.all(
              color: Color.lerp(
                const Color(0xFF30363D),
                const Color(0xFFF0883E),
                _currentValue / 100,
              )!,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              '${_currentValue.toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 48),

        // Horizontal Slider (CHANGED from vertical)
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 12,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 16,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 24,
            ),
            activeTrackColor: const Color(0xFFF0883E),
            inactiveTrackColor: const Color(0xFF30363D),
            thumbColor: const Color(0xFFF0883E),
            overlayColor: const Color(0xFFF0883E).withOpacity(0.2),
            valueIndicatorColor: const Color(0xFFF0883E),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${_currentValue.toInt()}%',
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
            onChangeEnd: (value) {
              // Send to BLE when user finishes adjusting
              viewModel.writeSliderValue(value.toInt());
            },
          ),
        ),

        const SizedBox(height: 32),

        // Value Range Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '100%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Last Sent Command Debug Info
        if (viewModel.lastSentCommandHex != '--')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF21262D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.send,
                  color: Color(0xFF58A6FF),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '最后发送: ${viewModel.lastSentCommandHex}',
                  style: const TextStyle(
                    color: Color(0xFF58A6FF),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Message shown when not connected
  Widget _buildDisconnectedMessage(BleControllerViewModel viewModel) {
    return Column(
      children: [
        Icon(
          Icons.power_off,
          size: 80,
          color: Colors.white.withOpacity(0.3),
        ),
        const SizedBox(height: 24),
        Text(
          viewModel.isScanning ? '正在搜索设备...' : '设备未连接',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        if (!viewModel.isScanning)
          ElevatedButton.icon(
            onPressed: () => viewModel.startScan(),
            icon: const Icon(Icons.refresh),
            label: const Text('重新扫描'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF238636),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
      ],
    );
  }
}

/// Hover-enabled disconnect badge
/// Shows "已连接" normally, changes to "断开连接" on hover
class _HoverDisconnectBadge extends StatefulWidget {
  final VoidCallback onDisconnect;
  
  const _HoverDisconnectBadge({required this.onDisconnect});

  @override
  State<_HoverDisconnectBadge> createState() => _HoverDisconnectBadgeState();
}

class _HoverDisconnectBadgeState extends State<_HoverDisconnectBadge> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovering 
        ? const Color(0xFFDA3633) 
        : const Color(0xFF3FB950);
    final text = _isHovering ? '断开连接' : '已连接';
    final icon = _isHovering 
        ? Icons.bluetooth_disabled 
        : Icons.bluetooth_connected;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onDisconnect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---
## File: lib\ui\widgets\hold_action_button.dart
```dart
/// HoldActionButton - A custom button that sends BLE commands on press/release
/// 
/// This widget replicates the TouchDown/TouchUp behavior from MIT App Inventor:
/// - **onTapDown (TouchDown)**: Sends the "press" command (e.g., 0x01 for forward)
/// - **onTapUp (TouchUp)**: Sends the "release" command (e.g., 0x00 for stop)
/// - **onTapCancel**: Handles edge case when finger slides out of button area
/// 
/// Desktop support:
/// - MouseRegion adds "click" cursor on hover
/// - GestureDetector handles left mouse button as touch
/// 
/// Visual feedback includes scale animation and color change to simulate
/// physical button feel.
library;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Callback type for BLE command actions
typedef BleCommandCallback = Future<void> Function(List<int> data);

/// A button that executes different actions on press and release
/// 
/// Mimics the MIT App Inventor TouchDown/TouchUp pattern for BLE control.
/// 
/// Example usage:
/// ```dart
/// HoldActionButton(
///   label: 'FORWARD',
///   icon: Icons.arrow_upward,
///   pressCommand: [0x01],    // Send on TouchDown
///   releaseCommand: [0x00],  // Send on TouchUp/Cancel
///   onCommand: (data) async {
///     await bleService.writeBytes('FFE0', 'FFE1', data);
///   },
/// )
/// ```
class HoldActionButton extends StatefulWidget {
  /// Button label text
  final String label;
  
  /// Optional icon displayed above/beside the label
  final IconData? icon;
  
  /// Command bytes to send when button is pressed (TouchDown)
  /// Default: [0x01] (forward command)
  final List<int> pressCommand;
  
  /// Command bytes to send when button is released (TouchUp/Cancel)
  /// Default: [0x00] (stop command)
  final List<int> releaseCommand;
  
  /// Callback to execute BLE write operation
  /// Receives the command bytes to send
  final BleCommandCallback onCommand;
  
  /// Button size (width and height)
  final double size;
  
  /// Active color when button is pressed
  final Color activeColor;
  
  /// Inactive color when button is released
  final Color inactiveColor;
  
  /// Whether the button is enabled
  final bool enabled;
  
  /// Enable haptic feedback on press/release
  final bool hapticFeedback;

  const HoldActionButton({
    super.key,
    required this.label,
    required this.onCommand,
    this.icon,
    this.pressCommand = const [0x01],
    this.releaseCommand = const [0x00],
    this.size = 80.0,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.enabled = true,
    this.hapticFeedback = true,
  });

  @override
  State<HoldActionButton> createState() => _HoldActionButtonState();
}

class _HoldActionButtonState extends State<HoldActionButton>
    with SingleTickerProviderStateMixin {
  
  /// Tracks whether the button is currently being pressed
  bool _isPressed = false;
  
  /// Animation controller for scale effect
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup scale animation for visual feedback
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.92, // Shrink to 92% when pressed
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handle button press (TouchDown equivalent)
  /// 
  /// This is called when the user's finger touches the button.
  /// Sends the pressCommand (e.g., 0x01 for forward).
  void _handleTapDown(TapDownDetails details) {
    if (!widget.enabled) return;
    
    setState(() => _isPressed = true);
    _animationController.forward();
    
    // Haptic feedback for tactile response (mobile only)
    // Desktop platforms don't support haptic feedback
    if (widget.hapticFeedback && !_isDesktop) {
      HapticFeedback.mediumImpact();
    }
    
    // Send press command via BLE
    _sendCommand(widget.pressCommand);
  }
  
  /// Check if running on desktop platform
  bool get _isDesktop => 
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Handle button release (TouchUp equivalent)
  /// 
  /// This is called when the user lifts their finger from the button.
  /// Sends the releaseCommand (e.g., 0x00 for stop).
  void _handleTapUp(TapUpDetails details) {
    _release();
  }

  /// Handle finger sliding out of button area (TouchCancel equivalent)
  /// 
  /// IMPORTANT: This edge case is critical for control applications!
  /// 
  /// Scenario: User presses button, then slides finger outside the button
  /// area before lifting. Without handling this:
  /// - onTapUp would never fire
  /// - The device would continue executing the press command indefinitely
  /// 
  /// Solution: onTapCancel fires when the gesture is interrupted, ensuring
  /// the release command is ALWAYS sent.
  void _handleTapCancel() {
    _release();
  }

  /// Common release logic for both TapUp and TapCancel
  void _release() {
    if (!_isPressed) return;
    
    setState(() => _isPressed = false);
    _animationController.reverse();
    
    // Always send release command to ensure device stops
    _sendCommand(widget.releaseCommand);
  }

  /// Execute the BLE command callback
  Future<void> _sendCommand(List<int> command) async {
    try {
      await widget.onCommand(command);
    } catch (e) {
      // Log error but don't crash the UI
      debugPrint('HoldActionButton: Failed to send command $command: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // MouseRegion: Enables desktop "Vue-like" experience
      // - Cursor changes to pointer (hand) on hover
      // - GestureDetector still handles mouse clicks
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      child: MouseRegion(
        cursor: widget.enabled 
            ? SystemMouseCursors.click  // Hand cursor on hover
            : SystemMouseCursors.forbidden,
        child: GestureDetector(
          // Core touch/click event handlers:
          // - Mobile: finger touch
          // - Desktop: left mouse button
          onTapDown: _handleTapDown,   // TouchDown / MouseDown -> Send pressCommand
          onTapUp: _handleTapUp,       // TouchUp / MouseUp -> Send releaseCommand
          onTapCancel: _handleTapCancel, // Edge case: drag out of bounds
          
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              // Color changes based on press state
              color: _getButtonColor(),
              borderRadius: BorderRadius.circular(widget.size / 4),
              boxShadow: _isPressed
                  ? [] // No shadow when pressed (appears "pushed in")
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
              border: Border.all(
                color: _isPressed 
                    ? widget.activeColor.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: widget.size * 0.4,
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.size * 0.15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Determine button color based on state
  Color _getButtonColor() {
    if (!widget.enabled) {
      return widget.inactiveColor.withOpacity(0.5);
    }
    return _isPressed ? widget.activeColor : widget.inactiveColor;
  }
}

/// A directional pad composed of multiple HoldActionButtons
/// 
/// Provides a classic D-pad layout for directional control.
class DirectionalPad extends StatelessWidget {
  final BleCommandCallback onCommand;
  final double buttonSize;
  final bool enabled;

  const DirectionalPad({
    super.key,
    required this.onCommand,
    this.buttonSize = 70.0,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize * 3.5,
      height: buttonSize * 3.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // UP button
          Positioned(
            top: 0,
            child: HoldActionButton(
              label: 'UP',
              icon: Icons.arrow_upward,
              pressCommand: const [0x01],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // DOWN button
          Positioned(
            bottom: 0,
            child: HoldActionButton(
              label: 'DOWN',
              icon: Icons.arrow_downward,
              pressCommand: const [0x02],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // LEFT button
          Positioned(
            left: 0,
            child: HoldActionButton(
              label: 'LEFT',
              icon: Icons.arrow_back,
              pressCommand: const [0x03],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // RIGHT button
          Positioned(
            right: 0,
            child: HoldActionButton(
              label: 'RIGHT',
              icon: Icons.arrow_forward,
              pressCommand: const [0x04],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // Center indicator
          Container(
            width: buttonSize * 0.6,
            height: buttonSize * 0.6,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

---
## File: lib\ui\widgets\temperature_chart.dart
```dart
/// Temperature Chart Widget
/// 
/// Displays real-time temperature data from PhysTrigger Vest
library;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temperatureData;
  final double currentTemperature;

  const TemperatureChart({
    super.key,
    required this.temperatureData,
    required this.currentTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF30363D),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Temperature Display
          Row(
            children: [
              const Icon(
                Icons.thermostat,
                color: Color(0xFFF0883E),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '${currentTemperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  color: Color(0xFFF0883E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '实时温度',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Line Chart
          Expanded(
            child: temperatureData.isEmpty
                ? Center(
                    child: Text(
                      '等待温度数据...',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 5,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: const Color(0xFF30363D),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 10,
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 29,
                      minY: _calculateMinY(),
                      maxY: _calculateMaxY(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _buildSpots(),
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF0883E),
                              Color(0xFFDA3633),
                            ],
                          ),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF0883E).withOpacity(0.3),
                                const Color(0xFFDA3633).withOpacity(0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    return List.generate(
      temperatureData.length,
      (index) => FlSpot(index.toDouble(), temperatureData[index]),
    );
  }

  double _calculateMinY() {
    if (temperatureData.isEmpty) return 0;
    final min = temperatureData.reduce((a, b) => a < b ? a : b);
    return (min - 5).floorToDouble();
  }

  double _calculateMaxY() {
    if (temperatureData.isEmpty) return 50;
    final max = temperatureData.reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }
}

```

---
## File: sketch_jan3a\sketch_jan3a.ino
```ino
#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <Wire.h>
#include <Adafruit_MLX90614.h>

// ------------------------------------------------
// 1. 硬件引脚定义
// ------------------------------------------------
#define PIN_MOS    4    // MOS 管信号线
#define PIN_LED    8    // 板载指示灯
#define PIN_SDA    5    // I2C SDA
#define PIN_SCL    6    // I2C SCL

const int PWM_FREQ = 5000;
const int PWM_RES  = 8;

// ------------------------------------------------
// 2. 全局状态变量
// ------------------------------------------------
int target_pwm = 0;
int current_pwm = 0;
bool is_heating = false;

Adafruit_MLX90614 mlx = Adafruit_MLX90614(); 
unsigned long last_temp_time = 0;

// 蓝牙 UUID
#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHAR_UUID_CTRL      "beb5483e-36e1-4688-b7f5-ea07361b26a8"
#define CHAR_UUID_TEMP      "beb5483e-36e1-4688-b7f5-ea07361b26a9"

BLECharacteristic *pTempChar = NULL; 

// ------------------------------------------------
// 3. 辅助函数：生成运行时间戳 [H:M:S]
// ------------------------------------------------
String getTimestamp() {
    unsigned long totalSeconds = millis() / 1000;
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = (totalSeconds / 3600);

    char buf[20];
    snprintf(buf, sizeof(buf), "[%02d:%02d:%02d]", hours, minutes, seconds);
    return String(buf);
}

// ------------------------------------------------
// 4. 蓝牙回调
// ------------------------------------------------
class MyCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
        String value = pCharacteristic->getValue();
        if (value.length() > 0) {
            uint8_t cmd = (uint8_t)value[0];
            if (cmd > 100) cmd = 100;
            target_pwm = map(cmd, 0, 100, 0, 255);
            is_heating = (cmd > 0);
        }
    }
};

class MyServerCallbacks: public BLEServerCallbacks {
    // 兼容性修正：使用标准的单参数 onConnect
    void onConnect(BLEServer* pServer) {
        // 由于无法直接从单参数获取 MAC，我们通过全局 Device 状态打印连接事件
        Serial.print(getTimestamp());
        Serial.println(" [BLE] 设备已连接 | 系统正在握手...");
    }

    void onDisconnect(BLEServer* pServer) {
        Serial.println(getTimestamp() + " [!!!] 蓝牙断开 - 触发安全熔断");
        
        // 立即物理停机
        target_pwm = 0;
        current_pwm = 0;
        is_heating = false;
        ledcWrite(PIN_MOS, 0);
        digitalWrite(PIN_LED, HIGH);
        
        // 重启广播
        BLEDevice::startAdvertising();
    }
};

// ------------------------------------------------
// 5. 初始化
// ------------------------------------------------
void setup() {
    Serial.begin(115200);
    delay(2000);

    Serial.println("\n" + getTimestamp() + " === 系统正式版 V3.0 (高兼容) 启动 ===");

    pinMode(PIN_LED, OUTPUT);
    digitalWrite(PIN_LED, HIGH);
    
    // 初始化 PWM 控制
    ledcAttach(PIN_MOS, PWM_FREQ, PWM_RES);
    ledcWrite(PIN_MOS, 0);

    // 初始化 I2C 温度传感器
    Wire.begin(PIN_SDA, PIN_SCL);
    if (!mlx.begin()) {
        Serial.println(getTimestamp() + " ❌ MLX90614 初始化失败，请检查接线");
    }

    // 初始化蓝牙设备
    BLEDevice::init("PhysTrigger_Vest"); 
    BLEServer *pServer = BLEDevice::createServer();
    pServer->setCallbacks(new MyServerCallbacks());

    // 创建服务
    BLEService *pService = pServer->createService(SERVICE_UUID);
    
    // 特征值 1: 控制 (Write)
    BLECharacteristic *pCtrlChar = pService->createCharacteristic(
                                    CHAR_UUID_CTRL,
                                    BLECharacteristic::PROPERTY_WRITE |
                                    BLECharacteristic::PROPERTY_WRITE_NR
                                );
    pCtrlChar->setCallbacks(new MyCallbacks());

    // 特征值 2: 温度 (Read/Notify)
    pTempChar = pService->createCharacteristic(
                                    CHAR_UUID_TEMP,
                                    BLECharacteristic::PROPERTY_READ | 
                                    BLECharacteristic::PROPERTY_NOTIFY
                                );
    // 增加描述符以支持 Notify
    pTempChar->addDescriptor(new BLE2902());

    pService->start();

    // 广播配置
    BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
    pAdvertising->addServiceUUID(SERVICE_UUID);
    pAdvertising->setScanResponse(true);
    pAdvertising->start();
    
    Serial.println(getTimestamp() + " >>> 准备就绪，当前电压稳定。");
}

// ------------------------------------------------
// 6. 主循环
// ------------------------------------------------
void loop() {
    // A. 加热软启动逻辑：防止电流浪涌导致重启
    if (current_pwm < target_pwm) {
        current_pwm++;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10); 
    } else if (current_pwm > target_pwm) {
        current_pwm--;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10);
    }
    
    // LED 状态与加热同步：低电平点亮指示灯
    digitalWrite(PIN_LED, is_heating ? LOW : HIGH);

    // B. 定时温度监测与时间戳输出 (每 1000ms)
    if (millis() - last_temp_time > 1000) {
        last_temp_time = millis();
        
        float objTemp = mlx.readObjectTempC();
        if (objTemp > -100 && objTemp < 200) {
            // 串口输出格式：[HH:MM:SS] [🌡️ 温度监测] 目标温度: XX.XX C
            Serial.print(getTimestamp()); 
            Serial.printf(" [🌡️ 温度监测] 目标温度: %.2f C\n", objTemp);
            
            // 蓝牙 Notify 推送数据到 App
            String tempStr = String(objTemp, 2); 
            if (pTempChar != NULL) {
                pTempChar->setValue(tempStr.c_str());
                pTempChar->notify();
            }
        }
    }
    
    delay(5);
}
```

---
## File: test\widget_test.dart
```dart
/// Widget tests for PhysTrigger Heating Vest
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:phys_trigger_ble/main.dart';

void main() {
  testWidgets('PhysTrigger app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PhysTriggerApp());

    // Verify that the app bar title is present
    expect(find.text('PhysTrigger Heating Vest'), findsOneWidget);
  });
}

```

---
