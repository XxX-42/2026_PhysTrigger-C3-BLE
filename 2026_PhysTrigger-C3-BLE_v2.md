# Project Architecture: 2026_PhysTrigger-C3-BLE_v2

## Directory Tree
```text
2026_PhysTrigger-C3-BLE_v2/
├── .dart_tool
│   ├── flutter_build
│   │   ├── 29702d6f9430e539ddecc7841a3adb2f
│   │   │   ├── .filecache
│   │   │   ├── app.dill
│   │   │   ├── dart_build.d
│   │   │   ├── dart_build.stamp
│   │   │   ├── dart_build_result.json
│   │   │   ├── debug_bundle_windows-x64_assets.stamp
│   │   │   ├── flutter_assets.d
│   │   │   ├── gen_dart_plugin_registrant.stamp
│   │   │   ├── gen_localizations.stamp
│   │   │   ├── install_code_assets.d
│   │   │   ├── install_code_assets.stamp
│   │   │   ├── kernel_snapshot_program.d
│   │   │   ├── kernel_snapshot_program.stamp
│   │   │   ├── native_assets.json
│   │   │   ├── outputs.json
│   │   │   ├── unpack_windows.stamp
│   │   │   └── windows_engine_sources.d
│   │   └── dart_plugin_registrant.dart
│   ├── package_config.json
│   ├── package_graph.json
│   └── version
├── .flutter-plugins-dependencies
├── .gitignore
├── .idea
│   ├── libraries
│   │   ├── Dart_SDK.xml
│   │   └── KotlinJavaRuntime.xml
│   ├── modules.xml
│   ├── runConfigurations
│   │   └── main_dart.xml
│   └── workspace.xml
├── .metadata
├── aggregate.py
├── analysis_options.yaml
├── android
│   ├── app
│   │   └── src
│   │       └── main
│   │           ├── AndroidManifest.xml
│   │           └── java
│   │               └── io
│   │                   └── flutter
│   │                       └── plugins
│   │                           └── GeneratedPluginRegistrant.java
│   └── local.properties
├── firmware
│   └── PhysTrigger_ESP32
│       └── PhysTrigger_ESP32.ino
├── lib
│   ├── core
│   │   ├── core.dart
│   │   ├── services
│   │   │   ├── ble_service.dart
│   │   │   └── ble_service_impl.dart
│   │   ├── utils
│   │   │   └── byte_utils.dart
│   │   └── viewmodels
│   │       └── ble_controller_viewmodel.dart
│   ├── main.dart
│   └── ui
│       ├── screens
│       │   └── control_screen.dart
│       ├── ui.dart
│       └── widgets
│           └── hold_action_button.dart
├── macos
│   ├── Flutter
│   │   ├── GeneratedPluginRegistrant.swift
│   │   └── ephemeral
│   │       ├── Flutter-Generated.xcconfig
│   │       └── flutter_export_environment.sh
│   └── Runner
│       ├── DebugProfile.entitlements
│       ├── Info.plist
│       └── Release.entitlements
├── phys_trigger_ble.iml
├── pubspec.lock
├── pubspec.yaml
├── sketch_jan3a
│   └── sketch_jan3a.ino
├── test
│   └── widget_test.dart
└── windows
    ├── .gitignore
    ├── CMakeLists.txt
    ├── flutter
    │   ├── CMakeLists.txt
    │   ├── ephemeral
    │   │   ├── .plugin_symlinks
    │   │   │   ├── path_provider_windows
    │   │   │   │   ├── AUTHORS
    │   │   │   │   ├── LICENSE
    │   │   │   │   ├── example
    │   │   │   │   │   ├── integration_test
    │   │   │   │   │   │   └── path_provider_test.dart
    │   │   │   │   │   ├── lib
    │   │   │   │   │   │   └── main.dart
    │   │   │   │   │   ├── pubspec.yaml
    │   │   │   │   │   ├── test_driver
    │   │   │   │   │   │   └── integration_test.dart
    │   │   │   │   │   └── windows
    │   │   │   │   │       ├── CMakeLists.txt
    │   │   │   │   │       ├── flutter
    │   │   │   │   │       │   ├── CMakeLists.txt
    │   │   │   │   │       │   └── generated_plugins.cmake
    │   │   │   │   │       └── runner
    │   │   │   │   │           ├── CMakeLists.txt
    │   │   │   │   │           ├── Runner.rc
    │   │   │   │   │           ├── flutter_window.cpp
    │   │   │   │   │           ├── flutter_window.h
    │   │   │   │   │           ├── main.cpp
    │   │   │   │   │           ├── resource.h
    │   │   │   │   │           ├── resources
    │   │   │   │   │           │   └── app_icon.ico
    │   │   │   │   │           ├── run_loop.cpp
    │   │   │   │   │           ├── run_loop.h
    │   │   │   │   │           ├── runner.exe.manifest
    │   │   │   │   │           ├── utils.cpp
    │   │   │   │   │           ├── utils.h
    │   │   │   │   │           ├── win32_window.cpp
    │   │   │   │   │           └── win32_window.h
    │   │   │   │   ├── lib
    │   │   │   │   │   ├── path_provider_windows.dart
    │   │   │   │   │   └── src
    │   │   │   │   │       ├── folders.dart
    │   │   │   │   │       ├── folders_stub.dart
    │   │   │   │   │       ├── guid.dart
    │   │   │   │   │       ├── path_provider_windows_real.dart
    │   │   │   │   │       ├── path_provider_windows_stub.dart
    │   │   │   │   │       └── win32_wrappers.dart
    │   │   │   │   ├── pubspec.yaml
    │   │   │   │   └── test
    │   │   │   │       ├── guid_test.dart
    │   │   │   │       └── path_provider_windows_test.dart
    │   │   │   └── permission_handler_windows
    │   │   │       ├── AUTHORS
    │   │   │       ├── LICENSE
    │   │   │       ├── example
    │   │   │       │   ├── lib
    │   │   │       │   │   └── main.dart
    │   │   │       │   ├── pubspec.yaml
    │   │   │       │   ├── res
    │   │   │       │   │   └── images
    │   │   │       │   │       ├── baseflow_logo_def_light-02.png
    │   │   │       │   │       ├── poweredByBaseflowLogoLight.png
    │   │   │       │   │       ├── poweredByBaseflowLogoLight@2x.png
    │   │   │       │   │       └── poweredByBaseflowLogoLight@3x.png
    │   │   │       │   └── windows
    │   │   │       │       ├── CMakeLists.txt
    │   │   │       │       ├── flutter
    │   │   │       │       │   ├── CMakeLists.txt
    │   │   │       │       │   ├── generated_plugin_registrant.cc
    │   │   │       │       │   ├── generated_plugin_registrant.h
    │   │   │       │       │   └── generated_plugins.cmake
    │   │   │       │       └── runner
    │   │   │       │           ├── CMakeLists.txt
    │   │   │       │           ├── Runner.rc
    │   │   │       │           ├── flutter_window.cpp
    │   │   │       │           ├── flutter_window.h
    │   │   │       │           ├── main.cpp
    │   │   │       │           ├── resource.h
    │   │   │       │           ├── resources
    │   │   │       │           │   └── app_icon.ico
    │   │   │       │           ├── runner.exe.manifest
    │   │   │       │           ├── utils.cpp
    │   │   │       │           ├── utils.h
    │   │   │       │           ├── win32_window.cpp
    │   │   │       │           └── win32_window.h
    │   │   │       ├── pubspec.yaml
    │   │   │       └── windows
    │   │   │           ├── CMakeLists.txt
    │   │   │           ├── include
    │   │   │           │   └── permission_handler_windows
    │   │   │           │       └── permission_handler_windows_plugin.h
    │   │   │           ├── permission_constants.h
    │   │   │           └── permission_handler_windows_plugin.cpp
    │   │   ├── cpp_client_wrapper
    │   │   │   ├── binary_messenger_impl.h
    │   │   │   ├── byte_buffer_streams.h
    │   │   │   ├── core_implementations.cc
    │   │   │   ├── engine_method_result.cc
    │   │   │   ├── flutter_engine.cc
    │   │   │   ├── flutter_view_controller.cc
    │   │   │   ├── include
    │   │   │   │   └── flutter
    │   │   │   │       ├── basic_message_channel.h
    │   │   │   │       ├── binary_messenger.h
    │   │   │   │       ├── byte_streams.h
    │   │   │   │       ├── dart_project.h
    │   │   │   │       ├── encodable_value.h
    │   │   │   │       ├── engine_method_result.h
    │   │   │   │       ├── event_channel.h
    │   │   │   │       ├── event_sink.h
    │   │   │   │       ├── event_stream_handler.h
    │   │   │   │       ├── event_stream_handler_functions.h
    │   │   │   │       ├── flutter_engine.h
    │   │   │   │       ├── flutter_view.h
    │   │   │   │       ├── flutter_view_controller.h
    │   │   │   │       ├── message_codec.h
    │   │   │   │       ├── method_call.h
    │   │   │   │       ├── method_channel.h
    │   │   │   │       ├── method_codec.h
    │   │   │   │       ├── method_result.h
    │   │   │   │       ├── method_result_functions.h
    │   │   │   │       ├── plugin_registrar.h
    │   │   │   │       ├── plugin_registrar_windows.h
    │   │   │   │       ├── plugin_registry.h
    │   │   │   │       ├── standard_codec_serializer.h
    │   │   │   │       ├── standard_message_codec.h
    │   │   │   │       ├── standard_method_codec.h
    │   │   │   │       └── texture_registrar.h
    │   │   │   ├── plugin_registrar.cc
    │   │   │   ├── readme
    │   │   │   ├── standard_codec.cc
    │   │   │   └── texture_registrar_impl.h
    │   │   ├── flutter_export.h
    │   │   ├── flutter_messenger.h
    │   │   ├── flutter_plugin_registrar.h
    │   │   ├── flutter_texture_registrar.h
    │   │   ├── flutter_windows.dll
    │   │   ├── flutter_windows.dll.exp
    │   │   ├── flutter_windows.dll.lib
    │   │   ├── flutter_windows.dll.pdb
    │   │   ├── flutter_windows.h
    │   │   ├── generated_config.cmake
    │   │   └── icudtl.dat
    │   ├── generated_plugin_registrant.cc
    │   ├── generated_plugin_registrant.h
    │   └── generated_plugins.cmake
    └── runner
        ├── CMakeLists.txt
        ├── Runner.rc
        ├── flutter_window.cpp
        ├── flutter_window.h
        ├── main.cpp
        ├── resource.h
        ├── resources
        │   └── app_icon.ico
        ├── runner.exe.manifest
        ├── utils.cpp
        ├── utils.h
        ├── win32_window.cpp
        └── win32_window.h
```

---

## File: .flutter-plugins-dependencies
```text
{"info":"This is a generated file; do not edit or check into version control.","plugins":{"ios":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_foundation-2.5.1\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_apple","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_apple-9.4.7\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"android":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_android","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_android-2.2.22\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_android","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_android-12.1.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"macos":[{"name":"flutter_blue_plus","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_blue_plus-1.34.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"path_provider_foundation","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_foundation-2.5.1\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false}],"linux":[{"name":"path_provider_linux","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_linux-2.2.1\\\\","native_build":false,"dependencies":[],"dev_dependency":false}],"windows":[{"name":"path_provider_windows","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\path_provider_windows-2.3.0\\\\","native_build":false,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_windows","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_windows-0.2.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"web":[{"name":"permission_handler_html","path":"C:\\\\Users\\\\20748\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_html-0.1.3+5\\\\","dependencies":[],"dev_dependency":false}]},"dependencyGraph":[{"name":"flutter_blue_plus","dependencies":[]},{"name":"path_provider","dependencies":["path_provider_android","path_provider_foundation","path_provider_linux","path_provider_windows"]},{"name":"path_provider_android","dependencies":[]},{"name":"path_provider_foundation","dependencies":[]},{"name":"path_provider_linux","dependencies":[]},{"name":"path_provider_windows","dependencies":[]},{"name":"permission_handler","dependencies":["permission_handler_android","permission_handler_apple","permission_handler_html","permission_handler_windows"]},{"name":"permission_handler_android","dependencies":[]},{"name":"permission_handler_apple","dependencies":[]},{"name":"permission_handler_html","dependencies":[]},{"name":"permission_handler_windows","dependencies":[]}],"date_created":"2026-01-03 19:19:51.084987","version":"3.38.5","swift_package_manager_enabled":{"ios":false,"macos":false}}
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
## File: pubspec.lock
```lock
# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  async:
    dependency: transitive
    description:
      name: async
      sha256: "758e6d74e971c3e5aceb4110bfd6698efc7f501675bcfe0c775459a8140750eb"
      url: "https://pub.dev"
    source: hosted
    version: "2.13.0"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      sha256: "8aab1771e1243a5063b8b0ff68042d67334e3feab9e95b9490f9a6ebf73b42ea"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  characters:
    dependency: transitive
    description:
      name: characters
      sha256: f71061c654a3380576a52b451dd5532377954cf9dbd272a78fc8479606670803
      url: "https://pub.dev"
    source: hosted
    version: "1.4.0"
  clock:
    dependency: transitive
    description:
      name: clock
      sha256: fddb70d9b5277016c77a80201021d40a2247104d9f4aa7bab7157b7e3f05b84b
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  collection:
    dependency: transitive
    description:
      name: collection
      sha256: "2f5709ae4d3d59dd8f7cd309b4e023046b57d8a6c82130785d2b0e5868084e76"
      url: "https://pub.dev"
    source: hosted
    version: "1.19.1"
  cupertino_icons:
    dependency: "direct main"
    description:
      name: cupertino_icons
      sha256: ba631d1c7f7bef6b729a622b7b752645a2d076dba9976925b8f25725a30e1ee6
      url: "https://pub.dev"
    source: hosted
    version: "1.0.8"
  fake_async:
    dependency: transitive
    description:
      name: fake_async
      sha256: "5368f224a74523e8d2e7399ea1638b37aecfca824a3cc4dfdf77bf1fa905ac44"
      url: "https://pub.dev"
    source: hosted
    version: "1.3.3"
  ffi:
    dependency: transitive
    description:
      name: ffi
      sha256: "289279317b4b16eb2bb7e271abccd4bf84ec9bdcbe999e278a94b804f5630418"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  flutter:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_blue_plus:
    dependency: "direct main"
    description:
      name: flutter_blue_plus
      sha256: d2ac9fac56c4b3b08eb68752380e2d45e64c61db629b70e61bb36c95cb65d431
      url: "https://pub.dev"
    source: hosted
    version: "1.34.5"
  flutter_lints:
    dependency: "direct dev"
    description:
      name: flutter_lints
      sha256: "3f41d009ba7172d5ff9be5f6e6e6abb4300e263aab8866d2a0842ed2a70f8f0c"
      url: "https://pub.dev"
    source: hosted
    version: "4.0.0"
  flutter_test:
    dependency: "direct dev"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_web_plugins:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  leak_tracker:
    dependency: transitive
    description:
      name: leak_tracker
      sha256: "33e2e26bdd85a0112ec15400c8cbffea70d0f9c3407491f672a2fad47915e2de"
      url: "https://pub.dev"
    source: hosted
    version: "11.0.2"
  leak_tracker_flutter_testing:
    dependency: transitive
    description:
      name: leak_tracker_flutter_testing
      sha256: "1dbc140bb5a23c75ea9c4811222756104fbcd1a27173f0c34ca01e16bea473c1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.10"
  leak_tracker_testing:
    dependency: transitive
    description:
      name: leak_tracker_testing
      sha256: "8d5a2d49f4a66b49744b23b018848400d23e54caf9463f4eb20df3eb8acb2eb1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  lints:
    dependency: transitive
    description:
      name: lints
      sha256: "976c774dd944a42e83e2467f4cc670daef7eed6295b10b36ae8c85bcbf828235"
      url: "https://pub.dev"
    source: hosted
    version: "4.0.0"
  matcher:
    dependency: transitive
    description:
      name: matcher
      sha256: dc58c723c3c24bf8d3e2d3ad3f2f9d7bd9cf43ec6feaa64181775e60190153f2
      url: "https://pub.dev"
    source: hosted
    version: "0.12.17"
  material_color_utilities:
    dependency: transitive
    description:
      name: material_color_utilities
      sha256: f7142bb1154231d7ea5f96bc7bde4bda2a0945d2806bb11670e30b850d56bdec
      url: "https://pub.dev"
    source: hosted
    version: "0.11.1"
  meta:
    dependency: transitive
    description:
      name: meta
      sha256: "23f08335362185a5ea2ad3a4e597f1375e78bce8a040df5c600c8d3552ef2394"
      url: "https://pub.dev"
    source: hosted
    version: "1.17.0"
  nested:
    dependency: transitive
    description:
      name: nested
      sha256: "03bac4c528c64c95c722ec99280375a6f2fc708eec17c7b3f07253b626cd2a20"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0"
  path:
    dependency: transitive
    description:
      name: path
      sha256: "75cca69d1490965be98c73ceaea117e8a04dd21217b37b292c9ddbec0d955bc5"
      url: "https://pub.dev"
    source: hosted
    version: "1.9.1"
  path_provider:
    dependency: transitive
    description:
      name: path_provider
      sha256: "50c5dd5b6e1aaf6fb3a78b33f6aa3afca52bf903a8a5298f53101fdaee55bbcd"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.5"
  path_provider_android:
    dependency: transitive
    description:
      name: path_provider_android
      sha256: f2c65e21139ce2c3dad46922be8272bb5963516045659e71bb16e151c93b580e
      url: "https://pub.dev"
    source: hosted
    version: "2.2.22"
  path_provider_foundation:
    dependency: transitive
    description:
      name: path_provider_foundation
      sha256: "6d13aece7b3f5c5a9731eaf553ff9dcbc2eff41087fd2df587fd0fed9a3eb0c4"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.1"
  path_provider_linux:
    dependency: transitive
    description:
      name: path_provider_linux
      sha256: f7a1fe3a634fe7734c8d3f2766ad746ae2a2884abe22e241a8b301bf5cac3279
      url: "https://pub.dev"
    source: hosted
    version: "2.2.1"
  path_provider_platform_interface:
    dependency: transitive
    description:
      name: path_provider_platform_interface
      sha256: "88f5779f72ba699763fa3a3b06aa4bf6de76c8e5de842cf6f29e2e06476c2334"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  path_provider_windows:
    dependency: transitive
    description:
      name: path_provider_windows
      sha256: bd6f00dbd873bfb70d0761682da2b3a2c2fccc2b9e84c495821639601d81afe7
      url: "https://pub.dev"
    source: hosted
    version: "2.3.0"
  permission_handler:
    dependency: "direct main"
    description:
      name: permission_handler
      sha256: "59adad729136f01ea9e35a48f5d1395e25cba6cea552249ddbe9cf950f5d7849"
      url: "https://pub.dev"
    source: hosted
    version: "11.4.0"
  permission_handler_android:
    dependency: transitive
    description:
      name: permission_handler_android
      sha256: d3971dcdd76182a0c198c096b5db2f0884b0d4196723d21a866fc4cdea057ebc
      url: "https://pub.dev"
    source: hosted
    version: "12.1.0"
  permission_handler_apple:
    dependency: transitive
    description:
      name: permission_handler_apple
      sha256: f000131e755c54cf4d84a5d8bd6e4149e262cc31c5a8b1d698de1ac85fa41023
      url: "https://pub.dev"
    source: hosted
    version: "9.4.7"
  permission_handler_html:
    dependency: transitive
    description:
      name: permission_handler_html
      sha256: "38f000e83355abb3392140f6bc3030660cfaef189e1f87824facb76300b4ff24"
      url: "https://pub.dev"
    source: hosted
    version: "0.1.3+5"
  permission_handler_platform_interface:
    dependency: transitive
    description:
      name: permission_handler_platform_interface
      sha256: eb99b295153abce5d683cac8c02e22faab63e50679b937fa1bf67d58bb282878
      url: "https://pub.dev"
    source: hosted
    version: "4.3.0"
  permission_handler_windows:
    dependency: transitive
    description:
      name: permission_handler_windows
      sha256: "1a790728016f79a41216d88672dbc5df30e686e811ad4e698bfc51f76ad91f1e"
      url: "https://pub.dev"
    source: hosted
    version: "0.2.1"
  platform:
    dependency: transitive
    description:
      name: platform
      sha256: "5d6b1b0036a5f331ebc77c850ebc8506cbc1e9416c27e59b439f917a902a4984"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.6"
  plugin_platform_interface:
    dependency: transitive
    description:
      name: plugin_platform_interface
      sha256: "4820fbfdb9478b1ebae27888254d445073732dae3d6ea81f0b7e06d5dedc3f02"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.8"
  provider:
    dependency: "direct main"
    description:
      name: provider
      sha256: "4e82183fa20e5ca25703ead7e05de9e4cceed1fbd1eadc1ac3cb6f565a09f272"
      url: "https://pub.dev"
    source: hosted
    version: "6.1.5+1"
  sky_engine:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  source_span:
    dependency: transitive
    description:
      name: source_span
      sha256: "254ee5351d6cb365c859e20ee823c3bb479bf4a293c22d17a9f1bf144ce86f7c"
      url: "https://pub.dev"
    source: hosted
    version: "1.10.1"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      sha256: "8b27215b45d22309b5cddda1aa2b19bdfec9df0e765f2de506401c071d38d1b1"
      url: "https://pub.dev"
    source: hosted
    version: "1.12.1"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      sha256: "969e04c80b8bcdf826f8f16579c7b14d780458bd97f56d107d3950fdbeef059d"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      sha256: "921cd31725b72fe181906c6a94d987c78e3b98c2e205b397ea399d4054872b43"
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      sha256: "7f554798625ea768a7518313e58f83891c7f5024f88e46e7182a4558850a4b8e"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.2"
  test_api:
    dependency: transitive
    description:
      name: test_api
      sha256: ab2726c1a94d3176a45960b6234466ec367179b87dd74f1611adb1f3b5fb9d55
      url: "https://pub.dev"
    source: hosted
    version: "0.7.7"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      sha256: d530bd74fea330e6e364cda7a85019c434070188383e1cd8d9777ee586914c5b
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  vm_service:
    dependency: transitive
    description:
      name: vm_service
      sha256: "45caa6c5917fa127b5dbcfbd1fa60b14e583afdc08bfc96dda38886ca252eb60"
      url: "https://pub.dev"
    source: hosted
    version: "15.0.2"
  web:
    dependency: transitive
    description:
      name: web
      sha256: "868d88a33d8a87b18ffc05f9f030ba328ffefba92d6c127917a2ba740f9cfe4a"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  win_ble:
    dependency: "direct main"
    description:
      name: win_ble
      sha256: "2a867e13c4b355b101fc2c6e2ac85eeebf965db34eca46856f8b478e93b41e96"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  xdg_directories:
    dependency: transitive
    description:
      name: xdg_directories
      sha256: "7a3f37b05d989967cdddcbb571f1ea834867ae2faa29725fd085180e0883aa15"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.0"
sdks:
  dart: ">=3.9.0 <4.0.0"
  flutter: ">=3.35.0"

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

  # BLE Communication
  # flutter_blue_plus for mobile platforms
  flutter_blue_plus: ^1.34.5
  
  # Windows BLE Support via WinRT (direct native binding)
  # This provides native Windows BLE functionality without flutter_blue_plus wrapper
  win_ble: ^1.1.1

  # Permission Handling
  # Required for Android 12+ runtime permissions
  permission_handler: ^11.3.0

  # State Management (optional, for ChangeNotifier)
  provider: ^6.1.0

  # Cupertino Icons (iOS style)
  cupertino_icons: ^1.0.6

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
## File: .dart_tool\package_config.json
```json
{
  "configVersion": 2,
  "packages": [
    {
      "name": "async",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/async-2.13.0",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "boolean_selector",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/boolean_selector-2.1.2",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "characters",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/characters-1.4.0",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "clock",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/clock-1.1.2",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "collection",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/collection-1.19.1",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "cupertino_icons",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/cupertino_icons-1.0.8",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "fake_async",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/fake_async-1.3.3",
      "packageUri": "lib/",
      "languageVersion": "3.3"
    },
    {
      "name": "ffi",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/ffi-2.1.4",
      "packageUri": "lib/",
      "languageVersion": "3.7"
    },
    {
      "name": "flutter",
      "rootUri": "file:///D:/Documents/CodesEnvironment/flutter/packages/flutter",
      "packageUri": "lib/",
      "languageVersion": "3.8"
    },
    {
      "name": "flutter_blue_plus",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/flutter_blue_plus-1.34.5",
      "packageUri": "lib/",
      "languageVersion": "2.15"
    },
    {
      "name": "flutter_lints",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/flutter_lints-4.0.0",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "flutter_test",
      "rootUri": "file:///D:/Documents/CodesEnvironment/flutter/packages/flutter_test",
      "packageUri": "lib/",
      "languageVersion": "3.8"
    },
    {
      "name": "flutter_web_plugins",
      "rootUri": "file:///D:/Documents/CodesEnvironment/flutter/packages/flutter_web_plugins",
      "packageUri": "lib/",
      "languageVersion": "3.8"
    },
    {
      "name": "leak_tracker",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/leak_tracker-11.0.2",
      "packageUri": "lib/",
      "languageVersion": "3.2"
    },
    {
      "name": "leak_tracker_flutter_testing",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/leak_tracker_flutter_testing-3.0.10",
      "packageUri": "lib/",
      "languageVersion": "3.2"
    },
    {
      "name": "leak_tracker_testing",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/leak_tracker_testing-3.0.2",
      "packageUri": "lib/",
      "languageVersion": "3.2"
    },
    {
      "name": "lints",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/lints-4.0.0",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "matcher",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/matcher-0.12.17",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "material_color_utilities",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/material_color_utilities-0.11.1",
      "packageUri": "lib/",
      "languageVersion": "2.17"
    },
    {
      "name": "meta",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/meta-1.17.0",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "nested",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/nested-1.0.0",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    },
    {
      "name": "path",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path-1.9.1",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "path_provider",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider-2.1.5",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "path_provider_android",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider_android-2.2.22",
      "packageUri": "lib/",
      "languageVersion": "3.9"
    },
    {
      "name": "path_provider_foundation",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider_foundation-2.5.1",
      "packageUri": "lib/",
      "languageVersion": "3.9"
    },
    {
      "name": "path_provider_linux",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider_linux-2.2.1",
      "packageUri": "lib/",
      "languageVersion": "2.19"
    },
    {
      "name": "path_provider_platform_interface",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider_platform_interface-2.1.2",
      "packageUri": "lib/",
      "languageVersion": "3.0"
    },
    {
      "name": "path_provider_windows",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/path_provider_windows-2.3.0",
      "packageUri": "lib/",
      "languageVersion": "3.2"
    },
    {
      "name": "permission_handler",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler-11.4.0",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "permission_handler_android",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler_android-12.1.0",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "permission_handler_apple",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler_apple-9.4.7",
      "packageUri": "lib/",
      "languageVersion": "2.18"
    },
    {
      "name": "permission_handler_html",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler_html-0.1.3+5",
      "packageUri": "lib/",
      "languageVersion": "3.3"
    },
    {
      "name": "permission_handler_platform_interface",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler_platform_interface-4.3.0",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "permission_handler_windows",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/permission_handler_windows-0.2.1",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    },
    {
      "name": "platform",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/platform-3.1.6",
      "packageUri": "lib/",
      "languageVersion": "3.2"
    },
    {
      "name": "plugin_platform_interface",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/plugin_platform_interface-2.1.8",
      "packageUri": "lib/",
      "languageVersion": "3.0"
    },
    {
      "name": "provider",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/provider-6.1.5+1",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    },
    {
      "name": "sky_engine",
      "rootUri": "file:///D:/Documents/CodesEnvironment/flutter/bin/cache/pkg/sky_engine",
      "packageUri": "lib/",
      "languageVersion": "3.8"
    },
    {
      "name": "source_span",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/source_span-1.10.1",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "stack_trace",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/stack_trace-1.12.1",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "stream_channel",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/stream_channel-2.1.4",
      "packageUri": "lib/",
      "languageVersion": "3.3"
    },
    {
      "name": "string_scanner",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/string_scanner-1.4.1",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "term_glyph",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/term_glyph-1.2.2",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "test_api",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/test_api-0.7.7",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "vector_math",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/vector_math-2.2.0",
      "packageUri": "lib/",
      "languageVersion": "3.1"
    },
    {
      "name": "vm_service",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/vm_service-15.0.2",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    },
    {
      "name": "web",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/web-1.1.1",
      "packageUri": "lib/",
      "languageVersion": "3.4"
    },
    {
      "name": "win_ble",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/win_ble-1.1.1",
      "packageUri": "lib/",
      "languageVersion": "3.0"
    },
    {
      "name": "xdg_directories",
      "rootUri": "file:///C:/Users/20748/AppData/Local/Pub/Cache/hosted/pub.dev/xdg_directories-1.1.0",
      "packageUri": "lib/",
      "languageVersion": "3.3"
    },
    {
      "name": "phys_trigger_ble",
      "rootUri": "../",
      "packageUri": "lib/",
      "languageVersion": "3.5"
    }
  ],
  "generator": "pub",
  "generatorVersion": "3.10.4",
  "flutterRoot": "file:///D:/Documents/CodesEnvironment/flutter",
  "flutterVersion": "3.38.5",
  "pubCache": "file:///C:/Users/20748/AppData/Local/Pub/Cache"
}

```

---
## File: .dart_tool\package_graph.json
```json
{
  "roots": [
    "phys_trigger_ble"
  ],
  "packages": [
    {
      "name": "phys_trigger_ble",
      "version": "1.0.0+1",
      "dependencies": [
        "cupertino_icons",
        "flutter",
        "flutter_blue_plus",
        "permission_handler",
        "provider",
        "win_ble"
      ],
      "devDependencies": [
        "flutter_lints",
        "flutter_test"
      ]
    },
    {
      "name": "flutter_lints",
      "version": "4.0.0",
      "dependencies": [
        "lints"
      ]
    },
    {
      "name": "flutter_test",
      "version": "0.0.0",
      "dependencies": [
        "clock",
        "collection",
        "fake_async",
        "flutter",
        "leak_tracker_flutter_testing",
        "matcher",
        "meta",
        "path",
        "stack_trace",
        "stream_channel",
        "test_api",
        "vector_math"
      ]
    },
    {
      "name": "cupertino_icons",
      "version": "1.0.8",
      "dependencies": []
    },
    {
      "name": "provider",
      "version": "6.1.5+1",
      "dependencies": [
        "collection",
        "flutter",
        "nested"
      ]
    },
    {
      "name": "permission_handler",
      "version": "11.4.0",
      "dependencies": [
        "flutter",
        "meta",
        "permission_handler_android",
        "permission_handler_apple",
        "permission_handler_html",
        "permission_handler_platform_interface",
        "permission_handler_windows"
      ]
    },
    {
      "name": "win_ble",
      "version": "1.1.1",
      "dependencies": [
        "flutter",
        "path_provider"
      ]
    },
    {
      "name": "flutter_blue_plus",
      "version": "1.34.5",
      "dependencies": [
        "flutter"
      ]
    },
    {
      "name": "flutter",
      "version": "0.0.0",
      "dependencies": [
        "characters",
        "collection",
        "material_color_utilities",
        "meta",
        "sky_engine",
        "vector_math"
      ]
    },
    {
      "name": "lints",
      "version": "4.0.0",
      "dependencies": []
    },
    {
      "name": "stream_channel",
      "version": "2.1.4",
      "dependencies": [
        "async"
      ]
    },
    {
      "name": "meta",
      "version": "1.17.0",
      "dependencies": []
    },
    {
      "name": "collection",
      "version": "1.19.1",
      "dependencies": []
    },
    {
      "name": "leak_tracker_flutter_testing",
      "version": "3.0.10",
      "dependencies": [
        "flutter",
        "leak_tracker",
        "leak_tracker_testing",
        "matcher",
        "meta"
      ]
    },
    {
      "name": "vector_math",
      "version": "2.2.0",
      "dependencies": []
    },
    {
      "name": "stack_trace",
      "version": "1.12.1",
      "dependencies": [
        "path"
      ]
    },
    {
      "name": "clock",
      "version": "1.1.2",
      "dependencies": []
    },
    {
      "name": "fake_async",
      "version": "1.3.3",
      "dependencies": [
        "clock",
        "collection"
      ]
    },
    {
      "name": "path",
      "version": "1.9.1",
      "dependencies": []
    },
    {
      "name": "matcher",
      "version": "0.12.17",
      "dependencies": [
        "async",
        "meta",
        "stack_trace",
        "term_glyph",
        "test_api"
      ]
    },
    {
      "name": "test_api",
      "version": "0.7.7",
      "dependencies": [
        "async",
        "boolean_selector",
        "collection",
        "meta",
        "source_span",
        "stack_trace",
        "stream_channel",
        "string_scanner",
        "term_glyph"
      ]
    },
    {
      "name": "nested",
      "version": "1.0.0",
      "dependencies": [
        "flutter"
      ]
    },
    {
      "name": "permission_handler_platform_interface",
      "version": "4.3.0",
      "dependencies": [
        "flutter",
        "meta",
        "plugin_platform_interface"
      ]
    },
    {
      "name": "permission_handler_windows",
      "version": "0.2.1",
      "dependencies": [
        "flutter",
        "permission_handler_platform_interface"
      ]
    },
    {
      "name": "permission_handler_html",
      "version": "0.1.3+5",
      "dependencies": [
        "flutter",
        "flutter_web_plugins",
        "permission_handler_platform_interface",
        "web"
      ]
    },
    {
      "name": "permission_handler_apple",
      "version": "9.4.7",
      "dependencies": [
        "flutter",
        "permission_handler_platform_interface"
      ]
    },
    {
      "name": "permission_handler_android",
      "version": "12.1.0",
      "dependencies": [
        "flutter",
        "permission_handler_platform_interface"
      ]
    },
    {
      "name": "path_provider",
      "version": "2.1.5",
      "dependencies": [
        "flutter",
        "path_provider_android",
        "path_provider_foundation",
        "path_provider_linux",
        "path_provider_platform_interface",
        "path_provider_windows"
      ]
    },
    {
      "name": "sky_engine",
      "version": "0.0.0",
      "dependencies": []
    },
    {
      "name": "material_color_utilities",
      "version": "0.11.1",
      "dependencies": [
        "collection"
      ]
    },
    {
      "name": "characters",
      "version": "1.4.0",
      "dependencies": []
    },
    {
      "name": "async",
      "version": "2.13.0",
      "dependencies": [
        "collection",
        "meta"
      ]
    },
    {
      "name": "leak_tracker_testing",
      "version": "3.0.2",
      "dependencies": [
        "leak_tracker",
        "matcher",
        "meta"
      ]
    },
    {
      "name": "leak_tracker",
      "version": "11.0.2",
      "dependencies": [
        "clock",
        "collection",
        "meta",
        "path",
        "vm_service"
      ]
    },
    {
      "name": "term_glyph",
      "version": "1.2.2",
      "dependencies": []
    },
    {
      "name": "string_scanner",
      "version": "1.4.1",
      "dependencies": [
        "source_span"
      ]
    },
    {
      "name": "source_span",
      "version": "1.10.1",
      "dependencies": [
        "collection",
        "path",
        "term_glyph"
      ]
    },
    {
      "name": "boolean_selector",
      "version": "2.1.2",
      "dependencies": [
        "source_span",
        "string_scanner"
      ]
    },
    {
      "name": "plugin_platform_interface",
      "version": "2.1.8",
      "dependencies": [
        "meta"
      ]
    },
    {
      "name": "web",
      "version": "1.1.1",
      "dependencies": []
    },
    {
      "name": "flutter_web_plugins",
      "version": "0.0.0",
      "dependencies": [
        "flutter"
      ]
    },
    {
      "name": "path_provider_windows",
      "version": "2.3.0",
      "dependencies": [
        "ffi",
        "flutter",
        "path",
        "path_provider_platform_interface"
      ]
    },
    {
      "name": "path_provider_platform_interface",
      "version": "2.1.2",
      "dependencies": [
        "flutter",
        "platform",
        "plugin_platform_interface"
      ]
    },
    {
      "name": "path_provider_linux",
      "version": "2.2.1",
      "dependencies": [
        "ffi",
        "flutter",
        "path",
        "path_provider_platform_interface",
        "xdg_directories"
      ]
    },
    {
      "name": "path_provider_foundation",
      "version": "2.5.1",
      "dependencies": [
        "flutter",
        "path_provider_platform_interface"
      ]
    },
    {
      "name": "path_provider_android",
      "version": "2.2.22",
      "dependencies": [
        "flutter",
        "path_provider_platform_interface"
      ]
    },
    {
      "name": "vm_service",
      "version": "15.0.2",
      "dependencies": []
    },
    {
      "name": "ffi",
      "version": "2.1.4",
      "dependencies": []
    },
    {
      "name": "platform",
      "version": "3.1.6",
      "dependencies": []
    },
    {
      "name": "xdg_directories",
      "version": "1.1.0",
      "dependencies": [
        "meta",
        "path"
      ]
    }
  ],
  "configVersion": 1
}
```

---
## File: .dart_tool\version
```text
3.38.5
```

---
## File: .dart_tool\flutter_build\dart_plugin_registrant.dart
```dart
//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 3.5

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:path_provider_android/path_provider_android.dart' as path_provider_android;
import 'package:path_provider_foundation/path_provider_foundation.dart' as path_provider_foundation;
import 'package:path_provider_linux/path_provider_linux.dart' as path_provider_linux;
import 'package:path_provider_foundation/path_provider_foundation.dart' as path_provider_foundation;
import 'package:path_provider_windows/path_provider_windows.dart' as path_provider_windows;

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        path_provider_android.PathProviderAndroid.registerWith();
      } catch (err) {
        print(
          '`path_provider_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isIOS) {
      try {
        path_provider_foundation.PathProviderFoundation.registerWith();
      } catch (err) {
        print(
          '`path_provider_foundation` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isLinux) {
      try {
        path_provider_linux.PathProviderLinux.registerWith();
      } catch (err) {
        print(
          '`path_provider_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isMacOS) {
      try {
        path_provider_foundation.PathProviderFoundation.registerWith();
      } catch (err) {
        print(
          '`path_provider_foundation` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isWindows) {
      try {
        path_provider_windows.PathProviderWindows.registerWith();
      } catch (err) {
        print(
          '`path_provider_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    }
  }
}

```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\.filecache
```text
{"version":2,"files":[{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\refresh.dart","hash":"1a0f6fb989f60a34770d3667e697603c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\performance_overlay.dart","hash":"0071fe298793e366f6f5b16077adbf4c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overscroll_indicator.dart","hash":"ad7ca843f2292adfabfc5b22db7c6801"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\web-1.1.1\\LICENSE","hash":"d53c45c14285d5ae1612c4146c90050b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_flutter_testing-3.0.10\\LICENSE","hash":"f721b495d225cd93026aaeb2f6e41bcc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_theme.dart","hash":"46ee68303df4a2b1c8b7c2834ebf084f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\nav_bar.dart","hash":"abea938400806c37a1977791796cb26a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\plane.dart","hash":"d98495bcbc301290a10e6d1dfc255d69"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filter_chip.dart","hash":"73b8d199cc00486354dda26a4d8de371"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_inspector.dart","hash":"9d4ff4844be31f31b3c72f05a342fbce"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\collections.dart","hash":"8764a2799f8899639fbf335bf794c627"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\media_query.dart","hash":"64896cedee8cbb21c751c96b5cb45c0c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile_theme.dart","hash":"a284638498c103fb78a89f30c62a910b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flutter_version.dart","hash":"00408a31c78c5c887a19c2cd04973c37"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_style.dart","hash":"a3f622bd8417a8f8a1789761a4cb572a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\implicit_animations.dart","hash":"1b9b5c985e92a54127afb5d7d15fda44"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar.dart","hash":"c32fe94e565a6199137fe363f3a40636"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h","hash":"33562e00fd62a55bd23deeecf3a69a51"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\windows.dart","hash":"0d86d4ba2e01e5e62f80fcf3e872f561"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\material_fonts\\MaterialIcons-Regular.otf","hash":"e7069dfd19b331be16bed984668fe080"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h","hash":"0bbbe470228d787a92d567a95faa2b33"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button.dart","hash":"dd1b85165bcd83870bcaa2e00fceb1be"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_localizations.dart","hash":"c32b3be564aac574be8ab4fde5dc7a2f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\border_radius.dart","hash":"33023122c675fd7cb0285badfc27744b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button.dart","hash":"a8511ded179401d75de5fe238f07f0ae"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selection_container.dart","hash":"ffc33a0f001beefdf9580522c3ffa8e9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\wrap.dart","hash":"6d1dbdc7d4820b0f58a5f23f8bb83cd7"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb2.dart","hash":"f54f6b61b175b0a37d51ff3ac8b8c800"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\readme","hash":"f516028b7f23d3e0f78743297f24dcfc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\animated_size.dart","hash":"8e27c2a44948760ae3bdccf04dbb63e1"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_tonal_spot.dart","hash":"75f947f0ba87a0789a3ef91542bbc82c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_web.dart","hash":"2c907a9b2d913f98aea742b5ead8d39c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stack_trace-1.12.1\\LICENSE","hash":"3c68a7c20b2296875f67e431093dd99e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar_theme.dart","hash":"a043c4b889b3ee27c55c0c325e542a60"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_bar_theme.dart","hash":"4a2999703cf356a8b2eb83618ac27468"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_button.dart","hash":"2d26f1a912f4cfc0973626c8495566a6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\page_scaffold.dart","hash":"c9273bf25fd7ed7141dfad56121527d6"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_helper.dart","hash":"16548b6d876933401608ea26ae8bc6a4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time.dart","hash":"606636e865b06ca9bbefe3560a32fc7b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_theme.dart","hash":"5ebbf02718357c7babaa500ebeb864d7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_buttons.dart","hash":"e71bfc49f52579c2e458315e9067527e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\ink_sparkle.frag","hash":"7eee695ba96e5afa80abfaf59973617a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons.dart","hash":"d8a7b96e6465831f5cf6de56ccddf6b4"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NOTICES.Z","hash":"f4961c2d1251e4c501a91fa594c5208d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\list_extensions.dart","hash":"9f8b50d98e75350b41d40fee06a9d7ed"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\service_extensions.dart","hash":"230a3518091834c1ebaba0eda6ad491e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_theme.dart","hash":"bace52570d61d5926c97587cddb344a9"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\fonts\\MaterialIcons-Regular.otf","hash":"e7069dfd19b331be16bed984668fe080"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_details.dart","hash":"bf4a95c97439fb24c526534818440cb4"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\constants.dart","hash":"0672d853d5097a03eddc7dbe558eeabd"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\variant.dart","hash":"8dea906a9b8773920b6d1ccea59807bf"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta.dart","hash":"696cb8f38fb01211afb7823d12080410"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\rendering.dart","hash":"31b6e401282dccfbeae67ee82469cbf6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\listener_helpers.dart","hash":"ff64cd1fd14ea82856fea36b0af41616"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\provider-6.1.5+1\\LICENSE","hash":"753206f0b81e6116b384683823069537"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\reorderable_list.dart","hash":"38274919141148a064c35a5dcfe13466"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\boolean_selector-2.1.2\\LICENSE","hash":"83228a1ae32476770262d4ff2ac6f984"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\encodable_value.h","hash":"04dce67f4b05424f416ea05234e988c5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_event.dart","hash":"9936ec027bb1a7d682262f2e82db2681"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\layout_builder.dart","hash":"bd3ebe387219b550945e4580a69d2cf5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_prototype_extent_list.dart","hash":"1cc862e37a6af483d4f60fdadd2f291d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_persistent_header.dart","hash":"0431405c606e6cad6f9e06eeeccd339f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_delegate.dart","hash":"b424a88fd26364ea438428dea8bf015c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codec.dart","hash":"16cc4a3c97bbfb29764163f9783954cf"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.exp","hash":"4731f225ddca54409748dfc4e224dc56"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\draggable_scrollable_sheet.dart","hash":"2b53349b74e82244dc685d68fc673aae"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_selectable_region_context_menu.dart","hash":"1fa6d2ba714d40456392772c9ba4ff46"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\painting.dart","hash":"e6c5d07cbc53020acc5c08062c8b57af"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\predictive_back_page_transitions_builder.dart","hash":"08c882255bb4c2001eaf299d9a98e0b4"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\app.dill","hash":"a87a06a12e2e7c44beefc44ad02d9e2c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\platform_view.dart","hash":"7615e0b5cdcdbde68ed7b94bef1589a8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar_button.dart","hash":"9039267556d5ee2e1526cd3b2ba731a4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail.dart","hash":"a6060d54ffea33073e7f40561256821e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel.dart","hash":"962a4bb93e7dfa96d275b59a8975e8ea"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\viewport.dart","hash":"abcfcc734ac8352e09bd3a26dfda2866"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\widgets.dart","hash":"476f7e0ce6cc850b4e078e91c0965c27"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spell_check.dart","hash":"7498ab451e1ca95d81055ac4e3a25079"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\colors.dart","hash":"21fd5695156d005f6793304998a2022e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\extensions.dart","hash":"38e17b28106d00f831c56d4e78ca7421"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\icudtl.dat","hash":"692337664e861ad322138061132dddc6"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\message_codec.h","hash":"b5013c9553dc459d5f91b8ec2bda3d0a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\stretch_effect.frag","hash":"cf38ac99d6e6daaedb2791d07af7f285"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\dart_plugin_registrant.dart","hash":"6c49f36c204d9c39ed8344462e4342f9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_theme.dart","hash":"694c3cc6e2d326daebadef63f0b05666"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer.dart","hash":"db799bf48af97b7c0edc93ad96b4a6da"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\encodable_value.h","hash":"04dce67f4b05424f416ea05234e988c5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterator.dart","hash":"6c54f90e0db5f42a13be6b3efeb4a04d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\performance_overlay.dart","hash":"4a77eafe460177c2a7183ec127faabff"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_windows-0.2.1\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_blue_plus-1.34.5\\LICENSE","hash":"2fa419ccd3bded8308570f2dc960d8c9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_file.dart","hash":"4cf51b507ca01fd11ba70cf2ab79a8e6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_stream.dart","hash":"f03120627f228b42bf6795032229d3bf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\persistent_hash_map.dart","hash":"cdd5f5d20cfc459f7fffc8d3492cdf55"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h","hash":"248c4e48231edda0bc7ac80722f15b53"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar_layout_delegate.dart","hash":"d2232e4bd0457a4a3eb6bd897846eb44"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar_theme.dart","hash":"a2a994e0517d2904cd9c0a83efd12ecd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar.dart","hash":"e1178b55c9a6264be20f8fb1b0bc3a2c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\basic.dart","hash":"311eee020e20251b71ba662023bce4fe"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\actions.dart","hash":"34efcbb6d5122ff0e131fa22b0929391"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_key.g.dart","hash":"9cc661dc8f3ce112455fa0ebb05c6a9f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_inserted_content.dart","hash":"903af109d740b48230bd021be6a1f40a"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\plugin_registrar.cc","hash":"3190b92da7033c643bf749e7f4266da8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_web_image_info_io.dart","hash":"c8ba4eb7463f2816b6b5c054b0876f2f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_theme.dart","hash":"da23e9a23f3c0bd8f03adb30165f3f2d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\service_extensions.dart","hash":"217b7c2fd7b1eccde5897e1f17fdccf9"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json","hash":"f3a664e105b4f792c6c7fe4e4d22c398"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\restoration.dart","hash":"9819b71536bfac5913f512334ed75897"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\opengl.dart","hash":"de7fb154b9b151b81a78d43ade695365"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\texture_registrar_impl.h","hash":"7ec35caedbfe35b37bd7aa66dab7219b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h","hash":"4707587e759b2b655852fc0e989c9e70"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wsmeans.dart","hash":"6c6dfd5ba4546c1f32201555d6cff215"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_timeline_io.dart","hash":"2b2385e013688dc5ccafac580f8f6999"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\debug.dart","hash":"c15b0c06c9817813063ea4c1023d57fa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\slotted_render_object_widget.dart","hash":"2babfd7c893533e7f7b3d1edcc075b64"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_activity.dart","hash":"f42c76814e98a5cc25aed661cac91aac"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_aware_image_provider.dart","hash":"118be27ff90e0836323d9c71078cb122"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\canonicalized_map.dart","hash":"f5e7b04452b0066dff82aec6597afdc5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\shifted_box.dart","hash":"ddde81656053eb6c26a5035a38e759ff"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\home_menu.g.dart","hash":"07230264b6ad4306fed087103930fd35"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\contrast_curve.dart","hash":"9a12cf2a3549924510006db4651a1743"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_theme.dart","hash":"9ce32e72d1ee3118f0e72c046aabd604"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\rotated_box.dart","hash":"4bac4761db1aa945a1bbf1db8c88ef92"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\table.dart","hash":"9f82c511b081a3e84e184b709cab549d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix2.dart","hash":"945227f3863339e388d92c2b3bfbf673"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\dart_project.h","hash":"21a40fe4d1f98493dd01865fc200d152"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_arrow.g.dart","hash":"2285a845b6ab95def71dcf8f121b806b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar.dart","hash":"7bd66fdf9d5227b6cbd227b8966cfc22"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\animation.dart","hash":"e76c07fd6945a4eadb2aeebf87b643bd"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\LICENSE","hash":"d2e1c26363672670d1aa5cc58334a83b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\box.dart","hash":"9af75494b3081c35757f032108afb1b4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox.dart","hash":"03aa37d951cd798f5d8a4078b4aba104"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view.h","hash":"33a6baf4984ec4c299c0b05cef6968ed"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_theme.dart","hash":"cc73b974cea8f36b579e019233f5f39c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard.dart","hash":"d25d0e31469107697284cee9f9090e54"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\oval_border.dart","hash":"a4bd9e0add3bd13842fedfbd33ba0192"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\undo_manager.dart","hash":"537bcc58ce69b142f523712215ccdfb8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\preferred_size.dart","hash":"aff356351126de3409e033a766831f87"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\notification_listener.dart","hash":"ffe5ffa81a95dfa29637da7f638fffbe"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_selection_style.dart","hash":"c64b32c068f0d8679ed2b8d699659780"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button.dart","hash":"1059f65f33843ca1628e4c8f075092c3"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\async-2.13.0\\LICENSE","hash":"39062f759b587cf2d49199959513204a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\standard_component_type.dart","hash":"702ebe43a77fbc5d1e1ea457e0bce223"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\search_ellipsis.g.dart","hash":"4213cdf8a94244f8d19a59844563dd53"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_list_tile.dart","hash":"553793bb06ad5176743487fd656852c5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\editable_text.dart","hash":"b2827ac117f36603acb22632bac7ca85"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\add_event.g.dart","hash":"413144882e92d0a27858427f45f214b9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\matcher-0.12.17\\LICENSE","hash":"e9f463669bd6dfea2166dcdcbf392645"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_home.g.dart","hash":"59ba7bdfc57111a2c59ae46a61e0daa1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\automatic_keep_alive.dart","hash":"8dd09f1d41dd7be02f30df6fb3b84cbc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_manager.dart","hash":"3f15a5685ce608b5c0442a8f588b7e16"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_layout_metrics.dart","hash":"dc64ebb08fcf29bdc05884be98af7daf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_painter.dart","hash":"d89e2cad665d0f0daed7249b1ec6fbeb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tap_region.dart","hash":"d9e2c84662ba680514624acfe9f95df8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fill.dart","hash":"40110052956a9ba346edc09b14dc1c14"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\boollist.dart","hash":"206ef1a664f500f173416d5634d95c8b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page_transitions_theme.dart","hash":"b2578c5518dae2c2d899a8c0dc7625ef"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\test_api-0.7.7\\LICENSE","hash":"3323850953be5c35d320c2035aad1a87"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_sink.h","hash":"b1b98c1cf40abd6a3c308182c4822476"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection.dart","hash":"f88298d3c84abc4b7990d00d4d6bdbf7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_scaler.dart","hash":"13eb2b4e1e2abfcd739ea5addab1ff77"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_decoration.dart","hash":"6c265291d117d07f37ec2e4e428169e4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker_theme.dart","hash":"f21b9f16b5c746c086afe83b15e0dc41"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_wheel_viewport.dart","hash":"6821f10183352d41d36138e2abc90a3c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\cam16.dart","hash":"ca959e5242b0f3616ee4b630b9866a51"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_field.dart","hash":"f860ffee610267a181a1e310f63266be"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_set.dart","hash":"1b20a6e406ca8e79675b2ebd9b362d10"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\user_accounts_drawer_header.dart","hash":"c27fa880a7f9c14cb358f8e6842aa02f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_tile.dart","hash":"513fae0e50853fca5bed4ec2ac746daa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_features.dart","hash":"d5c54cb86a7c6b930659e867a4b2fdc6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_visibility.dart","hash":"832d4f6b469c388759ffcaf981e16f12"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_menu_anchor.dart","hash":"ed11679fb094e0b3a6ec95ad54a5b917"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_well.dart","hash":"e7efd06ce9e8d1c6dece34b956de5d44"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_style.dart","hash":"a7db795432b2d9d174235f88f4c8e57c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\friction_simulation.dart","hash":"9ee10f71d143dd2afab234cf329b6404"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\gravity_simulation.dart","hash":"e39c804b77ec1bf1f6e4d77e362192c1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_theme.dart","hash":"bd699c269f820629fe608bdb2e207041"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\localizations.dart","hash":"90f13e00da93a85fd91faa6d3690590f"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\string_utils.dart","hash":"603b7b0647b2f77517d6e5cf1d073e5a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\licenses.dart","hash":"43be915d6729f5b59a5dc76fd923b31b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing.dart","hash":"1be64f7d80a3db5d33ac240131681562"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\view.dart","hash":"80fb38f550a841f79be89bc691874ae1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_editing_intents.dart","hash":"a0836fe16e69a1daeee421a5dd73f761"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\LICENSE","hash":"22aea0b7487320a5aeef22c3f2dfc977"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\annotations.dart","hash":"b98145bd156a782be220cb3f652ba0a4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\engine.stamp","hash":"350efd17458509a488d99295eac04405"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\typography.dart","hash":"a54de18fb67e2840ea1dadab3c419c8d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile_theme.dart","hash":"075ab668569c4b788afdcff8d81027ae"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overlay.dart","hash":"464f49fba237db1584902cc70eb44c4c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_padding.dart","hash":"93ea53606b5bcb9f94323580b8a73a66"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\size_changed_layout_notifier.dart","hash":"3b88bbef523e78633182df3f70dbe5e4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\binding.dart","hash":"669a310a3bc1c9e31867d4d385d491de"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_network_image_io.dart","hash":"a33d4120ed52442babf73d4cbd78aa95"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\long_press.dart","hash":"ebeba64894a6beb9ad339b74b183f1e1"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\obb3.dart","hash":"54c7f23362a7e78be04b113d00022090"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_tree.dart","hash":"652549c5317a0d83b3a9f7443b084640"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\visibility.dart","hash":"b20456ffe91e5130c028ea7993352064"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\binding.dart","hash":"65be1e608dcdda9c1ecd925c4cc9d27c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_highlight.dart","hash":"75c9ff9b208231970c1ee6b367c99fa7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog.dart","hash":"11c96f49c5b4d10d603c6be9bac5d4ad"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\physics.dart","hash":"ffd7e9991334466f08df7afe0c721048"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search.dart","hash":"3a8582a42202dd9c13976accdb4e8b18"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\binding.dart","hash":"e761fb30d10c79da8dbae27ffd274efc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\error.dart","hash":"60f88878959c8f38a1f8cf481bc3d76a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state.dart","hash":"b70f41fd4d6a18105cfbabee20ece412"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\service_extensions.dart","hash":"ba0c8dd8a234a449050e76d22738480f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_channels.dart","hash":"ea30280875059c9384efbaa5b7a82572"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.h","hash":"68c93d1fb6ddeb8791194bed4b5b33a7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\beveled_rectangle_border.dart","hash":"a4474d2d39dd9373580879eb4bd18ab7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_service.dart","hash":"14395b04f8af7df40980d5702a42dbf8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binary_messenger.dart","hash":"57699e53ee54d843153d1ef4dd086d64"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge.dart","hash":"219d5fd96cf0855114992695192555ed"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_form_field.dart","hash":"1a6304bb0f5374b6a1c8c4db621df443"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app.dart","hash":"a5e2d1331824f650dd6993a1e3b1b7be"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_export.h","hash":"51d6ddd086e800d34c1d143004c474fd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\async.dart","hash":"a0102940bd56f4412d646fd58582541f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overflow_bar.dart","hash":"823b3b44cc184688e1fd926c923ada17"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\autocomplete.dart","hash":"d026f8e14f8370bc75839fb519889fe5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_provider.dart","hash":"f19e1c50ee77b2be73523d48d8e5cf60"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_bundle.dart","hash":"a9e584128a0df9bd0371db226e84ca30"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\nested_scroll_view.dart","hash":"5a635356df85badd74b5c4d4a11bde99"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\play_pause.g.dart","hash":"4326580ee93b3a584477cc185146eb2f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\edge_insets.dart","hash":"e5c3c92d54881cd31b4200eda4923c2a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_rainbow.dart","hash":"0bc80db5885f9d8ecc0f80ddab6fe8b4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_resizing_header.dart","hash":"b98f95a3a621261fdd97d76521858eaf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dual_transition_builder.dart","hash":"99fb2e65ec78997546349e740526b24c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button.dart","hash":"9276f84dd7c2562d80977b3c7cfaf088"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar_theme.dart","hash":"33c98e4e508d3ac10e634e62cdbbce4c"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h","hash":"ee739ab16ee0e2964edc9275a0379095"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\adaptive_text_selection_toolbar.dart","hash":"2081e99c40e219da04ef7bfb85ff4b34"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\debug.dart","hash":"9bdb8226a64b47b9b7ed09557fa63ee7"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_anchor.dart","hash":"ba6d3f3975912afd5c4b50a7b842af27"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_data.dart","hash":"3a20b4d301e83ddf2a700e43c3d13f19"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\win_ble\\assets\\BLEServer.exe","hash":"28aa0e2566083c860f029ff4bc32c4ce"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_sound.dart","hash":"d41266a023506a636336e4579948d98a"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\ink_sparkle.frag","hash":"8af2b6b4632d42b4e1701ecda1a3448a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\LICENSE","hash":"83228a1ae32476770262d4ff2ac6f984"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\about.dart","hash":"bcaa32786ba498882d0f9f91209f2ca6"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\LICENSE","hash":"39062f759b587cf2d49199959513204a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\colors.dart","hash":"f3747e025d835d0ff5cfd904d925dea2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_field.dart","hash":"670780cf70bca33a9203fdb5abae8dca"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position_with_single_context.dart","hash":"cf39132e96645ad4603d01e2a71f2ba6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h","hash":"6bfbb61c519f63386a0fb55608dbea90"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_icon.dart","hash":"e7fb9fd369c9f97c921afb96147198d2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\alignment.dart","hash":"c76ec11615b63e5cf649dc032628e05e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h","hash":"0bbbe470228d787a92d567a95faa2b33"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet.dart","hash":"fd2072bebc35946f75ae485829ca47f8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\snapshot_widget.dart","hash":"51b88420df990277e38f7347ce6392ca"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\LICENSE","hash":"3b954371d922e30c595d3f72f54bb6e4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons.dart","hash":"06e9ea129e1ca7dd25a73a70f88d92b3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_win32.dart","hash":"96024e46bb5f7e79c4902608774a2c49"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\string_scanner-1.4.1\\LICENSE","hash":"e9f463669bd6dfea2166dcdcbf392645"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar.dart","hash":"19d0c4b4fd17308c98f89714315b2ba6"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_channel.h","hash":"4dd51b45764459d2f9ea5b5057507020"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector3.dart","hash":"d4252f423175e5c21fca23dc24154b84"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\icudtl.dat","hash":"692337664e861ad322138061132dddc6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_section.dart","hash":"9d21d08750f63eeb16370b13ff7829de"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme_data.dart","hash":"dcabc22f7ca61ea531efdea3085b3a97"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_ripple.dart","hash":"254d9cad871687318f9b1a9f7fe10214"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap.dart","hash":"69bf6a34536c46e2dfb9e9b7c4478abf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\route.dart","hash":"02b84834ca3c0523372769b8bb6d191b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons.dart","hash":"a9144edaf60fb5f4cc32f06a6733a523"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\utilities.dart","hash":"121fcbdc1af81a0fd804490f85357fa0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shape_decoration.dart","hash":"e4523a14b383a509595ff9501c8cedf3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\localizations.dart","hash":"7012801c3ddfc9064848533e056afa16"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\frustum.dart","hash":"fb2be6f27b32bb1ab12dd6aea8c5ecda"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\spell_check_suggestions_toolbar.dart","hash":"ac93f36e666c5153264d49da5c5f556d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality.dart","hash":"46e577ec532e21029e9cee153d7ca434"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\capabilities.dart","hash":"2924a2b4f15d6d9a055f71d47d94521e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\characters.dart","hash":"fa2a57b3b873fb7db4b8b961735e4ca3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\pkg\\sky_engine\\LICENSE","hash":"7fb3d94679b72d8a9f83d4942cbc351a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_text_editing_shortcuts.dart","hash":"4c189683efb54be84e1a3f8d0ec43c6f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\inline_span.dart","hash":"716cd061dfa876531364acffce466bc5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wu.dart","hash":"c0da8171c63f0ab4e822dd094fc2c595"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\debug.dart","hash":"f807cf1d9ae76465fdb728cbda260cec"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification_observer.dart","hash":"69d0c8243d0817f215d503cad0375b78"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf16.dart","hash":"10969c23d56bc924ded3adedeb13ecff"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\allocation.dart","hash":"9d62f4f58e8d63a8e106a1158eb13a02"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\safe_area.dart","hash":"29eb69935c586ca665d0f6f7aa84a06d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_resolution.dart","hash":"df6b7325835a6d1da457ca5056ab1860"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\borders.dart","hash":"fa7146d472a712331eef3a404e2fabda"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\empty_unmodifiable_set.dart","hash":"0949b8197a6069783a78f4bb0a373fb0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table.dart","hash":"e4b387e548ce9f5cc87228ace0b2abba"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator_pop_handler.dart","hash":"1d7b10a04a356e2e37151eb235c2db90"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\deferred_component.dart","hash":"f20b8958b0c35e9bbea75a43c9cf0e59"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\print.dart","hash":"d073924ebcc169bd1a47c3f695925478"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_anchor.dart","hash":"87ed4a9daf6592b6edd2ac053ec4ade6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\semantics.dart","hash":"a9d4e4b3f6357c540f77101737a25e4e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_date_picker_form_field.dart","hash":"52294670f93a3a50d40c4c4f7dc4a4e6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu_theme.dart","hash":"008f9bd544a605eb69f5aec36ff9bd2e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\paragraph.dart","hash":"5e30cb9b8231945521c0c6bd2af3d48a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\context.dart","hash":"daeb052f1089d4e84d8a22acf56c1da2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\team.dart","hash":"193d1801b76c52075287857a01d3fe83"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider_lab.dart","hash":"6566a35ff0dea9376debf257bdb08fba"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_views.dart","hash":"56650c471554cc0df7c20d4484fb9f3d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\unique_widget.dart","hash":"0bc32d9519ad188655722c1b5df8e896"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_border.dart","hash":"dab909dedbbf46bb14d7a26091ac10b7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\picker.dart","hash":"0241c41bf085a61b07eae0d09e45edfa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\debug.dart","hash":"136b08c4413778ae615af5f45d39ed93"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta_meta.dart","hash":"fe7e235a7623f4d325eb05394e6306f0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button_theme.dart","hash":"ea75ea73bf570ceefb21bed44d38a168"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\constants.dart","hash":"c6dd0c20e5521905acdd0e209727ec65"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\arena.dart","hash":"04f3f5a6ad35c823aef3b3033dc66c3c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_anchors.dart","hash":"bf2ed9d304c7f4d1e982b118bbe93bf2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button_theme.dart","hash":"64c2e45a874a22cbf65b357b2f5ca63c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\arrow_menu.g.dart","hash":"9621a4c337d24a926ff50126ce88d7fe"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown.dart","hash":"ef1bf063bfb12864828934eb5938794d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_controller.dart","hash":"99712ab0098106c505b424f8542edeca"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_celebi.dart","hash":"f12f9a9b8bb504f4617bfd1c00d403f0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\plugin_registrar.cc","hash":"3190b92da7033c643bf749e7f4266da8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h","hash":"815f4a5fbad9381269e2c216507285cd"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vm_service-15.0.2\\LICENSE","hash":"5bd4f0c87c75d94b51576389aeaef297"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\pause_play.g.dart","hash":"51069c14005cc63df73f7c8db5520f31"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\display_feature_sub_screen.dart","hash":"fd9b487c6b333f8de2f5b2fbe769536f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\native_assets.dart","hash":"f78c405bcece3968277b212042da9ed6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\orientation_builder.dart","hash":"3c3696eca846a003eb2b2316020227c7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable.dart","hash":"17fb2471ad3a7ddd36d138e79694387a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quad.dart","hash":"25dd0d36ba8109e3199faf508b41d633"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\segmented_control.dart","hash":"aee5cb4565b2150c519827665632f869"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\color_filter.dart","hash":"29426d64d0c201a4d7e7492434b13463"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pop_scope.dart","hash":"03e34b6476f2a5b43080c9fefcefe9ea"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\velocity_tracker.dart","hash":"d0a86046f0bc5262b7752d63d91a5005"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_source.dart","hash":"bdd3a31817dfc052c506f3a7e2556fcb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_theme.dart","hash":"e68a5f2704f267571eef4fa91c771af5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug_overflow_indicator.dart","hash":"8b9cac53c0c4d1f844faa9f5f1d2a922"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\material_color_utilities.dart","hash":"11df661a909009a918e6eec82d13e3ff"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\material.dart","hash":"c4d6b1cc1407761dfb2b51713416d679"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autofill.dart","hash":"900672c4f3a8c395331517ee4a59ea2c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\list_wheel_scroll_view.dart","hash":"63f5ff9c4aa1f2b9a08c10fef73563fd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\serialization.dart","hash":"6557b0521d669043fe957bb915c97e38"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\mergeable_material.dart","hash":"076c0d9821b95cee733505b09aaf0729"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween_sequence.dart","hash":"1245b0b05f60c57164018c5c918aa7d3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_layout_delegate.dart","hash":"f9aa2eb956d270d4df8b3a7cd5ac52d7"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\clock-1.1.2\\LICENSE","hash":"175792518e4ac015ab6696d16c4f607e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\status_transitions.dart","hash":"c909abaa7c0b6b52aa22512668ededb0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_android.dart","hash":"249b2817c1c912b9942e8acc7987adb0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\queue_list.dart","hash":"02139a0e85c6b42bceaf3377d2aee3de"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_cursor.dart","hash":"d268d6fb1caed2556859fc88f38f20d7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\stack.dart","hash":"c5497a0e44eddfb20621af37ecbce105"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_view_controller.cc","hash":"f3e8e48b8e3ae1ebcedbe20033c58184"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_html_element_view_io.dart","hash":"aab7bf02fcfefca8bc2a8c24f574ceda"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h","hash":"302e2b130c3c67b2a24ed2497663e45a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_io.dart","hash":"1c9af06f2748a7cbb6e52491277e73c6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\node.dart","hash":"eb8af6a9d85f134dd7d7c1ae2dd07e29"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app_lifecycle_listener.dart","hash":"59f3befbfab8a823bd8254bacd7cfca5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\spring_simulation.dart","hash":"976911a24895e34b12dc8b3227e70de9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animations.dart","hash":"0d91c8c6ebb2c8abf67598e76180c4f5"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h","hash":"4707587e759b2b655852fc0e989c9e70"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h","hash":"248c4e48231edda0bc7ac80722f15b53"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\pubspec.yaml","hash":"5a05bdcafef97a35d4ca6ceaaed40829"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\choice_chip.dart","hash":"eb1f8c19bb309d54e9efc12e5162e3f4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app.dart","hash":"7ca5594b807d9a6d1513e646e1ee2e26"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_plugin_registrar.h","hash":"205b172dd4be89df08a835c5afcd2c1a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tabs.dart","hash":"2b0cddd1d1ad0c5ce36eca8effc85cd6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sensitive_content.dart","hash":"03fa43612a3510ac1b1671b945d1f91f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_manifest.dart","hash":"7bf25e50330fdcf0662dfa67d5348709"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table.dart","hash":"863017bc41d1194609285665ca8e5a2e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker.dart","hash":"6138d0bd8dc3eab901758a9cafc6b6a4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_view.dart","hash":"d48d52bc573d346cad979541a2f68329"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\ellipsis_search.g.dart","hash":"13bceb5508fcefacc9ed46137d43844e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button_theme.dart","hash":"225d683fb2401c77aae17db2c95d0a02"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date.dart","hash":"96c0765a9ea1b291e0d7986fbebbdecd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.lib","hash":"542810bc284c36be2bdf07587184db3f"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h","hash":"815f4a5fbad9381269e2c216507285cd"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\sphere.dart","hash":"ff5d66c50ec833a263625d39f0c195b9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_color.dart","hash":"7ffb6e525c28a185f737e3e6f198f694"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\math_utils.dart","hash":"e4ee21048ab83cc50d61ac3784afa9f5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet_theme.dart","hash":"a400dfa676904fa8a84c48146ff8e554"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_span.dart","hash":"f4fccdf5a9bab5fbff2ac664421681d2"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\hct.dart","hash":"596fb2e55b1ff1662e4bd67461fdc89d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\posix.dart","hash":"5e054086533f32f7181757a17890ae56"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h","hash":"55b4be5728dfb16220b1bda5bdace3fe"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog_theme.dart","hash":"6fddbbac3ef4a4c7453594e590fe7fef"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll","hash":"9dd9bc1c173a119dfb1d48eec6f3e96c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\clip.dart","hash":"6790958a6027b5951c84e721543745a1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icons.dart","hash":"9f7270100e64dae8750b9ae54cde56e4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation.dart","hash":"73d837564acafc178f5bf73dc50994e0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\form.dart","hash":"a2666a989636c69801e6b65107dc5cff"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_context.dart","hash":"a2701656bb3160ea810ab576c50cbd65"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\diagnostics.dart","hash":"7dffcdeb67c51c8c924c3cd7f7a59a20"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\object.dart","hash":"b614d8172098403c683c68aafa3e92e8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\expansion_tile.dart","hash":"6fca83eb8696ac5122910ce0a78041dc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h","hash":"ee739ab16ee0e2964edc9275a0379095"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_monochrome.dart","hash":"66272a6751b167051ba879724cfe5749"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile.dart","hash":"0c3c4c483441a8a71d8438d8ff3f81a8"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\error_helpers.dart","hash":"c83781cf0c38883486f707cddbb96773"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\slider.dart","hash":"c9884a5171ada4dce26d7680d4608135"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_list_tile.dart","hash":"f9181e77551bacb656df2edfcf3c6ca5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix4.dart","hash":"ae36c7cc9b21f98bedf401f2d67a0fd4"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_extensions.dart","hash":"5843b4750179f6099d443212b76f04a2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_physics.dart","hash":"bad55a5ef55621d74ff76d281462bdd2"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\platform.dart","hash":"d2bab4c7d26ccfe4608fe8b47dd3b75c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button.dart","hash":"7f8debc1e3869d684292dce50135ad85"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\guid.dart","hash":"55bb53dd4f9ed89c9ff88c204b59293c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\radio_group.dart","hash":"e35b324327e4ceff78e09094c543b354"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dismissible.dart","hash":"ec02b737e91b9e3831c965d2cddf820c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\predictive_back_event.dart","hash":"7969cd07979b38a25a413140df9b04fc"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_lints-4.0.0\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\flutter_logo.dart","hash":"494881558ae50a1d5273ceb66b43ed85"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\refresh_indicator.dart","hash":"b2063982bf8c83d99f990eb40cf86824"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\core_implementations.cc","hash":"91cfe8e97858850acdbc8891453ce5bc"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\priority_queue.dart","hash":"34a4d340931147322eaddc77fdc65c22"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection.dart","hash":"237cb7968e03b0637170c492e353c920"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_platform_interface-4.3.0\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\interface_level.dart","hash":"b62f50ac1dc3bb09452f43e936636040"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_bar_theme.dart","hash":"46b6c3bc78aaea7e746e7525f097c370"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\bottom_navigation_bar_item.dart","hash":"47474102c009e7099f3a9bf1d7ea8e06"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\scrollbar.dart","hash":"ef78266d8f88424f55e3135455ee90cf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\adaptive_text_selection_toolbar.dart","hash":"97fe7ee22c2d610b9259874f37014c82"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.lib","hash":"542810bc284c36be2bdf07587184db3f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme.dart","hash":"a93bdf24774a4f17d91eadb26603a2c7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport_offset.dart","hash":"f3ce35c15285bb22d0a813b27365491a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar.dart","hash":"dd4dea261c4656edf01a63fed973e1f4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h","hash":"33562e00fd62a55bd23deeecf3a69a51"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_fill.dart","hash":"1fbfdb508cbaf318a89890747d632a67"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_html-0.1.3+5\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binding.dart","hash":"56acd7c0eda6ac4d840ea89d3828e922"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\wrappers.dart","hash":"21e56afda1f096f0425a34987708ed56"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu.dart","hash":"93139a28cffc298872e9efce8962ad22"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\desktop_text_selection_toolbar_layout_delegate.dart","hash":"6c685d31c42c2f60c5082e01574011e4"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\noise.dart","hash":"14ee798b10cb318d96667b32b245f21f"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_scheme.dart","hash":"7536ace8732469863c97185648bb15a9"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h","hash":"2b2405abfa2cc54351b6ee6ad02585c0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\cupertino.dart","hash":"5e7769c1e32cd3c05e4b01d0460e7e52"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\haptic_feedback.dart","hash":"de48d59f2b8a22c29dd37492fb4443ec"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_list.dart","hash":"5b894ae18be3e2442a34288833184ca9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\placeholder.dart","hash":"02aae1bf860b2223e4063803dd781734"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\thumb_painter.dart","hash":"37eed7d66da0394406802702fa40567e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\lib\\plugin_platform_interface.dart","hash":"8e49d86f5f9c801960f1d579ca210eab"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\scribe.dart","hash":"fc0d5385b1ef6f854be4e193437b39b6"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_call.h","hash":"fbad5bf3bd488842a461addc9ab88fb0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\curves.dart","hash":"2fac118c3201a4bac960d7430ddda0c6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_viewport.dart","hash":"a4fede673d0bcdc69faf1e6cda60547f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pages.dart","hash":"3e536a3acaaadb822a23d4e1b88f21c7"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\messages.g.dart","hash":"0934921f2b1be02ed449d79ef28d13bf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\reorderable_list.dart","hash":"d695cb1b6bb95b60a4338c741737ce4a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\basic_types.dart","hash":"00f26750b380e279fd67c68c79734999"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer.dart","hash":"0b928ee57cd60c508f43032733a09bc4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_scroll_view.dart","hash":"05f21af80225037c97e3a564d93e1a76"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\clipboard.dart","hash":"f63442b56372cdf284974de30fba136c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_simulation.dart","hash":"2fe41384c97b732ca4986150ae7a002e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\value_listenable_builder.dart","hash":"ec3a5f7a8288542858278a8702578709"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_location.dart","hash":"f3a43f7f1e3cdd35326341d9fe51fdee"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\LICENSE","hash":"2b36ca50262dc615e560c27654badb26"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id.dart","hash":"32f5f78e5648f98d8b602c6233aa4fc5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\date_picker.dart","hash":"3d74b343ba20b49b6e9e7428074c1d43"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_storage.dart","hash":"7e1916e19ed191fb74d54f4e67662098"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_section.dart","hash":"449cdc2bfb9193c6686e97527cc29646"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\undo_history.dart","hash":"e7ca145d8d308187bc0127bd941b1759"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_engine.cc","hash":"4bca7c636cd1b0ea580274c113c58284"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_messenger.h","hash":"9c15531692496dbfcb820431343d92fa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shader_warm_up.dart","hash":"a5b2132b6c446c705361301cb9c2e261"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\magnifier.dart","hash":"40cf771f970eb76cd0485217590fcbd3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_switcher.dart","hash":"43a74b1aaf5de8861ec00f3a3cf014fc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spacer.dart","hash":"977b101929ac6f80c9dab61b4f232bda"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json","hash":"0fb5507bf2ece55d480aa9196b7e0f82"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\single_child_scroll_view.dart","hash":"4a9437bcc5b4bc801a155dc8b18ca80b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\folders.dart","hash":"4bd805daf5d0a52cb80a5ff67f37d1fd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_tree.dart","hash":"e540a5dc3199ca79ddb96a6f82754f45"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fidelity.dart","hash":"553c5e7dc9700c1fa053cd78c1dcd60a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_decoder.dart","hash":"034c9a74f518b43df9ce8af9343c11cd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\geometry.dart","hash":"eb7a98ab37f05e9b6056432e3c642c37"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autocomplete.dart","hash":"2f9632a4edb33caf328b73d92c520c26"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\path_provider_windows_real.dart","hash":"43f4676f21ce5a48daf4878201eb46bb"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\tonal_palette.dart","hash":"44b3c2a3d6e67a3213a49cce58fed932"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\assets\\CupertinoIcons.ttf","hash":"b93248a553f9e8bc17f1065929d5934b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile.dart","hash":"36b808e976f035411a6b13a09cca7717"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_platform_io.dart","hash":"34db9d7c9ebc27ae8cf7b0284f83365e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollbar.dart","hash":"8894af42edd76d1773985781863ebbb3"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quaternion.dart","hash":"55675ef4bbddffa94d962bd52b3088ca"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_chip.dart","hash":"3439e88de4cdc23b3bb0bc629e7f48b1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_notifier.dart","hash":"93219dc70f767a24408583015695d38d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h","hash":"62be5ae665a6b931d6dc9ac4b27d6c93"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\bitfield.dart","hash":"9c6dc856bf70678df688ea5a308290e3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\theme.dart","hash":"a1ff3e299057f2879ddea65c6af55016"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\core_implementations.cc","hash":"91cfe8e97858850acdbc8891453ce5bc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar.dart","hash":"bff9d793623d4d6103a356b97c7787d5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\flexible_space_bar.dart","hash":"e86e2962f065227a75d00a5a21db98ba"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_paint.dart","hash":"5df8af1563c15a74bcddd30166c15d32"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_layout_builder.dart","hash":"6c0b758a4a7b8966ccbd64932d1ceefc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\continuous_rectangle_border.dart","hash":"c6361b93d4a266527cc473cc2570f714"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver.dart","hash":"57e8736a646452e9354781d93d36b259"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_value_indicator_shape.dart","hash":"30da11f44c32c59f9d635ede0be91e05"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_group.dart","hash":"d623a3be2c5d45cdf3e867b13f9db5df"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\standard_codec.cc","hash":"035f8af9a9a084e129ceef3fa0396c47"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_codec.h","hash":"1d712b93e2dd2e28cb67a55a8d484694"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu.dart","hash":"69f486ffd7a2a0c72b6b1fef540bcfcf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing_delta.dart","hash":"3da0a4c6b5e4be03fa0e8e2871e98d01"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_keyboard_listener.dart","hash":"5588e04d2462fa3c03dc939826b0c8d1"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\dart_build_result.json","hash":"960ab6418cf9f6cfaa2c655a3991200e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\temperature\\temperature_cache.dart","hash":"a6350a577e531a76d89b24942fca3073"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\arena.dart","hash":"527f66bca3f4ace3771d5ffce977c225"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\comparators.dart","hash":"8ac28b43cbabd2954dafb72dc9a58f01"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\placeholder_span.dart","hash":"fbf98f47029acb307401fb5299babd1b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\color_scheme.dart","hash":"8917911ac012c413faa96564e1a836e1"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\lib\\path_provider.dart","hash":"e08429988b4639fb29cd66bfdc497d90"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_image_io.dart","hash":"7f7fc8274f08decca0738d6873b9b8fa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\standard_codec.cc","hash":"035f8af9a9a084e129ceef3fa0396c47"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codecs.dart","hash":"346b42d393ed6e2add791af921eb2df0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector.dart","hash":"1205ed5e14a59c237c712b8a495b1981"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\tweens.dart","hash":"f9cf43c94d23a1e1093f4f1cfd789d18"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fixed_extent_list.dart","hash":"bafcec7a5ab6618e86dbb226a95165a8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\lsq_solver.dart","hash":"de0bfaaba8ed27ab87c003e44e85d35d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\object.dart","hash":"0b47cfcd7de73283298ff3122adecb51"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\LICENSE","hash":"2b36ca50262dc615e560c27654badb26"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_set.dart","hash":"4b5d82ddeb09bc46ae0e980616ce0109"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\event_add.g.dart","hash":"7c9757d3cc07fc4355bb72187af0413e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_scaffold.dart","hash":"220eb17aa14783375f802e8d5cf5c49b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\view.dart","hash":"3723330b142a3d6611982deda6f20021"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail_theme.dart","hash":"02a0a88eb966f2e401bef5e9b2d68f37"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker-11.0.2\\LICENSE","hash":"f721b495d225cd93026aaeb2f6e41bcc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\scale.dart","hash":"803b824ace4a5c6a4aa8d037adc9005c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\primary_scroll_controller.dart","hash":"c8bb5ac3ad9190c2cb878fdab2f4ea7c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler-11.4.0\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button_theme.dart","hash":"bb1616431e7e339d1d3ff7056d346b4e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\service_extensions.dart","hash":"f45299fdabda0bd3b2ed77068c7d1de6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevation_overlay.dart","hash":"9b9ab2c0595d95cef9e27ae03e36991d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable_helpers.dart","hash":"384b8a348ed8407ab8c3cb03d75dcb25"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\LICENSE","hash":"ca58010597a5732e6aa48c6517ab7daf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card.dart","hash":"1eb9cc478ea7bda3219d6e73edcb2929"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_content.dart","hash":"78e53d9a4963c0d19c5ea355a0946e5d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\win32_wrappers.dart","hash":"af7270fd3861278053b1c45a7b66ece3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\dialog.dart","hash":"d9a1c61bbefcbf1f65d9ab8f46ecbe26"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_bitfield_io.dart","hash":"ae3ea28df9363a4eb82872e4a3573f77"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\fractional_offset.dart","hash":"375378eb6cf9297d6bcfe260059193a8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_input.dart","hash":"aed1ef3f70577688dc5e8e241bd653f9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\view_list.g.dart","hash":"97fc1400dd55cb4fceecb33260f0f978"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_controller.dart","hash":"fb135e4f69a7263276e51497034f9784"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_border.dart","hash":"2a64de918fa5fca4e4d39bfd64d71ae1"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\collection.dart","hash":"4ba0a4163d73b3df00db62013fb0604e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu_action.dart","hash":"eb3b6369f8af356037fedee8b6733b3a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\notched_shapes.dart","hash":"ebfe0f38e8c89b577d8b009c89f6c019"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\heroes.dart","hash":"2110dfc63fbc2fee8ce2dbcffaa659d1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_icons_theme.dart","hash":"a447e7eae78df8eabb0cc923a31c1f1d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_channel.h","hash":"4dd51b45764459d2f9ea5b5057507020"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween.dart","hash":"deb256229ac9a60b1f5dee744af2411c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_platform_selectable_region_context_menu_io.dart","hash":"12d3b22764f1a64ff214cabee2858a00"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\colors.dart","hash":"b62b9e4874beca4adb96d6ebfd8e8dfb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\colors.dart","hash":"1ac063d4248ed2e410c8fdec0aa2f45b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\url.dart","hash":"13c8dcc201f970674db72fbbd0505581"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.pdb","hash":"e2fcea9bfd35a745a5fe8541b9d994d3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\paginated_data_table.dart","hash":"fbf653ceb9b7ec959636c7d23fe91fdf"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_grid.dart","hash":"39661a5a9d20c51d58206d0b0b064b23"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_sliver.dart","hash":"f45f1667f3d7ae5aeca1d46e9687777e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar.dart","hash":"cd931530000e61b7c735cee88dab9ad8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator_theme.dart","hash":"54a27f9d204fedacf9c434a58e744132"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multidrag.dart","hash":"e816d9ff65a2c6401329b0df85fa47c7"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\stretch_effect.frag","hash":"2d7d125c054e3f15e7e6a1a3f9fa9fc3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flavor.dart","hash":"5364518d72b7d6240c9d090f9bb7df83"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider.dart","hash":"7504c44d1fa6150901dd65ec78877be0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\term_glyph-1.2.2\\LICENSE","hash":"901fb8012bd0bea60fea67092c26b918"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\recognizer.dart","hash":"b4fed52bb46486de6a78ba379817e3f6"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\binary_messenger_impl.h","hash":"286e55d651260380486c1ca7a2c44578"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\circle_border.dart","hash":"8ad25d6c38ddc8ce7abb828b97f4571a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_chip.dart","hash":"e439e835e5295ba822d8db4be0508c24"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\container.dart","hash":"f8397448a8a64fc128c846f06c3979f5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_zip.dart","hash":"df699735e3bcd730f16ce377d562f787"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\path_provider_platform_interface.dart","hash":"09b3f3b1ef14ce885c016f2eba98f3da"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_floating_header.dart","hash":"4b47948751192afd79eae2fa8917d954"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_menu_bar.dart","hash":"f69d6b5c88ffd8491b978955e1f66cad"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\vector_math_64.dart","hash":"95bedb83cd5b163e43b554086b016380"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_texture_registrar.h","hash":"4ffbfcf8b88a9690e82543b1761e81d5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_persistent_header.dart","hash":"2a36080f4719a0b4485bff0582d9894b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\triangle.dart","hash":"2083695b7b9150b87307af446032ba45"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider.dart","hash":"bca575ff5911983777226c849ee75f39"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set_controller.dart","hash":"f301af2d0392296f456363085becbf47"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_decoration.dart","hash":"cb9617d35408474cec5c44f6d57c0faa"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar_theme.dart","hash":"3802c3c76384f439356f6f949bedadbd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\disposable_build_context.dart","hash":"9f9fef5d5732d2b083ce7c05aff2e265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\app.dart","hash":"30dd8dc5c28515ba9e4d82be9b4be2ec"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection.dart","hash":"06c028d173194ddf57a28182ab5be7fb"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\intersection_result.dart","hash":"866257a42b6b721549b351382b365c47"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_map.dart","hash":"13c9680b76d03cbd8c23463259d8deb1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\switch.dart","hash":"b50491b4a13ed3ee5f0bf3fbccaa33c7"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h","hash":"09399c3c509a601a970f6efd340a2529"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_chrome.dart","hash":"bb208871e05247f3c1702ef1d4cb172d"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\LICENSE","hash":"ec02762d389afa4e6ca96d92cb1332e6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_list.dart","hash":"46a5ea4411d0fef172edb219362737a3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\annotated_region.dart","hash":"a05b35e402965727a6b38bfc20b6ea15"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\back_button.dart","hash":"18939fc6e74f9b391a45ae341fe30128"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\path_provider_windows.dart","hash":"38dc31b8820f5fd36eedbf7d9c1bf8d9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile_bar.dart","hash":"90f2bfd8a277caf2dfdda31d1db65bf6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scaffold.dart","hash":"e5a98bf72a471f6483b4f5a4344e7629"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\platform.dart","hash":"43003295879b7dd8a2a4c221698815e9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_row.dart","hash":"c32cecbd71acc984d84398dbcbefdc1e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\hardware_keyboard.dart","hash":"043a08c3313925fdbc30511cd08f8a38"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_panel.dart","hash":"1871abe29248ec9c2d5bd0c9ed1b4bc2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\stepper.dart","hash":"1c430e3a467ff218b2fc243981bba4ab"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\local_platform.dart","hash":"9cc2170ec43e47681be6cb2a313ba1b5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_model.dart","hash":"39d8ca399102782c09b864fa92d51f3c"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\kernel_blob.bin","hash":"a87a06a12e2e7c44beefc44ad02d9e2c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_body.dart","hash":"3596cfc55c4bf6413b1781f6d498199d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selectable_region.dart","hash":"0f76a2eba1e2cf121d211f2e6f8ed25f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.exp","hash":"4731f225ddca54409748dfc4e224dc56"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\paint_utilities.dart","hash":"9fda069b501810ac8093f3c0ad80e3f4"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_view.dart","hash":"4cb6ab1a60c1427d748c19262e38e834"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\readme","hash":"f516028b7f23d3e0f78743297f24dcfc"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\assets\\BLEServer.exe","hash":"28aa0e2566083c860f029ff4bc32c4ce"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h","hash":"45dd070af12cc7ab125d6ead5267f36c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\search_field.dart","hash":"8d08332c927a4807d1b151998f3b8243"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider.dart","hash":"27402627e8e62afac618105cd73feefc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\lookup_boundary.dart","hash":"c4b6d916f261e78cd4bf4f31b88b0485"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\core_palette.dart","hash":"d35b72b249d19f54a4cd6f22ff3299e9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layout_helper.dart","hash":"ff0c28954cbb930913ed52a41f11189a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_plugin_registrar.h","hash":"205b172dd4be89df08a835c5afcd2c1a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel_theme.dart","hash":"fa0ee94bec6f3e251ecb6155d9b574ff"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons_data.dart","hash":"8d5d3ccddf53eafd7a3094278afe8b93"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flow.dart","hash":"e92d23e94e235dd63649d0e26f8314b1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_settings.dart","hash":"ce7c719e306ad9ab02b19aafbd70178c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_device.dart","hash":"7f2618587fba3b34eda7855ef900b85e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shared_app_data.dart","hash":"beb0225376869e0c92a19831596494dd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\decorated_sliver.dart","hash":"b11666131177a6ebe97ffd60e3dac32a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_radio.dart","hash":"5165dfa79f4502deda92448d9dbf2a85"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_exception.dart","hash":"b062a8e2dade00779072d1c37846d161"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\gradient.dart","hash":"2bc5ebf858b14ecb1292e0b537905f3c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\live_text.dart","hash":"d970423c6488cba52d3585e0221e57ba"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_map.dart","hash":"9d273d5a3c1851b0313cd949e7f84355"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer_theme.dart","hash":"4b59175aa026b6fca1ec88860132b3e2"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\byte_streams.h","hash":"00010cc0042e98ea973f4037a29a3ca0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator.dart","hash":"5dbeea7cf4455d8d98d80adabcb14660"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_bar_theme.dart","hash":"5b2d84de7b9e0dfd1eef78f009f16b0a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\circle_avatar.dart","hash":"f60d1c032575a7726e7526bbd5d26e6e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_expressive.dart","hash":"be096140df774ec827218c6fe69b80e5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\method_channel_path_provider.dart","hash":"77ed8d7112753d0eeaa860ecd9fc5ba0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector2.dart","hash":"81d01d8cecc6783526e350800988db74"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider_parts.dart","hash":"9f8b92bbee47c23cb8a20cf1d989a379"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.pdb","hash":"e2fcea9bfd35a745a5fe8541b9d994d3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\checkbox.dart","hash":"0b89e2d00c84fb3e6874511d82a377ef"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material.dart","hash":"38f72dcf2dc5ddbc90bba5ed6ad4813b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration.dart","hash":"14b9c8680b6de7a995b4bfa53651eac6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip.dart","hash":"327fc74553cb0be197bb11f84f20e1c2"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_ble.dart","hash":"f34a32ff50c8392d45d4bf31778b84ea"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\engine_method_result.cc","hash":"6172a3effcf1f354d756ff757377a576"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\common.dart","hash":"8647b431edd330ccdd54d29cbf151428"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\linear_border.dart","hash":"834ed7d1da7d9cd0a0af98bb92ee6231"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\internal_style.dart","hash":"974d0c452808a1c68d61285d0bd16b28"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker_theme.dart","hash":"a7dcbd91e532e69b74043a28cc5ef5bc"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_connector.dart","hash":"2e43d2979508f95e03d618e138822c48"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\message_codec.h","hash":"b5013c9553dc459d5f91b8ec2bda3d0a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix3.dart","hash":"7711f4b6c3574cec77169f2d2c35ee3d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\stretch_effect.dart","hash":"beade411504728097291c1c56d18e454"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\consolidate_response.dart","hash":"d773ee48068ac90b654336d1ec93541e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h","hash":"302e2b130c3c67b2a24ed2497663e45a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\selection.dart","hash":"4171ccc0ef5ccf7a3355589667cc0450"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h","hash":"2b81addd18be801eda539f1de332ce4e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\services.dart","hash":"7b2a0787f26dba547607fdca4028a1cd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_macos.dart","hash":"4297b644d258ee7771676fea206a5118"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\gesture_detector.dart","hash":"b0ee5f5bf24a02a5aefac73ed8d532cb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\binding.dart","hash":"73e482e3ef72695bcdaaf4888ca76868"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tween_animation_builder.dart","hash":"31fac5b5882f19d242724b858b97d228"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selection_area.dart","hash":"fd1e888f48f9b2411ee9f3d8a5146397"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.h","hash":"68c93d1fb6ddeb8791194bed4b5b33a7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\stadium_border.dart","hash":"b2eb657328bd482e6b083d76dfbca76b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_configuration.dart","hash":"179be66a83c076f437989e25cdc30a49"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_channel.h","hash":"143cf6f0acaa229d950d084c940cc77c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_view_theme.dart","hash":"67788ce85b40005f02d41f07f8c72c1c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration_image.dart","hash":"bc264448c0fc92fbe61a1cfa17b42d0b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\lib\\xdg_directories.dart","hash":"737107f1a98a5ff745dd4e3236c5bb7b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\system_context_menu.dart","hash":"b18c704cf32d672199f18966a055574b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button_theme.dart","hash":"05f74ab5ea1d7103ef8e4f9cf05caa5a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_boundary.dart","hash":"0f8ab0bb3db6d14fd3b7b0158f4f8a42"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_channel.dart","hash":"61a21bf2f9de721b4cd09f39e86c376c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_theme.dart","hash":"ac551f648e9260bab34ef5e74bedda5c"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\cupertino_icons\\assets\\CupertinoIcons.ttf","hash":"b93248a553f9e8bc17f1065929d5934b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb3.dart","hash":"b6a30b7ed48f83f446db37577b30e62e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider_theme.dart","hash":"6929256b551547547eb9a99063ebf8c8"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\ffi.dart","hash":"ae66b0cbdfe2e2a5a99c5dfa48fd5399"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\arc.dart","hash":"cf9195435bcbd0cab5bee152d8fa95c8"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\decorated_sliver.dart","hash":"22029a1632b4f7ca4e7271bff29d89c9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\source_span-1.10.1\\LICENSE","hash":"e9f463669bd6dfea2166dcdcbf392645"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_engine.cc","hash":"4bca7c636cd1b0ea580274c113c58284"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_form_field_row.dart","hash":"911ace2939cff5d0ffa84e2a550ca832"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar_theme.dart","hash":"178e946ff9edae08342f26cfee0be6f9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_close.g.dart","hash":"9c7196e67b951143d548d72aaa0e75ec"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_ios.dart","hash":"f6879dbb0a0b22e90c61f21ebf5c440e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_controller.dart","hash":"4d7ff70b73cfe04b14f559266b5a991e"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_testing-3.0.2\\LICENSE","hash":"f721b495d225cd93026aaeb2f6e41bcc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\events.dart","hash":"7f694f69cb60ba144f59ff752805476b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\grid_paper.dart","hash":"2595ce68ee8ca06ff406ddc02a9e06f6"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\LICENSE","hash":"e9f463669bd6dfea2166dcdcbf392645"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\LICENSE","hash":"d2e1c26363672670d1aa5cc58334a83b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_cross_fade.dart","hash":"40a04e94b4e68da57cf200df6c661280"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_transitions_builder.dart","hash":"df9a870b6066752e2ed3a12090856a88"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon.dart","hash":"39ca10fd98b8f7712fc4dcb4d7506513"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\key.dart","hash":"d3c9b4f0e500f74ef525ca325c595e66"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_theme.dart","hash":"746668b90c125e955a9a447abe7df142"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\scheduler.dart","hash":"3ac176a9235973980af3b75bd0c237ff"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\keyboard_listener.dart","hash":"c87e92035314a4d3e52faf886355d0a9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider.dart","hash":"138cc5e580dfb1149ea242314d4bface"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\ticker.dart","hash":"8351b22319b7a91a7b398c3dcccbc3af"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position.dart","hash":"4f55603f78d91f6764209c758fd8cfef"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\toggleable.dart","hash":"be468e20caf9a9325b655babe97b2dc6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\editable.dart","hash":"7d9ae2251aae93be9d7b59493ee3ec0d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flex.dart","hash":"888e25fc7ef432c98810d922dcd21e48"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\score\\score.dart","hash":"58b9bc8a40fd3e2f7d9d380d0c2d420f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_box.dart","hash":"6a7c14d4a7bfe5751fb524d5c1f0813a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\strut_style.dart","hash":"83016f01370cde4ea89a7020ffe263ea"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme.dart","hash":"28f7439b1d946ef75b90f18af1a350a5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icons.dart","hash":"0fb5a81c723bbd506468f1ed5a811a48"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch.dart","hash":"7a5401ac10fd9be1f8eb524211f46ad6"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\path_provider_linux.dart","hash":"b48ba72a2d5d084d297c3d78e351036e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\observer_list.dart","hash":"5802c95af0b70a643e4566d6a4f887af"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\magnifier.dart","hash":"ba99a191d403fad33e90670186bb800b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\list_view.g.dart","hash":"63701253bb9a85c00b68c2d51358bad6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\basic_types.dart","hash":"861a19ff01e3f58d95d668b9fd4054f7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\resampler.dart","hash":"d714b72a4f8f2b38a6144a6d8bfbfd74"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\service_extensions.dart","hash":"5af5a2fb59f9c015abbda254a35ea7a6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug.dart","hash":"59015adbf9a2ec30d41ca1444784e83c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\bottom_tab_bar.dart","hash":"8e3d23ac9ae9c317901ee62445443836"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\table.dart","hash":"1f437276972808bf4cf722440da1b231"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar_button.dart","hash":"dfc6640fb99b3c0b6652442cee8834ab"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layer.dart","hash":"9481d812cf4b0207c8b7c691b2bb7616"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_cache.dart","hash":"1ea04e558aa72e88764e091ece0c08ad"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h","hash":"55b4be5728dfb16220b1bda5bdace3fe"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h","hash":"85c5071ca77f8687102dcae4f282388b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\adapter.dart","hash":"ffeb03ba26ab6fd8a8c92231f4a64bec"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_button_theme.dart","hash":"a4ab45bed53f51207a62ab91fcb3d89c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_decorator.dart","hash":"350fe569421ce6523f10b9163adbeee5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_controller.dart","hash":"90d9ef8c98ba928aace1e5b7099c0844"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_indicator.dart","hash":"8b1f55bdc7ddfffc5a4d677052b1b789"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_parts.dart","hash":"f6d5d744b0c2a3a4c8a854017007b573"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\debug.dart","hash":"624431304ab3076b73b09e0b33e35e4f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\feedback.dart","hash":"65d7d9aae72d673e52ab256ebc374bf5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\platform.dart","hash":"cbf041463d4a85115a79934eafe8e461"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\debug.dart","hash":"80245a2fe7b5913d30e374aaedf486f9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters.dart","hash":"99b4d15f76889687c07a41b43911cc39"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\debug.dart","hash":"f2138801d3af6774b0cdb3ff8f966b8c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\contrast\\contrast.dart","hash":"0c9bd1af5747fd55e7488c731ad32dee"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\constants.dart","hash":"9628979f9e240d20f992073c54489890"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection.dart","hash":"8d30a5904620c22416bd81ca2668ddfb"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set.dart","hash":"0073f703be7f7ddbd7f04d1b740f35c6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card_theme.dart","hash":"d65982353903b8d6b3d8697fa43abc7b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\browser_context_menu.dart","hash":"bfd7a00b9fef90dbf3b6d14f6a2f2901"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\image.dart","hash":"1c6f4bde2f41b6d50498e3026f24dd1a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar.dart","hash":"4bd4efc60840cea465b5afdebeb95445"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_theme.dart","hash":"b4d73a355f144c6bb16f3af2dce9076d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icon_theme_data.dart","hash":"2ed82d0ee4672e99dcdec5652737899f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification.dart","hash":"a5df6e3153b654738dfd5a67c799e6d5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_theme.dart","hash":"e657634a020bb8214e2507b5d0105d6b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration_properties.dart","hash":"5c32703ac32c4835d961b3c55f8f8498"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style_button.dart","hash":"068cff7beef42ff5ae47f6588bcdedd5"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\blend\\blend.dart","hash":"f487ad099842793e5deeebcc3a8048cb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_browser_detection_io.dart","hash":"dceb0993fc92eafad2b09cedfe9cf55c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\enums.dart","hash":"f4b67c136a2189470329fd33ebe57cb3"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_theme.dart","hash":"b149267c83ef4fca8800213bc7331992"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_view.dart","hash":"c97e54a449732d1d692934473f8beb00"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dislike\\dislike_analyzer.dart","hash":"d7eb1678ec74acd9857a4193fd62ed5b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\path_provider_foundation.dart","hash":"17f64cc5f4a6d542ec9268ea9addae7b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\transitions.dart","hash":"affff808a8e87761592b247e17f33a79"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\viewing_conditions.dart","hash":"cb0d5b80330326e301ab4d49952b2f34"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state_mixin.dart","hash":"5ec6314e10455f6b4b0809f222cb82ac"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\assertions.dart","hash":"3e6e9eb76951873ff74bd66c783664bb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button_theme.dart","hash":"f06285441f011c415850a378771be4b0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf8.dart","hash":"329d62f7bbbfaf993dea464039ae886c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar.dart","hash":"c049afdea0b4a8bbcc6287eea72e87c7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table_border.dart","hash":"30d84922aa41f3675c8bc61edfe196bf"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_messenger.h","hash":"9c15531692496dbfcb820431343d92fa"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\algorithms.dart","hash":"0976264b99a1702a5d74e9acb841b775"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\priority.dart","hash":"9051680cd2078f92c9c56831272643d5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\title.dart","hash":"ebbb5c061b2adb32764c3c2d1ec6ef3b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text.dart","hash":"d45e9b277049bbe272ddb44fffa5a4bb"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_state.dart","hash":"4f93620628975a8f1d99ff0d7ca50142"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_channel.h","hash":"143cf6f0acaa229d950d084c940cc77c"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h","hash":"62be5ae665a6b931d6dc9ac4b27d6c93"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge_theme.dart","hash":"da1802b773732f65c4e80bbdb5ff020c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\nested-1.0.0\\LICENSE","hash":"753206f0b81e6116b384683823069537"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\curves.dart","hash":"f18dc9a4ce1d1f9c435166c478ba1046"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\tolerance.dart","hash":"a481b9285f5d63f04e3b3e3fc2a6b44c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\binding.dart","hash":"6e5c3bb1212b793f86981fd9587a5639"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\LICENSE","hash":"a60894397335535eb10b54e2fff9f265"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner.dart","hash":"015b2af25117158c596a79d2abeaecac"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_fit.dart","hash":"42b701fea2336aa3a74e390579863153"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\lib\\main.dart","hash":"55f16c07914dd4be652d4f90e707aa67"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h","hash":"09399c3c509a601a970f6efd340a2529"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar_theme.dart","hash":"a523a2a2050db4ee86697d36da23e326"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h","hash":"6bfbb61c519f63386a0fb55608dbea90"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\breaks.dart","hash":"73189b511058625710f6e09c425c4278"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\modal_barrier.dart","hash":"456d8ae62e2b96a95d26b54f0a10d2de"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\close_menu.g.dart","hash":"97f8d480ec6ac1778506d29f498a1e6c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\force_press.dart","hash":"b37ded4b59c2d4efd0802499d6944937"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_metrics.dart","hash":"e11d89b7d2933ba28814915b300af866"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\FontManifest.json","hash":"dc3d03800ccca4601324923c0b1d6d57"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\star_border.dart","hash":"ed437fef28462d73a74c339fc59a6cda"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\foundation.dart","hash":"3ea9e90b1b7ea7dc0acdb26f45a3d632"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expand_icon.dart","hash":"064b2b355879e55d83ea0844d55cb10d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view.h","hash":"33a6baf4984ec4c299c0b05cef6968ed"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_export.h","hash":"51d6ddd086e800d34c1d143004c474fd"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\utils.dart","hash":"8a7e3b181572ed50e923e5dc05a7533d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\constants.dart","hash":"38a87ff489a47bc024400dc863be326d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_button_item.dart","hash":"15308b82e6b7d5df3058f8e769084a67"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\byte_streams.h","hash":"00010cc0042e98ea973f4037a29a3ca0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h","hash":"85c5071ca77f8687102dcae4f282388b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\isolates.dart","hash":"36a99fab55346241cec61df175183d69"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip_theme.dart","hash":"e2ac78c5563a257cfeb101330947a117"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\unmodifiable_wrappers.dart","hash":"ea7c9cbd710872ba6d1b93050936bea7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page.dart","hash":"c9aacafab7d9435e52caca900d06fb30"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_navigator.dart","hash":"6a7f49ff645804c67a62656a0046ca5d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sliding_segmented_control.dart","hash":"3aeb9cfbe05eb383396369ed42c5ddf8"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_splash.dart","hash":"70e74b0c6f6f90fd22aab34066494a69"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\byte_buffer_streams.h","hash":"0a33501e8af56a1390ab6f75e0f568d9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style.dart","hash":"bfb39b98783e4013d9fe5006de40874d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio.dart","hash":"61982a79c8af86349f670f4883841e4f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\button.dart","hash":"f28a9a9aa27c019a805dfd79beb3c804"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_fuchsia.dart","hash":"fb5f7eb90b6c4b891e8a1cda244c0a30"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\debug.dart","hash":"0afbdd6f1125195ec28ff55922e51d50"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_codec.h","hash":"1d712b93e2dd2e28cb67a55a8d484694"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id_real.dart","hash":"0e5b422d23b62b43ea48da9f0ad7fd47"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\memory_allocations.dart","hash":"63b8ba66ff849df5c205a7416be7648f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_call.h","hash":"fbad5bf3bd488842a461addc9ab88fb0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_span.dart","hash":"796231a07491c4e4067fc9e671201996"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\flutter_logo.dart","hash":"9c0042800e1cfc787917e6cd861e75fb"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\material_dynamic_colors.dart","hash":"81bf43e01741bf8b9df15ec37ffbc9ea"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\timeline.dart","hash":"ff300e7139d4b384c9ba4c12a100f68b"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme.dart","hash":"a6adbe3868e017441360895c35fd6aa2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window.dart","hash":"570cfa95e3d0a1979fc3007133dd31a9"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_android-12.1.0\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fruit_salad.dart","hash":"3c8d2d2b73f69d670141d376642e5252"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer.dart","hash":"d1c200290090571d77ee058a02318c72"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_scroll_view.dart","hash":"f632e5c914890c4fb2e5d4a3848d02af"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\path.dart","hash":"157d1983388ff7abc75e862b5231aa28"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\utils.dart","hash":"670717573525d5e0518a4063c6fd9231"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result.h","hash":"e48c7b84b470630e810b6a0bc2d8e542"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection.dart","hash":"f77a47b0afc17299625ca3a736a5245b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\rounded_rectangle_border.dart","hash":"007667490ebeea6edafe9ce67e6c9b54"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner_theme.dart","hash":"d0b6b68aeba6ea0b5b3d483ee7f4cb6b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\routes.dart","hash":"121b57de6da6133ad77c90815404bb8f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\matrix_utils.dart","hash":"fec42a1fa15bf5b18b7d61c4fb534c4b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\binding.dart","hash":"e0fceafe591ad5fd70a41190dd121f08"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\color_utils.dart","hash":"0938e0447f447ceb7d16477a0213ce2c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\lints-4.0.0\\LICENSE","hash":"4cb782b79f6fc5792728e331e81a3558"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_isolates_io.dart","hash":"825b4e65b06dcc1b8822108f596b56b0"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result.h","hash":"e48c7b84b470630e810b6a0bc2d8e542"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag.dart","hash":"c6f3d5ab867a5b665a50e0af11d048d7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\activity_indicator.dart","hash":"4a81406b7afae9ed9c35164eaf37f7da"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterable.dart","hash":"67d16e841606c4e5355211fe15a2dbfd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\autofill.dart","hash":"2101e9cc9f31d7c6b807c5b1a1ace4dc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style.dart","hash":"d9681c9310d700a668680311eda16379"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\mouse_tracker.dart","hash":"2c4193ab3485cfacc520fadd92252eeb"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_windows.dart","hash":"f36086fa85e4e44adb302e73a632289d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\stack_frame.dart","hash":"2f06c141dd015e94c94d21e5a407f0ef"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_linux.dart","hash":"2ced57b0fa711aca80714d917cb75cb7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar.dart","hash":"2e33579e5b09e4e1768dd5d41d816a4c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag_details.dart","hash":"09325621b84b25497a2d19b7f3636884"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\win_ble.dart","hash":"f78d5e624e38ec9884fc4203c7476000"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport.dart","hash":"3016d6c74fa2e2b02098a4ebafbaf052"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\testing\\fake_platform.dart","hash":"f1a57183b9d9b863c00fcad39308d4c1"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\functions.dart","hash":"41f7bdb7d1eb3c86c21489902221b859"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_apple-9.4.7\\LICENSE","hash":"a086f9770acbfc6a5e421b49411d9415"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selectable_text.dart","hash":"a25be9534683056e76a7ff2a00de199c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multitap.dart","hash":"b0cd46009f7fed9876eb540db5ec80de"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button.dart","hash":"330b95708a5bdbcb77507bb825dbefbc"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\magnifier.dart","hash":"718967876faf228e84cd588af6142249"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker.dart","hash":"483ba04e1f42eee7ef3c0ba3ed43a23d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_size.dart","hash":"d8b218966d397dae64303cdd7d11b33b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar.dart","hash":"dfdfe4f6a24af9fc578d620807450876"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_vibrant.dart","hash":"5b04f80518a8417cb87a0aec07dacf4f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\interactive_viewer.dart","hash":"0e57433d2e37deda7b9e7e628a9f0528"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\texture_registrar_impl.h","hash":"7ec35caedbfe35b37bd7aa66dab7219b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\sensitive_content.dart","hash":"dbf30b29dd78b529a26b350b5866a849"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_target.dart","hash":"d932135a74692037b9bbbbb8fffffd5d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button.dart","hash":"a3e9ac85a8643e6bed4ec25db238b71d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shadows.dart","hash":"dafc76ada4dc3b9bc9a365a7da786797"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_sparkle.dart","hash":"ffd5fbadea48a2028f714bb6a918cb45"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_traversal.dart","hash":"b4bce6451a7fa34f8275a01bcc020b2a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\motion.dart","hash":"c2593e65f1a2367d83f0668470ab5f61"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\ray.dart","hash":"d69cd05d9de1731242d357de56893a6f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\unicode.dart","hash":"c692323b8d9e3ed3c4c134ba07ab94e6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar_button.dart","hash":"28eabbe1a08475df35ee00124b823e50"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\_background_isolate_binary_messenger_io.dart","hash":"7a8436b3682b625fdf4b1dbccda9e895"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_sink.h","hash":"b1b98c1cf40abd6a3c308182c4822476"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics.dart","hash":"41ccfdd3552db4ca02b80564a167692a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\no_splash.dart","hash":"363dc40bd108240cb513878e107a260d"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\simulation.dart","hash":"0b594cddd30fe9d0d34a42f5328a2b38"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\eager.dart","hash":"2a5ea48301e3de49528660d81bbad42c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\LICENSE","hash":"7b710a7321d046e0da399b64da662c0b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\fade_in_image.dart","hash":"ee635fd679923a1967d7f97840c03f25"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\change_notifier.dart","hash":"b9404c61ed5c93d87873dac65566b155"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\LICENSE","hash":"2d0c70561d7f1d35b4ccc7df9158beed"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\constants.dart","hash":"df0a9878a16d3cd73cff00f496307544"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pinned_header_sliver.dart","hash":"eba989b17aa7902153acc7df1658ba49"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_tracking.dart","hash":"ecb57271d69343712d88a50442f2e8ed"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\parsed_path.dart","hash":"cb454929d7810d3ee5aa5fc28283d3fd"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme_data.dart","hash":"f8ded7a3f53ded600055288202a36535"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigation_toolbar.dart","hash":"6e144abc5846b7e5eda10cec79c9051a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\semantics_debugger.dart","hash":"7278be8e3e52d9f7d521cdc0daabbafa"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\characters.dart","hash":"43268fa3ac45f3c527c72fc3822b9cb2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_view.dart","hash":"24f3527fba7d471fe0af6e9bd6ab0092"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\tone_delta_pair.dart","hash":"f5b38c21bf580c89610a8b58c65aae00"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_scope.dart","hash":"28bfa6a255f9e9d16e0ae25511179fd2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar_text_button.dart","hash":"559ecbc92097e4c9b9142335dec3f3ee"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\radio.dart","hash":"dc988c2ea03ffad0bf8f1e8e8d59332b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\dart_project.h","hash":"21a40fe4d1f98493dd01865fc200d152"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_maps.g.dart","hash":"feaa27101434fc1590c19d42ec8b407f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\spell_check.dart","hash":"16b7d416940fc53eca969b344627767f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\will_pop_scope.dart","hash":"4cf81f473e6af6b63729d72f41fe712e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\expansible.dart","hash":"ca76178f2e77b585aff0c9f3943ecc10"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\process_text.dart","hash":"53c1ff11b2873a67a9e4c0277a31a856"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\texture.dart","hash":"238464b246c0e0f60bc0fa9240909833"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\constants.dart","hash":"aa079ee3baec3d56778ddae02b3d5150"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shortcuts.dart","hash":"1ce26e8c7f75d14be78f77555e3ec98a"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\src\\hct_solver.dart","hash":"b972c32590c642256132827def0b9923"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar_theme.dart","hash":"eeda981e4df3f90c0c0dbc696a3ca59f"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\constants.dart","hash":"4a4b67b573e2338cf03cb704b2c18f04"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_layout.dart","hash":"c1370589e36ce454d88b67feeff59ac6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip.dart","hash":"1413b2732b44ab84f6bd3889e9772837"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll","hash":"9dd9bc1c173a119dfb1d48eec6f3e96c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\clamped_simulation.dart","hash":"d99d22e8a62a3ce1fa8b04b21702e1f6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu.dart","hash":"2a5c6f923280ddc71460d404d26db6d7"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sheet.dart","hash":"8f5bff6473725b31a6ab0d89c019120e"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h","hash":"45dd070af12cc7ab125d6ead5267f36c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile.dart","hash":"c79e8b66f82ea7ecb9e276089fc3a771"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator.dart","hash":"52bb2fb50c3e40774bd6eaca84c67b32"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h","hash":"2b81addd18be801eda539f1de332ce4e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\debug.dart","hash":"da2fb5c7eaae1fd58b34e80c4dad2cca"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector4.dart","hash":"77900a31d721da1722fe34c455a00d3f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_style.dart","hash":"ff48baf4d965c1a810e73d9c303397b1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h","hash":"2b2405abfa2cc54351b6ee6ad02585c0"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_view_controller.cc","hash":"f3e8e48b8e3ae1ebcedbe20033c58184"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image.dart","hash":"3089b1e0f13ef6a660beec18dbce3ce6"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\binary_messenger_impl.h","hash":"286e55d651260380486c1ca7a2c44578"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_map.dart","hash":"b6bcae6974bafba60ad95f20c12c72b9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_filter.dart","hash":"61d6754850dbffcf4687388b630652ad"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\calendar_date_picker.dart","hash":"8fc2c3378e1fd1b3fda08bea57dc6f8b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_shadow.dart","hash":"ee087f51a6581356097d7820f3f13d4e"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NativeAssetsManifest.json","hash":"f3a664e105b4f792c6c7fe4e4d22c398"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver.dart","hash":"82b33d360780440c8fab1036a79cef3a"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\AssetManifest.bin","hash":"918444562a8f781f679bf871d85decec"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons_theme.dart","hash":"4f0adcd531d7d7e81a0e94e0664b032c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_signal_resolver.dart","hash":"a0debba3c78c5b30d8645d377dc80bf2"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\path_provider_linux.dart","hash":"8ac537f4af05ad812e8cd29f077aee24"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\framework.dart","hash":"88026224776e483139ac3b7f375ebf23"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\font_loader.dart","hash":"33bc9ed6bd7be95c8dcba0df4493890c"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_boundary.dart","hash":"4af5a846cd70e939e428c36fdaa3a4ac"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\windows.dart","hash":"436772ca7f74eedd479a88b82cfdc093"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\fake_async-1.3.3\\LICENSE","hash":"175792518e4ac015ab6696d16c4f607e"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_header.dart","hash":"a4ee14a7e782832dcfbc9c8b1bba6f58"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\hit_test.dart","hash":"2dae58fc51edceace7fc123c2ee65f10"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap_and_drag.dart","hash":"baf884996f27da1f66c750dd9b088db2"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_router.dart","hash":"4d0882d96d41d4abeb3ed55e2959f614"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\messages.g.dart","hash":"1fb5a92f7fc3ff3ea9a3a22ad94303f1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\banner.dart","hash":"d82db0f248ca051490d30d8b76686730"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\texture.dart","hash":"e924e0f63c6bf206211fb6a6f319af53"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar.dart","hash":"35d5b2c786045d1aa7428d0b48b2b3b8"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_map.dart","hash":"700328ab0177ddfd9a003a8c15619c1a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\gestures.dart","hash":"d94743ec9e31da98eb079db06f418126"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\ticker_provider.dart","hash":"29aed909fe4f6925b431ce6ce17291b1"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_state.dart","hash":"7096c633996c3159ae7340dff9df5869"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_neutral.dart","hash":"3ee18da390e16ca65f2ef168adb8a1ef"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_theme.dart","hash":"374520f3f5f3c885f389a51783a6f0db"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters_impl.dart","hash":"6297da5be01fb7c0d5c4aaffe7a27a50"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_form_field.dart","hash":"5fe18155a1d652bbd44801efb3b9b647"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\engine_method_result.cc","hash":"6172a3effcf1f354d756ff757377a576"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\monodrag.dart","hash":"6b65b8fcba54fa1819a2f56643e8077f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration.dart","hash":"6da099b31166c133a52bfa3ab7a1b826"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button.dart","hash":"44aa24c0446808ae49560201323ea2ab"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\router.dart","hash":"80b8055da4eef4a2aa4d9b5567e647b9"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\dart_plugin_registrant.dart","hash":"4360ed213b36c09bfe8c924632e48ab0"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\path_provider_android.dart","hash":"026f31addc8eb130816b616fd3a7e232"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_texture_registrar.h","hash":"4ffbfcf8b88a9690e82543b1761e81d5"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\synchronous_future.dart","hash":"fb5592ffbdb3669d56c8d1cb23ed3033"},{"path":"D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\byte_buffer_streams.h","hash":"0a33501e8af56a1390ab6f75e0f568d9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_formatter.dart","hash":"a93e20e69ce4387d158c2ed45f80d4f9"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\date.dart","hash":"7c1d0d22ae0d74958aaa5c099fadc33b"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\converter.dart","hash":"24dd1f01d0ce298347e47fd60702007c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stream_channel-2.1.4\\LICENSE","hash":"39062f759b587cf2d49199959513204a"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\binding.dart","hash":"cc74d4f0413163e859b5e8834226817f"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_capabilities_io.dart","hash":"0b279dcbda1933bafe0bd7d322e2000f"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_characteristic.dart","hash":"822a08efcbf99fd76ab6d0d523ec1912"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_multi_box_adaptor.dart","hash":"061af8de81841ae73854bdc4cad4139c"},{"path":"C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\utils.dart","hash":"fe2489ea57393e2508d17e99b05f9c99"},{"path":"D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_list_tile.dart","hash":"d449bb5ef346dec5df26583bcf31520d"}]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\dart_build.d
```d
 D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\dart_build_result.json: 
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\dart_build.stamp
```stamp
{"inputs":["D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\native_assets.dart","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\dart_build_result.json","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\dart_build_result.json"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\dart_build_result.json
```json
{"build_start":"2026-01-03T19:30:29.310843","build_end":"2026-01-03T19:30:29.310843","dependencies":[],"code_assets":[],"data_assets":[]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\debug_bundle_windows-x64_assets.stamp
```stamp
{"inputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\app.dill","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\pubspec.yaml","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\assets\\BLEServer.exe","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\assets\\CupertinoIcons.ttf","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\material_fonts\\MaterialIcons-Regular.otf","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\ink_sparkle.frag","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\stretch_effect.frag","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\async-2.13.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\boolean_selector-2.1.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\clock-1.1.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\fake_async-1.3.3\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_blue_plus-1.34.5\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_lints-4.0.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker-11.0.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_flutter_testing-3.0.10\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_testing-3.0.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\lints-4.0.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\matcher-0.12.17\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\nested-1.0.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler-11.4.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_android-12.1.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_apple-9.4.7\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_html-0.1.3+5\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_platform_interface-4.3.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_windows-0.2.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\provider-6.1.5+1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\source_span-1.10.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stack_trace-1.12.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stream_channel-2.1.4\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\string_scanner-1.4.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\term_glyph-1.2.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\test_api-0.7.7\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vm_service-15.0.2\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\web-1.1.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\LICENSE","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\LICENSE","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\pkg\\sky_engine\\LICENSE","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\LICENSE"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\kernel_blob.bin","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\win_ble\\assets\\BLEServer.exe","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\cupertino_icons\\assets\\CupertinoIcons.ttf","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\fonts\\MaterialIcons-Regular.otf","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\ink_sparkle.frag","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\stretch_effect.frag","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\AssetManifest.bin","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\FontManifest.json","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NOTICES.Z","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NativeAssetsManifest.json"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\flutter_assets.d
```d
 D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\win_ble\\assets\\BLEServer.exe D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\cupertino_icons\\assets\\CupertinoIcons.ttf D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\fonts\\MaterialIcons-Regular.otf D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\ink_sparkle.frag D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\stretch_effect.frag D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\AssetManifest.bin D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\FontManifest.json D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NOTICES.Z D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NativeAssetsManifest.json:  D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\pubspec.yaml C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\assets\\BLEServer.exe C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\assets\\CupertinoIcons.ttf D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\material_fonts\\MaterialIcons-Regular.otf D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\ink_sparkle.frag D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shaders\\stretch_effect.frag D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\async-2.13.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\boolean_selector-2.1.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\clock-1.1.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\cupertino_icons-1.0.8\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\fake_async-1.3.3\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_blue_plus-1.34.5\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\flutter_lints-4.0.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker-11.0.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_flutter_testing-3.0.10\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\leak_tracker_testing-3.0.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\lints-4.0.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\matcher-0.12.17\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\nested-1.0.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler-11.4.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_android-12.1.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_apple-9.4.7\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_html-0.1.3+5\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_platform_interface-4.3.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\permission_handler_windows-0.2.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\provider-6.1.5+1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\source_span-1.10.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stack_trace-1.12.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\stream_channel-2.1.4\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\string_scanner-1.4.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\term_glyph-1.2.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\test_api-0.7.7\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vm_service-15.0.2\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\web-1.1.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\LICENSE C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\LICENSE D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\pkg\\sky_engine\\LICENSE D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\LICENSE
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\gen_dart_plugin_registrant.stamp
```stamp
{"inputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\dart_plugin_registrant.dart"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\gen_localizations.stamp
```stamp
{"inputs":[],"outputs":[]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\install_code_assets.d
```d
 D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json: 
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\install_code_assets.stamp
```stamp
{"inputs":["D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\native_assets.dart","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\native_assets.json"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\kernel_snapshot_program.d
```d
D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\app.dill: C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\characters.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters_impl.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\extensions.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\breaks.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\constants.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\table.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\collection.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\algorithms.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\boollist.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\unmodifiable_wrappers.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\canonicalized_map.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterable.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterator.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_list.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_map.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\comparators.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\empty_unmodifiable_set.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_map.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_set.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\functions.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_extensions.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_zip.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\list_extensions.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\priority_queue.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\queue_list.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set_controller.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\utils.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\wrappers.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\ffi.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\allocation.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\arena.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf16.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf8.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\animation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\cupertino.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\foundation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\gestures.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\material.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\painting.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\physics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\rendering.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\scheduler.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\semantics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\services.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_controller.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\listener_helpers.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\diagnostics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\curves.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween_sequence.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\activity_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\ticker_provider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\adaptive_text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\app.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\bottom_tab_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\checkbox.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\toggleable.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\colors.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\constants.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu_action.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\date_picker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\dialog.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\expansion_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_row.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_section.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icon_theme_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\interface_level.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_section.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\localizations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\magnifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\nav_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\page_scaffold.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\picker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\radio.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\refresh.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\object.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\route.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\scrollbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\search_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\segmented_control.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\box.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sheet.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\slider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sliding_segmented_control.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\spell_check_suggestions_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\switch.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_scaffold.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\automatic_keep_alive.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\slotted_render_object_widget.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_form_field_row.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\thumb_painter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\dart_plugin_registrant.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_bitfield_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_capabilities_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_features.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_isolates_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_platform_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_timeline_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\annotations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\assertions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\basic_types.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\bitfield.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\capabilities.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\change_notifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\collections.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\consolidate_response.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\constants.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\isolates.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\key.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\licenses.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\memory_allocations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\node.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\object.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\observer_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\persistent_hash_map.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\platform.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\print.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\serialization.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\service_extensions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\stack_frame.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\synchronous_future.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\timeline.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\unicode.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\arena.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\constants.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\converter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag_details.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\eager.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\events.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\force_press.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_details.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_settings.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\hit_test.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\long_press.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\lsq_solver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\monodrag.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multidrag.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multitap.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_router.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_signal_resolver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\recognizer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\resampler.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\scale.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap_and_drag.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\team.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\velocity_tracker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\about.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_buttons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_chip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_icons_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\adaptive_text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\add_event.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\arrow_menu.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\close_menu.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\ellipsis_search.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\event_add.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\home_menu.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\list_view.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_arrow.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_close.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_home.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\pause_play.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\play_pause.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\search_ellipsis.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\view_list.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\arc.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\autocomplete.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\back_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state_mixin.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\calendar_date_picker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_list_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\choice_chip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\circle_avatar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\color_scheme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\colors.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\constants.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\curves.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_source.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_form_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevation_overlay.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expand_icon.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_panel.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filter_chip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\flexible_space_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_location.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_decoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_highlight.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_ripple.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_sparkle.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_splash.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_well.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_chip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_date_picker_form_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_decorator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\magnifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_localizations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_anchor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\mergeable_material.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\motion.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\no_splash.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page_transitions_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\paginated_data_table.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\predictive_back_page_transitions_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_list_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\radio_group.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider_parts.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\refresh_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\reorderable_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scaffold.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_anchor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_view_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selectable_text.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selection_area.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shadows.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_parts.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_value_indicator_shape.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar_layout_delegate.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\stepper.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_list_tile.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_bar_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_controller.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tabs.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_form_field.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar_text_button.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_visibility.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\typography.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\user_accounts_drawer_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_network_image_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_web_image_info_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\alignment.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\basic_types.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\beveled_rectangle_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\border_radius.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\borders.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_decoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_fit.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_shadow.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\circle_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\clip.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\colors.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\continuous_rectangle_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration_image.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\edge_insets.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\flutter_logo.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\fractional_offset.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\geometry.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\gradient.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_cache.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_decoder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_provider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_resolution.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_stream.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\inline_span.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\linear_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\matrix_utils.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\notched_shapes.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\oval_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\paint_utilities.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\placeholder_span.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\rounded_rectangle_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shader_warm_up.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shape_decoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\stadium_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\star_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\strut_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_painter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_scaler.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_span.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\clamped_simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\friction_simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\gravity_simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\spring_simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\tolerance.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\utils.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\animated_size.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\binding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_layout.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_paint.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug_overflow_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\decorated_sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\editable.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\paragraph.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\error.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flex.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flow.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\image.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layout_helper.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_body.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_wheel_viewport.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\mouse_tracker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\selection.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\performance_overlay.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\platform_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_box.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\rotated_box.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\service_extensions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\shifted_box.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fill.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fixed_extent_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_grid.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_group.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_multi_box_adaptor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_padding.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_persistent_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_tree.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\stack.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table_border.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\texture.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\tweens.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport_offset.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\wrap.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\priority.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\service_extensions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\ticker.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_event.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_service.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\_background_isolate_binary_messenger_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_bundle.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_manifest.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\autofill.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binary_messenger.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\browser_context_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\clipboard.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\deferred_component.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flavor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flutter_version.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\font_loader.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\haptic_feedback.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\hardware_keyboard.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_inserted_content.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_key.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_maps.g.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\live_text.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codec.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codecs.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_cursor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_tracking.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_channel.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_views.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\predictive_back_event.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\process_text.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_android.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_fuchsia.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_ios.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_linux.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_macos.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_web.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_windows.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\restoration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\scribe.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\sensitive_content.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\service_extensions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\spell_check.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_channels.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_chrome.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_navigator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_sound.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_boundary.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing_delta.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_formatter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_input.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_layout_metrics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\undo_manager.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_html_element_view_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_platform_selectable_region_context_menu_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_browser_detection_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_image_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_io.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_win32.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\actions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\adapter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\framework.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_cross_fade.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_size.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_switcher.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\annotated_region.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app_lifecycle_listener.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\async.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autocomplete.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autofill.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\banner.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\basic.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\bottom_navigation_bar_item.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\color_filter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\constants.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\container.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_button_item.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_controller.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\date.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\debug.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\decorated_sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_selection_style.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_text_editing_shortcuts.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\desktop_text_selection_toolbar_layout_delegate.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dismissible.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\display_feature_sub_screen.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\disposable_build_context.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_boundary.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_target.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\draggable_scrollable_sheet.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dual_transition_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\editable_text.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\expansible.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\fade_in_image.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\feedback.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\flutter_logo.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_manager.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_scope.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_traversal.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\form.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\gesture_detector.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\grid_paper.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\heroes.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_filter.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_icon.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\implicit_animations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_model.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_notifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_theme.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\interactive_viewer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\keyboard_listener.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\layout_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\list_wheel_scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\localizations.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\lookup_boundary.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\magnifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\media_query.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\modal_barrier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigation_toolbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator_pop_handler.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\nested_scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\notification_listener.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\orientation_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overflow_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overlay.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overscroll_indicator.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_storage.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_transitions_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pages.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\performance_overlay.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pinned_header_sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\placeholder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_menu_bar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_selectable_region_context_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pop_scope.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\preferred_size.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\primary_scroll_controller.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_keyboard_listener.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_menu_anchor.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_radio.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\reorderable_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration_properties.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\router.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\routes.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\safe_area.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_activity.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_aware_image_provider.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_configuration.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_context.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_controller.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_delegate.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_metrics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification_observer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_physics.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position_with_single_context.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_simulation.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable_helpers.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollbar.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selectable_region.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selection_container.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\semantics_debugger.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sensitive_content.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\service_extensions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shared_app_data.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shortcuts.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\single_child_scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\size_changed_layout_notifier.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_fill.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_floating_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_layout_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_persistent_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_prototype_extent_list.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_resizing_header.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_tree.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\snapshot_widget.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spacer.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spell_check.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\standard_component_type.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\status_transitions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\stretch_effect.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\system_context_menu.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\table.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tap_region.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_editing_intents.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_anchors.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_layout_delegate.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\texture.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\title.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\transitions.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tween_animation_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_scroll_view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_viewport.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\undo_history.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\unique_widget.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\value_listenable_builder.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\view.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\viewport.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\visibility.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_inspector.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_span.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_state.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\will_pop_scope.dart D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\widgets.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\blend\\blend.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\contrast\\contrast.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dislike\\dislike_analyzer.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_color.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_scheme.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\material_dynamic_colors.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\contrast_curve.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\tone_delta_pair.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\variant.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\cam16.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\hct.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\src\\hct_solver.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\viewing_conditions.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\material_color_utilities.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\core_palette.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\tonal_palette.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_celebi.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_map.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wsmeans.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wu.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider_lab.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_content.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_expressive.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fidelity.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fruit_salad.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_monochrome.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_neutral.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_rainbow.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_tonal_spot.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_vibrant.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\score\\score.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\temperature\\temperature_cache.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\color_utils.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\math_utils.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\string_utils.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta_meta.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\path.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\characters.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\context.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\internal_style.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\parsed_path.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_exception.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_map.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_set.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\posix.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\url.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\windows.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\utils.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\lib\\path_provider.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\messages.g.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\path_provider_android.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\messages.g.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\path_provider_foundation.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\path_provider_linux.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id_real.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\path_provider_linux.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\path_provider_platform_interface.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\enums.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\method_channel_path_provider.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\path_provider_windows.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\folders.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\guid.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\path_provider_windows_real.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\win32_wrappers.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\platform.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\local_platform.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\platform.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\testing\\fake_platform.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\lib\\plugin_platform_interface.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\vector_math_64.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb2.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb3.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\colors.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\frustum.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\intersection_result.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix2.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix3.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix4.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\noise.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\obb3.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\plane.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quad.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quaternion.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\ray.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\sphere.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\triangle.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector2.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector3.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector4.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\constants.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\error_helpers.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\opengl.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\utilities.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_characteristic.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_device.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_state.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_connector.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_helper.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\win_ble.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_ble.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_file.dart C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\lib\\xdg_directories.dart D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\dart_plugin_registrant.dart D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\lib\\main.dart

```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\kernel_snapshot_program.stamp
```stamp
{"inputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\common.dart","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\engine.stamp","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\engine.stamp","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\engine.stamp","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\engine.stamp","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\characters.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\characters_impl.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\extensions.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\breaks.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\constants.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\characters-1.4.0\\lib\\src\\grapheme_clusters\\table.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\collection.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\algorithms.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\boollist.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\unmodifiable_wrappers.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\canonicalized_map.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterable.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_iterator.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_list.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\combined_wrappers\\combined_map.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\comparators.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\empty_unmodifiable_set.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_map.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\equality_set.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\functions.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_extensions.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\iterable_zip.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\list_extensions.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\priority_queue.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\queue_list.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\union_set_controller.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\utils.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\collection-1.19.1\\lib\\src\\wrappers.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\ffi.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\allocation.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\arena.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf16.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\ffi-2.1.4\\lib\\src\\utf8.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\animation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\cupertino.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\foundation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\gestures.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\material.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\painting.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\physics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\rendering.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\scheduler.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\semantics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\services.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_controller.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\listener_helpers.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animation_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\diagnostics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\animations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\curves.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\animation\\tween_sequence.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\activity_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\ticker_provider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\adaptive_text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\app.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\bottom_tab_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\checkbox.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\toggleable.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\colors.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\constants.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\context_menu_action.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\date_picker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\desktop_text_selection_toolbar_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\dialog.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\expansion_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_row.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\form_section.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icon_theme_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\icons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\interface_level.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_section.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\list_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\localizations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\magnifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\nav_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\page_scaffold.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\picker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\radio.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\refresh.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\object.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\route.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\scrollbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\search_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\segmented_control.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\box.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sheet.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\slider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\sliding_segmented_control.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\spell_check_suggestions_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\switch.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_scaffold.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\tab_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\automatic_keep_alive.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\slotted_render_object_widget.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_form_field_row.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_selection_toolbar_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\text_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\cupertino\\thumb_painter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\dart_plugin_registrant.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_bitfield_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_capabilities_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_features.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_isolates_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_platform_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\_timeline_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\annotations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\assertions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\basic_types.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\bitfield.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\capabilities.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\change_notifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\collections.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\consolidate_response.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\constants.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\isolates.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\key.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\licenses.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\memory_allocations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\node.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\object.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\observer_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\persistent_hash_map.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\platform.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\print.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\serialization.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\service_extensions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\stack_frame.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\synchronous_future.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\timeline.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\foundation\\unicode.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\arena.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\constants.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\converter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\drag_details.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\eager.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\events.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\force_press.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_details.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\gesture_settings.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\hit_test.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\long_press.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\lsq_solver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\monodrag.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multidrag.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\multitap.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_router.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\pointer_signal_resolver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\recognizer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\resampler.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\scale.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\tap_and_drag.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\team.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\gestures\\velocity_tracker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\about.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_buttons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_chip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\action_icons_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\adaptive_text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\animated_icons_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\add_event.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\arrow_menu.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\close_menu.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\ellipsis_search.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\event_add.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\home_menu.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\list_view.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_arrow.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_close.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\menu_home.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\pause_play.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\play_pause.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\search_ellipsis.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\animated_icons\\data\\view_list.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\app_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\arc.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\autocomplete.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\back_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\badge_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\banner_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_app_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_navigation_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\bottom_sheet_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state_mixin.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_style_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\calendar_date_picker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\card_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\carousel_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_list_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\checkbox_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\chip_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\choice_chip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\circle_avatar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\color_scheme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\colors.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\constants.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\curves.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_source.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\data_table_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\date_picker_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\desktop_text_selection_toolbar_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dialog_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\divider_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\drawer_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_form_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\dropdown_menu_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevated_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\elevation_overlay.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expand_icon.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_panel.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\expansion_tile_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filled_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\filter_chip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\flexible_space_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_location.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\floating_action_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\grid_tile_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icon_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\icons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_decoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_highlight.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_ripple.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_sparkle.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_splash.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\ink_well.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_chip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_date_picker_form_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\input_decorator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\list_tile_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\magnifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_localizations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\material_state.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_anchor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\menu_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\mergeable_material.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\motion.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_drawer_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\navigation_rail_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\no_splash.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\outlined_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\page_transitions_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\paginated_data_table.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\popup_menu_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\predictive_back_page_transitions_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\progress_indicator_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_list_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\radio_group.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\radio_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\range_slider_parts.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\refresh_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\reorderable_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scaffold.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\scrollbar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_anchor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\search_view_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\segmented_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selectable_text.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\selection_area.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\shadows.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_parts.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\slider_value_indicator_shape.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\snack_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\spell_check_suggestions_toolbar_layout_delegate.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\stepper.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_list_tile.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\switch_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_bar_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_controller.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tab_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tabs.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_button_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_form_field.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_selection_toolbar_text_button.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\text_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\theme_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\time_picker_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\toggle_buttons_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\tooltip_visibility.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\typography.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\material\\user_accounts_drawer_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_network_image_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\_web_image_info_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\alignment.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\basic_types.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\beveled_rectangle_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\border_radius.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\borders.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_decoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_fit.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\box_shadow.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\circle_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\clip.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\colors.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\continuous_rectangle_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\decoration_image.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\edge_insets.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\flutter_logo.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\fractional_offset.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\geometry.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\gradient.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_cache.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_decoder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_provider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_resolution.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\image_stream.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\inline_span.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\linear_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\matrix_utils.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\notched_shapes.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\oval_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\paint_utilities.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\placeholder_span.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\rounded_rectangle_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shader_warm_up.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\shape_decoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\stadium_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\star_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\strut_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_painter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_scaler.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_span.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\painting\\text_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\clamped_simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\friction_simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\gravity_simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\spring_simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\tolerance.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\physics\\utils.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\animated_size.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\binding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_layout.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\custom_paint.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\debug_overflow_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\decorated_sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\editable.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\paragraph.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\error.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flex.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\flow.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\image.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\layout_helper.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_body.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\list_wheel_viewport.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\mouse_tracker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\selection.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\performance_overlay.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\platform_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_box.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\proxy_sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\rotated_box.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\service_extensions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\shifted_box.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fill.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_fixed_extent_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_grid.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_group.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_multi_box_adaptor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_padding.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_persistent_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\sliver_tree.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\stack.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\table_border.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\texture.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\tweens.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\viewport_offset.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\rendering\\wrap.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\priority.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\service_extensions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\scheduler\\ticker.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_event.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\semantics\\semantics_service.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\_background_isolate_binary_messenger_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_bundle.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\asset_manifest.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\autofill.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\binary_messenger.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\browser_context_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\clipboard.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\deferred_component.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flavor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\flutter_version.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\font_loader.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\haptic_feedback.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\hardware_keyboard.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_inserted_content.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_key.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\keyboard_maps.g.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\live_text.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codec.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\message_codecs.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_cursor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\mouse_tracking.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_channel.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\platform_views.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\predictive_back_event.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\process_text.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_android.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_fuchsia.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_ios.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_linux.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_macos.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_web.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\raw_keyboard_windows.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\restoration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\scribe.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\sensitive_content.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\service_extensions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\spell_check.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_channels.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_chrome.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_navigator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\system_sound.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_boundary.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_editing_delta.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_formatter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_input.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\text_layout_metrics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\services\\undo_manager.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_html_element_view_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_platform_selectable_region_context_menu_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_browser_detection_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_web_image_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_io.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\_window_win32.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\actions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\adapter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\framework.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_cross_fade.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_size.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\animated_switcher.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\annotated_region.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\app_lifecycle_listener.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\async.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autocomplete.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\autofill.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\banner.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\basic.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\bottom_navigation_bar_item.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\color_filter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\constants.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\container.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_button_item.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\context_menu_controller.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\date.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\debug.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\decorated_sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_selection_style.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\default_text_editing_shortcuts.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\desktop_text_selection_toolbar_layout_delegate.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dismissible.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\display_feature_sub_screen.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\disposable_build_context.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_boundary.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\drag_target.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\draggable_scrollable_sheet.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\dual_transition_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\editable_text.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\expansible.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\fade_in_image.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\feedback.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\flutter_logo.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_manager.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_scope.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\focus_traversal.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\form.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\gesture_detector.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\grid_paper.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\heroes.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\icon_theme_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_filter.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\image_icon.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\implicit_animations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_model.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_notifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\inherited_theme.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\interactive_viewer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\keyboard_listener.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\layout_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\list_wheel_scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\localizations.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\lookup_boundary.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\magnifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\media_query.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\modal_barrier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigation_toolbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\navigator_pop_handler.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\nested_scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\notification_listener.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\orientation_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overflow_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overlay.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\overscroll_indicator.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_storage.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_transitions_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\page_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pages.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\performance_overlay.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pinned_header_sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\placeholder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_menu_bar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_selectable_region_context_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\platform_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\pop_scope.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\preferred_size.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\primary_scroll_controller.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_keyboard_listener.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_menu_anchor.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\raw_radio.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\reorderable_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\restoration_properties.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\router.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\routes.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\safe_area.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_activity.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_aware_image_provider.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_configuration.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_context.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_controller.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_delegate.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_metrics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_notification_observer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_physics.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_position_with_single_context.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_simulation.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollable_helpers.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\scrollbar.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selectable_region.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\selection_container.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\semantics_debugger.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sensitive_content.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\service_extensions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shared_app_data.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\shortcuts.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\single_child_scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\size_changed_layout_notifier.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_fill.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_floating_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_layout_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_persistent_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_prototype_extent_list.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_resizing_header.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\sliver_tree.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\snapshot_widget.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spacer.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\spell_check.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\standard_component_type.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\status_transitions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\stretch_effect.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\system_context_menu.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\table.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tap_region.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_editing_intents.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_anchors.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\text_selection_toolbar_layout_delegate.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\texture.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\title.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\transitions.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\tween_animation_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_scroll_view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\two_dimensional_viewport.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\undo_history.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\unique_widget.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\value_listenable_builder.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\view.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\viewport.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\visibility.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_inspector.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_span.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\widget_state.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\src\\widgets\\will_pop_scope.dart","D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter\\lib\\widgets.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\blend\\blend.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\contrast\\contrast.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dislike\\dislike_analyzer.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_color.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\dynamic_scheme.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\material_dynamic_colors.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\contrast_curve.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\src\\tone_delta_pair.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\dynamiccolor\\variant.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\cam16.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\hct.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\src\\hct_solver.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\hct\\viewing_conditions.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\material_color_utilities.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\core_palette.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\palettes\\tonal_palette.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_celebi.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_map.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wsmeans.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\quantizer_wu.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\quantize\\src\\point_provider_lab.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_content.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_expressive.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fidelity.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_fruit_salad.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_monochrome.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_neutral.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_rainbow.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_tonal_spot.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\scheme\\scheme_vibrant.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\score\\score.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\temperature\\temperature_cache.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\color_utils.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\math_utils.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\material_color_utilities-0.11.1\\lib\\utils\\string_utils.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\meta-1.17.0\\lib\\meta_meta.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\path.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\characters.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\context.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\internal_style.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\parsed_path.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_exception.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_map.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\path_set.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\posix.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\url.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\style\\windows.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path-1.9.1\\lib\\src\\utils.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider-2.1.5\\lib\\path_provider.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\messages.g.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_android-2.2.22\\lib\\path_provider_android.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\messages.g.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_foundation-2.5.1\\lib\\path_provider_foundation.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\path_provider_linux.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\get_application_id_real.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_linux-2.2.1\\lib\\src\\path_provider_linux.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\path_provider_platform_interface.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\enums.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_platform_interface-2.1.2\\lib\\src\\method_channel_path_provider.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\path_provider_windows.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\folders.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\guid.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\path_provider_windows_real.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\path_provider_windows-2.3.0\\lib\\src\\win32_wrappers.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\platform.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\local_platform.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\interface\\platform.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\platform-3.1.6\\lib\\src\\testing\\fake_platform.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\plugin_platform_interface-2.1.8\\lib\\plugin_platform_interface.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\vector_math_64.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb2.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\aabb3.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\colors.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\frustum.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\intersection_result.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix2.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix3.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\matrix4.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\noise.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\obb3.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\plane.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quad.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\quaternion.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\ray.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\sphere.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\triangle.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector2.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector3.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\vector4.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\constants.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\error_helpers.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\opengl.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\vector_math-2.2.0\\lib\\src\\vector_math_64\\utilities.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_characteristic.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_device.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\models\\ble_state.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_connector.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\utils\\win_helper.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\src\\win_ble.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_ble.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\win_ble-1.1.1\\lib\\win_file.dart","C:\\Users\\20748\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\xdg_directories-1.1.0\\lib\\xdg_directories.dart","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\dart_plugin_registrant.dart","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\lib\\main.dart"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\app.dill","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\flutter_build\\29702d6f9430e539ddecc7841a3adb2f\\app.dill"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\native_assets.json
```json
{"format-version":[1,0,0],"native-assets":{}}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\outputs.json
```json
["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.exp","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.lib","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.pdb","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_export.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_messenger.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_plugin_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_texture_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\icudtl.dat","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\binary_messenger_impl.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\byte_buffer_streams.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\core_implementations.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\engine_method_result.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_engine.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_view_controller.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\byte_streams.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\dart_project.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\encodable_value.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_sink.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\message_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_call.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\plugin_registrar.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\readme","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\standard_codec.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\texture_registrar_impl.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\kernel_blob.bin","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\win_ble\\assets\\BLEServer.exe","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\packages\\cupertino_icons\\assets\\CupertinoIcons.ttf","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\fonts\\MaterialIcons-Regular.otf","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\ink_sparkle.frag","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\shaders\\stretch_effect.frag","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\AssetManifest.bin","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\FontManifest.json","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NOTICES.Z","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\build\\flutter_assets\\NativeAssetsManifest.json"]
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\unpack_windows.stamp
```stamp
{"inputs":["D:\\Documents\\CodesEnvironment\\flutter\\packages\\flutter_tools\\lib\\src\\build_system\\targets\\windows.dart","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.exp","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.lib","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.pdb","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_export.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_messenger.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_plugin_registrar.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_texture_registrar.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\icudtl.dat","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\binary_messenger_impl.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\byte_buffer_streams.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\core_implementations.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\engine_method_result.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_engine.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_view_controller.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\byte_streams.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\dart_project.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\encodable_value.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_channel.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_sink.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\message_codec.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_call.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_channel.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_codec.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\plugin_registrar.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\readme","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\standard_codec.cc","D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\texture_registrar_impl.h"],"outputs":["D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.exp","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.lib","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.pdb","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_export.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_messenger.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_plugin_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_texture_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\icudtl.dat","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\binary_messenger_impl.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\byte_buffer_streams.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\core_implementations.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\engine_method_result.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_engine.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_view_controller.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\byte_streams.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\dart_project.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\encodable_value.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_sink.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\message_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_call.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_channel.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\plugin_registrar.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\readme","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\standard_codec.cc","D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\texture_registrar_impl.h"]}
```

---
## File: .dart_tool\flutter_build\29702d6f9430e539ddecc7841a3adb2f\windows_engine_sources.d
```d
 D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.exp D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.lib D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.dll.pdb D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_export.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_messenger.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_plugin_registrar.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_texture_registrar.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\flutter_windows.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\icudtl.dat D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\binary_messenger_impl.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\byte_buffer_streams.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\core_implementations.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\engine_method_result.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_engine.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\flutter_view_controller.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\byte_streams.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\dart_project.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\encodable_value.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_channel.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_sink.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\message_codec.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_call.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_channel.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_codec.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\plugin_registrar.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\readme D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\standard_codec.cc D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral\\cpp_client_wrapper\\texture_registrar_impl.h:  D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.exp D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.lib D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.dll.pdb D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_export.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_messenger.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_plugin_registrar.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_texture_registrar.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\flutter_windows.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\icudtl.dat D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\binary_messenger_impl.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\byte_buffer_streams.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\core_implementations.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\engine_method_result.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_engine.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\flutter_view_controller.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\basic_message_channel.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\binary_messenger.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\byte_streams.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\dart_project.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\encodable_value.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\engine_method_result.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_channel.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_sink.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\event_stream_handler_functions.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_engine.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\flutter_view_controller.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\message_codec.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_call.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_channel.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_codec.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\method_result_functions.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registrar_windows.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\plugin_registry.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_codec_serializer.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_message_codec.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\standard_method_codec.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\include\\flutter\\texture_registrar.h D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\plugin_registrar.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\readme D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\standard_codec.cc D:\\Documents\\CodesEnvironment\\flutter\\bin\\cache\\artifacts\\engine\\windows-x64\\cpp_client_wrapper\\texture_registrar_impl.h
```

---
## File: .idea\modules.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="ProjectModuleManager">
    <modules>
      <module fileurl="file://$PROJECT_DIR$/phys_trigger_ble.iml" filepath="$PROJECT_DIR$/phys_trigger_ble.iml" />
      <module fileurl="file://$PROJECT_DIR$/android/phys_trigger_ble_android.iml" filepath="$PROJECT_DIR$/android/phys_trigger_ble_android.iml" />
    </modules>
  </component>
</project>

```

---
## File: .idea\workspace.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="FileEditorManager">
    <leaf>
      <file leaf-file-name="main.dart" pinned="false" current-in-tab="true">
        <entry file="file://$PROJECT_DIR$/lib/main.dart">
          <provider selected="true" editor-type-id="text-editor">
            <state relative-caret-position="0">
              <caret line="0" column="0" lean-forward="false" selection-start-line="0" selection-start-column="0" selection-end-line="0" selection-end-column="0" />
            </state>
          </provider>
        </entry>
      </file>
    </leaf>
  </component>
  <component name="ToolWindowManager">
    <editor active="true" />
    <layout>
      <window_info id="Project" active="false" anchor="left" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="true" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="0" side_tool="false" content_ui="combo" />
    </layout>
  </component>
  <component name="ProjectView">
    <navigator currentView="ProjectPane" proportions="" version="1">
    </navigator>
    <panes>
      <pane id="ProjectPane">
        <option name="show-excluded-files" value="false" />
      </pane>
    </panes>
  </component>
  <component name="PropertiesComponent">
    <property name="last_opened_file_path" value="$PROJECT_DIR$" />
    <property name="dart.analysis.tool.window.force.activate" value="true" />
    <property name="show.migrate.to.gradle.popup" value="false" />
  </component>
</project>

```

---
## File: .idea\libraries\Dart_SDK.xml
```xml
<component name="libraryTable">
  <library name="Dart SDK">
    <CLASSES>
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/async" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/collection" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/convert" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/core" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/developer" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/html" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/io" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/isolate" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/math" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/mirrors" />
      <root url="file://D:\Documents\CodesEnvironment\flutter/bin/cache/dart-sdk/lib/typed_data" />
    </CLASSES>
    <JAVADOC />
    <SOURCES />
  </library>
</component>
```

---
## File: .idea\libraries\KotlinJavaRuntime.xml
```xml
<component name="libraryTable">
  <library name="KotlinJavaRuntime">
    <CLASSES>
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-stdlib.jar!/" />
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-reflect.jar!/" />
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-test.jar!/" />
    </CLASSES>
    <JAVADOC />
    <SOURCES>
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-stdlib-sources.jar!/" />
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-reflect-sources.jar!/" />
      <root url="jar://$KOTLIN_BUNDLED$/lib/kotlin-test-sources.jar!/" />
    </SOURCES>
  </library>
</component>

```

---
## File: .idea\runConfigurations\main_dart.xml
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="main.dart" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$PROJECT_DIR$/lib/main.dart" />
    <method />
  </configuration>
</component>
```

---
## File: android\local.properties
```properties
flutter.sdk=D:\\Documents\\CodesEnvironment\\flutter
```

---
## File: android\app\src\main\AndroidManifest.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <!-- ============================================================ -->
    <!-- BLUETOOTH PERMISSIONS - CRITICAL FOR BLE FUNCTIONALITY      -->
    <!-- ============================================================ -->
    
    <!-- 
    ┌─────────────────────────────────────────────────────────────────┐
    │ Android 10-11 (API 29-30) - Legacy Permissions                 │
    │ These are required for BLE scanning on older devices.          │
    │ maxSdkVersion="30" ensures they're not requested on Android 12+│
    └─────────────────────────────────────────────────────────────────┘
    -->
    <uses-permission 
        android:name="android.permission.BLUETOOTH" 
        android:maxSdkVersion="30" />
    <uses-permission 
        android:name="android.permission.BLUETOOTH_ADMIN" 
        android:maxSdkVersion="30" />
    
    <!-- Location permission required for BLE scanning on Android 10-11 -->
    <!-- BLE scanning can reveal location via beacons, hence this requirement -->
    <uses-permission 
        android:name="android.permission.ACCESS_FINE_LOCATION"
        android:maxSdkVersion="30" />
    
    <!-- Coarse location as fallback -->
    <uses-permission 
        android:name="android.permission.ACCESS_COARSE_LOCATION"
        android:maxSdkVersion="30" />

    <!-- 
    ┌─────────────────────────────────────────────────────────────────┐
    │ Android 12+ (API 31+) - Fine-grained Bluetooth Permissions     │
    │ These new permissions decouple BLE from location access.       │
    └─────────────────────────────────────────────────────────────────┘
    -->
    
    <!-- BLUETOOTH_SCAN: Required to discover nearby BLE devices -->
    <!-- neverForLocation: We don't use scan results for location inference -->
    <uses-permission 
        android:name="android.permission.BLUETOOTH_SCAN"
        android:usesPermissionFlags="neverForLocation" />
    
    <!-- BLUETOOTH_CONNECT: Required to connect to paired/discovered devices -->
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    
    <!-- BLUETOOTH_ADVERTISE: Only needed if this device broadcasts as peripheral -->
    <!-- Uncomment if implementing peripheral mode -->
    <!-- <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" /> -->

    <!-- 
    ┌─────────────────────────────────────────────────────────────────┐
    │ Hardware Features                                               │
    └─────────────────────────────────────────────────────────────────┘
    -->
    
    <!-- Declare BLE as required - App won't appear on devices without BLE -->
    <uses-feature 
        android:name="android.hardware.bluetooth_le" 
        android:required="true" />

    <!-- ============================================================ -->
    <!-- APPLICATION CONFIGURATION                                    -->
    <!-- ============================================================ -->
    
    <application
        android:label="PhysTrigger"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:enableOnBackInvokedCallback="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <!-- Main Entry Point -->
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
            
            <!-- Specifies the Flutter rendering engine -->
            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme" />
        </activity>
        
        <!-- Don't delete the meta-data below -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
            
    </application>
    
    <!-- Query for Bluetooth adapter state (Android 11+) -->
    <queries>
        <intent>
            <action android:name="android.bluetooth.adapter.action.REQUEST_ENABLE" />
        </intent>
    </queries>
    
</manifest>

```

---
## File: android\app\src\main\java\io\flutter\plugins\GeneratedPluginRegistrant.java
```java
package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new com.lib.flutter_blue_plus.FlutterBluePlusPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_blue_plus, com.lib.flutter_blue_plus.FlutterBluePlusPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler_android, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
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
## File: lib\main.dart
```dart
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:win_ble/win_ble.dart';
import 'package:win_ble/win_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize win_ble for Windows
  await WinBle.initialize(serverPath: await WinServer.path());
  
  runApp(const PhysTriggerApp());
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhysTrigger',
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
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // Windows BLE state
  String? targetDeviceAddress;
  String? targetDeviceName;
  bool isConnected = false;
  String? targetCharacteristicId;
  
  bool isScanning = false;
  String statusMessage = 'Ready to connect';

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  StreamSubscription? _scanSubscription;
  StreamSubscription? _connectionSubscription;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    
    // Listen for connection state changes
    _connectionSubscription = WinBle.connectionStreamOf(targetDeviceAddress ?? '').listen((event) {
      debugPrint('[BLE] Connection state: $event');
      if (mounted) {
        setState(() {
          isConnected = event;
          if (!event) {
            statusMessage = 'Disconnected';
            targetCharacteristicId = null;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scanSubscription?.cancel();
    _connectionSubscription?.cancel();
    WinBle.dispose();
    super.dispose();
  }

  void startScan() async {
    setState(() {
      isScanning = true;
      statusMessage = 'Scanning for devices...';
      targetDeviceAddress = null;
      targetDeviceName = null;
    });
    _pulseController.repeat(reverse: true);

    try {
      // Start BLE scan
      WinBle.startScanning();
      debugPrint('[SCAN] ========== SCAN STARTED ==========');
      
      // Listen for scan results - log EVERY device
      _scanSubscription = WinBle.scanStream.listen((device) {
        // 上帝视角日志 - 打印每一个设备
        debugPrint('[DEBUG SCAN] Found: "${device.name}" [${device.address}] RSSI:${device.rssi}');
        
        final name = device.name;
        final address = device.address;
        
        // 匹配逻辑 - 优先 MAC 地址，然后名字
        bool isTarget = false;
        bool matchedByMac = false;
        
        // 1. 优先检查 MAC 地址
        if (address.toLowerCase() == "1c:db:d4:e0:a6:ae") {
          isTarget = true;
          matchedByMac = true;
        }
        // 2. 备用：名字匹配
        else if (name == "PT_POLLING_MODE") {
          isTarget = true;
        } else if (name.contains("PT_")) {
          isTarget = true;
        } else if (name.contains("PhysTrigger")) {
          isTarget = true;
        }
        
        if (isTarget) {
          debugPrint(">>> 🎯 命中目标: ${device.name} [${device.address}] (MAC匹配: $matchedByMac)");
          
          WinBle.stopScanning();
          _scanSubscription?.cancel();
          
          // 设置显示名称
          String displayName;
          if (name.isNotEmpty) {
            displayName = name;
          } else if (matchedByMac) {
            displayName = 'PhysTrigger (MAC Found)';
          } else {
            displayName = 'PT_POLLING_MODE (Unknown)';
          }
          
          setState(() {
            targetDeviceAddress = address;
            targetDeviceName = displayName;
            statusMessage = 'Device found! Tap to connect.';
            isScanning = false;
          });
          
          _pulseController.stop();
          _pulseController.reset();
        }
      });
      
      // Timeout after 15 seconds (延长扫描时间)
      await Future.delayed(const Duration(seconds: 15));
      
      if (targetDeviceAddress == null && mounted) {
        WinBle.stopScanning();
        _scanSubscription?.cancel();
        debugPrint('[SCAN] ========== SCAN TIMEOUT (15s) ==========');
        setState(() {
          statusMessage = 'No device found. Try again.';
          isScanning = false;
        });
        _pulseController.stop();
        _pulseController.reset();
      }
    } catch (e) {
      debugPrint('[ERROR] Scan failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Scan error: $e';
          isScanning = false;
        });
      }
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  Future<void> connect() async {
    if (targetDeviceAddress == null) return;
    
    setState(() => statusMessage = 'Connecting...');
    
    try {
      // Connect to device
      await WinBle.connect(targetDeviceAddress!);
      
      setState(() {
        isConnected = true;
        statusMessage = 'Connected! Discovering services...';
      });
      
      // Discover services
      List<dynamic> services = await WinBle.discoverServices(targetDeviceAddress!);
      debugPrint('[BLE] Services: $services');
      
      for (var serviceId in services) {
        debugPrint('[BLE] Service: $serviceId');
        
        // Look for our target service - exact 128-bit UUID match (PT_POLLING_MODE)
        if (serviceId.toString().toLowerCase() == '91bad492-b950-4226-aa2b-4ede9fa42f59') {
          // Discover characteristics
          List<dynamic> characteristics = await WinBle.discoverCharacteristics(
            address: targetDeviceAddress!,
            serviceId: serviceId.toString(),
          );
          
          for (var char in characteristics) {
            debugPrint('[BLE] Characteristic: ${char.uuid}');
            if (char.uuid.toString().toLowerCase() == '0d563a58-193a-45ce-b540-34440306385d') {
              setState(() {
                targetCharacteristicId = char.uuid.toString();
                statusMessage = 'Connected! Ready to control.';
              });
              break;
            }
          }
        }
      }
      
      if (targetCharacteristicId == null && mounted) {
        setState(() {
          statusMessage = 'Connected but characteristic not found.';
        });
      }
    } catch (e) {
      debugPrint('[ERROR] Connection failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Connection failed: $e';
          isConnected = false;
        });
      }
    }
  }

  // BLE Command Constants - Raw hex bytes matching ESP32 firmware expectations
  static const List<int> CMD_PRESS = [0x01];
  static const List<int> CMD_RELEASE = [0x00];

  void sendCmd(bool press) async {
    if (targetDeviceAddress == null || targetCharacteristicId == null) return;
    
    // 【核心修改】如果是 false (松开)，直接忽略，不发送任何数据
    // ESP32 固件会自动回弹，无需 App 发送 RELEASE
    if (!press) {
      debugPrint('[LOGIC] Ignored RELEASE command (handled by firmware)');
      return;
    }

    final command = CMD_PRESS; // 永远只发 PRESS
    
    try {
      // Write raw byte command to characteristic
      await WinBle.write(
        address: targetDeviceAddress!,
        service: "91bad492-b950-4226-aa2b-4ede9fa42f59", // PT_POLLING_MODE Service UUID
        characteristic: targetCharacteristicId!,
        data: Uint8List.fromList(command),
        writeWithResponse: false, // No ACK wait for faster response
      );
      debugPrint('[BLE] Sent TRIGGER (0x01)');;
    } on StateError catch (e) {
      // Handle disconnection during write
      debugPrint('[ERROR] Device disconnected during write: $e');
      if (mounted) {
        setState(() {
          isConnected = false;
          targetCharacteristicId = null;
          statusMessage = 'Device disconnected. Please reconnect.';
        });
      }
    } catch (e) {
      debugPrint('[ERROR] Write failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Write error: ${e.toString()}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    // Show control panel when connected with characteristic
    if (isConnected && targetCharacteristicId != null) {
      return _buildControlCard();
    }

    // Show connect button when device found
    if (targetDeviceAddress != null && !isConnected) {
      return _buildConnectCard();
    }

    // Default: Show scan card
    return _buildScanCard();
  }

  /// Main Action Card - Scan for device
  Widget _buildScanCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF58A6FF).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF30363D).withOpacity(0.8),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Large Bluetooth Icon with glow effect
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: isScanning ? _pulseAnimation.value : 1.0,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF58A6FF).withOpacity(0.3),
                          const Color(0xFF58A6FF).withOpacity(0.05),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF58A6FF),
                              Color(0xFF1F6FEB),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF58A6FF).withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.bluetooth,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Headline
            const Text(
              'Connect to PhysTrigger',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Subtitle
            Text(
              'Scan for your ESP32 device to start controlling.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.6),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Status indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF21262D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isScanning
                          ? const Color(0xFFF0883E)
                          : const Color(0xFF8B949E),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      statusMessage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Start Scanning Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isScanning ? null : startScan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF238636),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF238636).withOpacity(0.5),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isScanning)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    else
                      const Icon(Icons.search, size: 22),
                    const SizedBox(width: 10),
                    Text(
                      isScanning ? 'Scanning...' : 'Start Scanning',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Connect Card - Device found, tap to connect
  Widget _buildConnectCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF238636).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF238636).withOpacity(0.5),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF238636),
                    Color(0xFF2EA043),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF238636).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.bluetooth_connected,
                size: 40,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Device Found!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              targetDeviceName ?? 'PhysTrigger_Device',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            
            const SizedBox(height: 4),
            
            Text(
              targetDeviceAddress ?? '',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Colors.white.withOpacity(0.4),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: connect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF238636),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.link, size: 22),
                    SizedBox(width: 10),
                    Text(
                      'Connect Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Control Card - Connected and ready to use
  Widget _buildControlCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF238636).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF238636).withOpacity(0.5),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Connected status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF238636).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF238636).withOpacity(0.5),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Color(0xFF3FB950),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Connected',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3FB950),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'PhysTrigger Control',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 32),

            // Large trigger button - 只发送 PRESS，RELEASE 由固件自动处理
            GestureDetector(
              onTap: () => sendCmd(true), // 点击即触发
              // onLongPressEnd 已移除 - ESP32 固件自动回弹
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF58A6FF),
                      Color(0xFF1F6FEB),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF58A6FF).withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'HOLD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Press and hold to trigger',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
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
/// Provides a single import point for all core functionality
library;

export 'services/ble_service.dart';
export 'services/ble_service_impl.dart';
export 'utils/byte_utils.dart';
export 'viewmodels/ble_controller_viewmodel.dart';

```

---
## File: lib\core\services\ble_service.dart
```dart
/// BLE Service Interface for PhysTrigger
/// 
/// This abstract class defines the contract for BLE operations.
/// Concrete implementations will use platform-specific BLE packages
/// (e.g., flutter_blue_plus, flutter_reactive_ble).
library;

import 'dart:async';

/// Represents a discovered BLE device
class BleDevice {
  final String id;          // Device MAC address or UUID
  final String name;        // Device advertised name
  final int rssi;           // Signal strength
  
  const BleDevice({
    required this.id,
    required this.name,
    required this.rssi,
  });
  
  @override
  String toString() => 'BleDevice($name, $id, RSSI: $rssi)';
}

/// Connection state enum for BLE device
enum BleConnectionState {
  disconnected,
  connecting,
  connected,
  disconnecting,
}

/// Abstract BLE Service interface
/// 
/// Implementations should handle:
/// - Android 10-11: ACCESS_FINE_LOCATION permission
/// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT permissions
abstract class BleService {
  
  // ============================================================
  // Properties
  // ============================================================
  
  /// Stream of connection state changes
  Stream<BleConnectionState> get connectionStateStream;
  
  /// Current connection state
  BleConnectionState get connectionState;
  
  /// Currently connected device (null if not connected)
  BleDevice? get connectedDevice;
  
  // ============================================================
  // Scanning
  // ============================================================
  
  /// Start scanning for BLE devices
  /// 
  /// [serviceUuids] - Optional list of service UUIDs to filter by
  /// [timeout] - Scan duration (default: 10 seconds)
  /// 
  /// Returns a stream of discovered devices
  Stream<BleDevice> scan({
    List<String>? serviceUuids,
    Duration timeout = const Duration(seconds: 10),
  });
  
  /// Stop ongoing BLE scan
  Future<void> stopScan();
  
  // ============================================================
  // Connection
  // ============================================================
  
  /// Connect to a BLE device by its ID
  /// 
  /// [deviceId] - The device's unique identifier (MAC/UUID)
  /// [timeout] - Connection timeout (default: 15 seconds)
  /// 
  /// Throws [BleConnectionException] on failure
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  });
  
  /// Disconnect from the currently connected device
  Future<void> disconnect();
  
  // ============================================================
  // Data Transmission
  // ============================================================
  
  /// Write raw bytes to a BLE characteristic
  /// 
  /// [serviceUuid] - The target service UUID (e.g., "FFE0")
  /// [characteristicUuid] - The target characteristic UUID (e.g., "FFE1")
  /// [data] - List of bytes to send (0-255 range)
  /// [withResponse] - Whether to wait for write confirmation
  /// 
  /// Example:
  /// ```dart
  /// // Send "forward" command (0x01)
  /// await writeBytes("FFE0", "FFE1", [0x01]);
  /// 
  /// // Send "stop" command (0x00)
  /// await writeBytes("FFE0", "FFE1", [0x00]);
  /// ```
  Future<void> writeBytes(
    String serviceUuid,
    String characteristicUuid,
    List<int> data, {
    bool withResponse = false,
  });
  
  /// Read bytes from a BLE characteristic
  /// 
  /// Returns the characteristic's current value as a byte list
  Future<List<int>> readBytes(
    String serviceUuid,
    String characteristicUuid,
  );
  
  /// Subscribe to notifications from a characteristic
  /// 
  /// Returns a stream of byte arrays when the characteristic value changes
  Stream<List<int>> subscribeToNotifications(
    String serviceUuid,
    String characteristicUuid,
  );
  
  // ============================================================
  // Lifecycle
  // ============================================================
  
  /// Initialize the BLE service
  /// 
  /// Should request necessary permissions based on Android version:
  /// - Android 10-11: ACCESS_FINE_LOCATION
  /// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT
  Future<void> initialize();
  
  /// Dispose of resources
  Future<void> dispose();
}

/// Exception thrown when BLE connection fails
class BleConnectionException implements Exception {
  final String message;
  final dynamic originalError;
  
  const BleConnectionException(this.message, [this.originalError]);
  
  @override
  String toString() => 'BleConnectionException: $message';
}

/// Exception thrown when BLE write operation fails
class BleWriteException implements Exception {
  final String message;
  final dynamic originalError;
  
  const BleWriteException(this.message, [this.originalError]);
  
  @override
  String toString() => 'BleWriteException: $message';
}

```

---
## File: lib\core\services\ble_service_impl.dart
```dart
/// Concrete BLE Service Implementation using flutter_blue_plus
///
/// This class implements the [BleService] interface with real BLE
/// hardware communication using the flutter_blue_plus library.
///
/// Key Features:
/// - UUID-filtered scanning (only shows devices with Service FFE0)
/// - Automatic service/characteristic discovery on connect
/// - Cached characteristic reference for low-latency writes
/// - Connection state stream for UI updates
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ble_service.dart';
import '../utils/byte_utils.dart';

/// Implementation of [BleService] using flutter_blue_plus
class BleServiceImpl implements BleService {
  // ============================================================
  // Private State
  // ============================================================

  /// Currently connected device (flutter_blue_plus native type)
  BluetoothDevice? _device;

  /// Cached target characteristic for fast writes
  /// This is the FFE1 characteristic under FFE0 service
  BluetoothCharacteristic? _targetCharacteristic;

  /// Scan subscription
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  /// Connection state subscription
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;

  /// Internal connection state controller
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  /// Current connection state cache
  BleConnectionState _currentConnectionState = BleConnectionState.disconnected;

  /// Connected device info cache
  BleDevice? _connectedDevice;

  // ============================================================
  // BleService Interface - Properties
  // ============================================================

  @override
  Stream<BleConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  BleConnectionState get connectionState => _currentConnectionState;

  @override
  BleDevice? get connectedDevice => _connectedDevice;

  // ============================================================
  // BleService Interface - Lifecycle
  // ============================================================

  @override
  Future<void> initialize() async {
    // Check if Bluetooth is supported
    if (await FlutterBluePlus.isSupported == false) {
      throw BleConnectionException('Bluetooth is not supported on this device');
    }

    // Request permissions based on platform and OS version
    await _requestPermissions();

    // Check if Bluetooth is on
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      // Attempt to turn on Bluetooth (Android only)
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
        // Wait for adapter to be on
        await FlutterBluePlus.adapterState
            .where((state) => state == BluetoothAdapterState.on)
            .first
            .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw BleConnectionException(
              'Bluetooth is turned off. Please enable Bluetooth.',
            );
          },
        );
      } else {
        throw BleConnectionException(
          'Bluetooth is turned off. Please enable Bluetooth in Settings.',
        );
      }
    }

    debugPrint('BleServiceImpl: Initialized successfully');
  }

  /// Request Android runtime permissions based on OS version
  Future<void> _requestPermissions() async {
    if (!Platform.isAndroid) return;

    // Android 12+ (API 31+)
    if (await _isAndroid12OrHigher()) {
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (scanStatus.isDenied || connectStatus.isDenied) {
        throw BleConnectionException(
          'Bluetooth permissions are required. '
          'Please grant permissions in Settings.',
        );
      }
    } else {
      // Android 10-11
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isDenied) {
        throw BleConnectionException(
          'Location permission is required for Bluetooth scanning on this device.',
        );
      }
    }
  }

  /// Check if running Android 12 (API 31) or higher
  Future<bool> _isAndroid12OrHigher() async {
    // permission_handler doesn't expose SDK version directly
    // We check by trying to query Android 12+ specific permission
    final status = await Permission.bluetoothScan.status;
    // If this permission exists (not permanently denied due to API level),
    // we're on Android 12+
    return status != PermissionStatus.permanentlyDenied;
  }

  @override
  Future<void> dispose() async {
    await _scanSubscription?.cancel();
    await _connectionSubscription?.cancel();
    await disconnect();
    await _connectionStateController.close();
  }

  // ============================================================
  // BleService Interface - Scanning
  // ============================================================

  @override
  Stream<BleDevice> scan({
    List<String>? serviceUuids,
    Duration timeout = const Duration(seconds: 10),
  }) {
    final controller = StreamController<BleDevice>();

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Platform-specific scan configuration
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
    // Build UUID filter list
    // Using withServices filter greatly improves UX by only showing
    // devices that advertise the target service UUID
    final List<Guid> filterUuids = [];
    
    // On desktop (Windows/macOS/Linux), UUID filtering may not work
    // reliably with all adapters, so we filter manually in results
    final bool isDesktop = Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    
    if (!isDesktop) {
      // Mobile: Use hardware UUID filtering for better performance
      if (serviceUuids != null) {
        for (final uuid in serviceUuids) {
          filterUuids.add(Guid(uuid));
        }
      } else {
        // Default: Filter for our target service (FFE0)
        filterUuids.add(Guid(BleUuids.serviceUuid));
      }
    }

    // Start scanning with platform-appropriate configuration
    FlutterBluePlus.startScan(
      withServices: isDesktop ? [] : filterUuids, // Desktop: scan all, filter manually
      timeout: timeout,
      androidUsesFineLocation: false, // We use neverForLocation flag
    );

    // Target UUID for manual filtering on desktop
    final targetUuidUpper = BleUuids.serviceUuid.toUpperCase();
    final targetUuidShort = 'FFE0';

    // Listen to scan results
    _scanSubscription = FlutterBluePlus.scanResults.listen(
      (results) {
        for (final result in results) {
          // On desktop, manually filter by service UUID
          if (isDesktop && serviceUuids == null) {
            bool hasTargetService = false;
            for (final serviceUuid in result.advertisementData.serviceUuids) {
              final uuidStr = serviceUuid.str.toUpperCase();
              if (uuidStr.contains(targetUuidShort) || uuidStr == targetUuidUpper) {
                hasTargetService = true;
                break;
              }
            }
            if (!hasTargetService) continue; // Skip devices without our service
          }
          
          final device = BleDevice(
            id: result.device.remoteId.str,
            name: result.device.platformName.isNotEmpty
                ? result.device.platformName
                : 'Unknown Device',
            rssi: result.rssi,
          );
          controller.add(device);
        }
      },
      onError: (error) {
        controller.addError(BleConnectionException('Scan failed', error));
      },
    );

    // Handle scan completion
    FlutterBluePlus.isScanning.where((scanning) => !scanning).first.then((_) {
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  // ============================================================
  // BleService Interface - Connection
  // ============================================================

  @override
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      _updateConnectionState(BleConnectionState.connecting);

      // Get device reference
      _device = BluetoothDevice.fromId(deviceId);

      // Setup connection state listener BEFORE connecting
      _connectionSubscription = _device!.connectionState.listen((state) {
        switch (state) {
          case BluetoothConnectionState.connected:
            _updateConnectionState(BleConnectionState.connected);
          case BluetoothConnectionState.disconnected:
            _updateConnectionState(BleConnectionState.disconnected);
            _targetCharacteristic = null;
            _connectedDevice = null;
          default:
            break;
        }
      });

      // Attempt connection
      await _device!.connect(
        timeout: timeout,
        autoConnect: false, // Explicit connect, no auto-reconnect
      );

      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // CRITICAL: Discover services immediately after connect
      // This finds our FFE0 service and FFE1 characteristic
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      await _discoverAndCacheCharacteristic();

      // Cache connected device info
      _connectedDevice = BleDevice(
        id: deviceId,
        name: _device!.platformName.isNotEmpty
            ? _device!.platformName
            : 'Unknown Device',
        rssi: 0,
      );

      debugPrint('BleServiceImpl: Connected to $deviceId');
    } catch (e) {
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionException('Failed to connect to device', e);
    }
  }

  /// Discover services and cache the target characteristic
  ///
  /// This is called immediately after connection to:
  /// 1. Find Service FFE0
  /// 2. Find Characteristic FFE1 within that service
  /// 3. Cache it in [_targetCharacteristic] for fast writes
  Future<void> _discoverAndCacheCharacteristic() async {
    if (_device == null) {
      throw BleConnectionException('No device connected');
    }

    // Discover all services
    final services = await _device!.discoverServices();
    debugPrint('BleServiceImpl: Discovered ${services.length} services');

    // Find our target service (FFE0)
    BluetoothService? targetService;
    for (final service in services) {
      // Compare with both short and full UUID formats
      final uuidStr = service.uuid.str.toUpperCase();
      if (uuidStr.contains('FFE0') ||
          uuidStr == BleUuids.serviceUuid.toUpperCase()) {
        targetService = service;
        debugPrint('BleServiceImpl: Found target service: $uuidStr');
        break;
      }
    }

    if (targetService == null) {
      throw BleConnectionException(
        'Target service (FFE0) not found on this device. '
        'Please ensure you are connecting to the correct hardware.',
      );
    }

    // Find our target characteristic (FFE1) within the service
    for (final characteristic in targetService.characteristics) {
      final uuidStr = characteristic.uuid.str.toUpperCase();
      if (uuidStr.contains('FFE1') ||
          uuidStr == BleUuids.characteristicUuid.toUpperCase()) {
        _targetCharacteristic = characteristic;
        debugPrint('BleServiceImpl: Found target characteristic: $uuidStr');
        debugPrint(
            '  Properties: read=${characteristic.properties.read}, '
            'write=${characteristic.properties.write}, '
            'writeNoResponse=${characteristic.properties.writeWithoutResponse}, '
            'notify=${characteristic.properties.notify}');
        break;
      }
    }

    if (_targetCharacteristic == null) {
      throw BleConnectionException(
        'Target characteristic (FFE1) not found within service FFE0.',
      );
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      _updateConnectionState(BleConnectionState.disconnecting);
      await _connectionSubscription?.cancel();
      _connectionSubscription = null;

      if (_device != null) {
        await _device!.disconnect();
      }

      _device = null;
      _targetCharacteristic = null;
      _connectedDevice = null;
      _updateConnectionState(BleConnectionState.disconnected);

      debugPrint('BleServiceImpl: Disconnected');
    } catch (e) {
      _updateConnectionState(BleConnectionState.disconnected);
      debugPrint('BleServiceImpl: Disconnect error: $e');
    }
  }

  /// Update connection state and notify listeners
  void _updateConnectionState(BleConnectionState state) {
    _currentConnectionState = state;
    _connectionStateController.add(state);
  }

  // ============================================================
  // BleService Interface - Data Transmission
  // ============================================================

  @override
  Future<void> writeBytes(
    String serviceUuid,
    String characteristicUuid,
    List<int> data, {
    bool withResponse = false,
  }) async {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Use cached characteristic for minimal latency
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_targetCharacteristic == null) {
      throw BleWriteException(
        'Not connected or characteristic not discovered. '
        'Call connect() first.',
      );
    }

    try {
      // Validate data range (0-255 per byte)
      validateBytes(data);

      // Determine write type based on characteristic properties
      // Prefer writeWithoutResponse for lower latency (important for control apps)
      final bool useWithoutResponse =
          _targetCharacteristic!.properties.writeWithoutResponse &&
              !withResponse;

      await _targetCharacteristic!.write(
        data,
        withoutResponse: useWithoutResponse,
      );

      debugPrint(
        'BleServiceImpl: Wrote ${bytesToHexString(data)} '
        '(withoutResponse: $useWithoutResponse)',
      );
    } catch (e) {
      throw BleWriteException('Failed to write data', e);
    }
  }

  @override
  Future<List<int>> readBytes(
    String serviceUuid,
    String characteristicUuid,
  ) async {
    if (_targetCharacteristic == null) {
      throw BleWriteException('Not connected or characteristic not discovered');
    }

    try {
      final value = await _targetCharacteristic!.read();
      debugPrint('BleServiceImpl: Read ${bytesToHexString(value)}');
      return value;
    } catch (e) {
      throw BleWriteException('Failed to read data', e);
    }
  }

  @override
  Stream<List<int>> subscribeToNotifications(
    String serviceUuid,
    String characteristicUuid,
  ) {
    if (_targetCharacteristic == null) {
      throw BleWriteException('Not connected or characteristic not discovered');
    }

    // Enable notifications on the characteristic
    _targetCharacteristic!.setNotifyValue(true);

    // Return the notification stream
    return _targetCharacteristic!.onValueReceived;
  }
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

/// Common command constants based on BLE Protocol Summary
/// 
/// These values correspond to the Hex commands in the protocol table:
/// | Action  | Hex  | Decimal |
/// |---------|------|---------|
/// | Stop    | 0x00 | [0]     |
/// | Forward | 0x01 | [1]     |
/// | Back    | 0x02 | [2]     |
/// | Left    | 0x03 | [3]     |
/// | Right   | 0x04 | [4]     |
abstract class BleCommands {
  static const List<int> stop = [0x00];
  static const List<int> forward = [0x01];
  static const List<int> backward = [0x02];
  static const List<int> left = [0x03];
  static const List<int> right = [0x04];
}

/// BLE UUID constants from the protocol
abstract class BleUuids {
  /// Default HM-10/ESP32 Serial Service UUID
  static const String serviceUuid = '0000FFE0-0000-1000-8000-00805F9B34FB';
  static const String serviceUuidShort = 'FFE0';
  
  /// Default Data Characteristic UUID (Read/Write/Notify)
  static const String characteristicUuid = '0000FFE1-0000-1000-8000-00805F9B34FB';
  static const String characteristicUuidShort = 'FFE1';
}

```

---
## File: lib\core\viewmodels\ble_controller_viewmodel.dart
```dart
/// BLE Controller ViewModel - Complete Implementation
///
/// MVVM ViewModel layer that bridges UI with BleService.
/// Manages scanning, connection, and command state.
library;

import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/ble_service.dart';
import '../utils/byte_utils.dart';

/// ViewModel for BLE control operations
///
/// Usage with Provider:
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => BleControllerViewModel(BleServiceImpl()),
/// )
/// ```
class BleControllerViewModel extends ChangeNotifier {
  final BleService _bleService;

  // ============================================================
  // State Properties
  // ============================================================

  /// List of discovered devices from scan
  List<BleDevice> _scanResults = [];
  List<BleDevice> get scanResults => List.unmodifiable(_scanResults);

  /// Current connection state
  BleConnectionState _connectionState = BleConnectionState.disconnected;
  BleConnectionState get connectionState => _connectionState;

  /// Currently connected device
  BleDevice? _connectedDevice;
  BleDevice? get connectedDevice => _connectedDevice;

  /// Whether a scan is in progress
  bool _isScanning = false;
  bool get isScanning => _isScanning;

  /// Convenience getter for connection status
  bool get isConnected => _connectionState == BleConnectionState.connected;
  bool get isConnecting => _connectionState == BleConnectionState.connecting;

  /// Last error message (for UI display)
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// Last sent command (for debug display)
  List<int>? _lastSentCommand;
  List<int>? get lastSentCommand => _lastSentCommand;
  String get lastSentCommandHex =>
      _lastSentCommand != null ? bytesToHexString(_lastSentCommand!) : '--';

  // ============================================================
  // Stream Subscriptions (must be disposed!)
  // ============================================================

  StreamSubscription<BleConnectionState>? _connectionStateSubscription;
  StreamSubscription<BleDevice>? _scanSubscription;
  Timer? _scanTimeoutTimer;

  // ============================================================
  // Constructor & Initialization
  // ============================================================

  BleControllerViewModel(this._bleService) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _bleService.initialize();

      // Subscribe to connection state changes from service
      _connectionStateSubscription =
          _bleService.connectionStateStream.listen((state) {
        _connectionState = state;

        if (state == BleConnectionState.connected) {
          _connectedDevice = _bleService.connectedDevice;
          _errorMessage = null;
        } else if (state == BleConnectionState.disconnected) {
          _connectedDevice = null;
        }

        notifyListeners();
      });
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
    }
  }

  // ============================================================
  // Scanning
  // ============================================================

  /// Start scanning for BLE devices
  ///
  /// - Clears previous results
  /// - Auto-stops after 5 seconds
  /// - Filters for devices with Service UUID FFE0
  Future<void> startScan() async {
    if (_isScanning) return;

    _isScanning = true;
    _scanResults = [];
    _errorMessage = null;
    notifyListeners();

    try {
      // Start the scan stream
      _scanSubscription = _bleService
          .scan(
        serviceUuids: [BleUuids.serviceUuidShort],
        timeout: const Duration(seconds: 5),
      )
          .listen(
        (device) {
          // Avoid duplicates by checking device ID
          if (!_scanResults.any((d) => d.id == device.id)) {
            _scanResults.add(device);
            notifyListeners();
          }
        },
        onError: (error) {
          _errorMessage = error.toString();
          _isScanning = false;
          notifyListeners();
        },
        onDone: () {
          _isScanning = false;
          notifyListeners();
        },
      );

      // Auto-stop after 5 seconds as safety net
      _scanTimeoutTimer = Timer(const Duration(seconds: 5), () {
        stopScan();
      });
    } catch (e) {
      _errorMessage = e.toString();
      _isScanning = false;
      notifyListeners();
    }
  }

  /// Stop the current scan
  Future<void> stopScan() async {
    _scanTimeoutTimer?.cancel();
    _scanTimeoutTimer = null;

    await _scanSubscription?.cancel();
    _scanSubscription = null;

    await _bleService.stopScan();

    _isScanning = false;
    notifyListeners();
  }

  // ============================================================
  // Connection
  // ============================================================

  /// Connect to a discovered device
  Future<bool> connect(BleDevice device) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await _bleService.connect(device.id);
      return true;
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      return false;
    }
  }

  /// Disconnect from the current device
  Future<void> disconnect() async {
    _errorMessage = null;
    try {
      await _bleService.disconnect();
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  // ============================================================
  // Command Sending
  // ============================================================

  /// Send raw bytes to the connected device
  ///
  /// This is the core method called by HoldActionButton.
  /// Updates [lastSentCommand] for debug display.
  Future<void> sendCommand(List<int> bytes) async {
    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot send - not connected');
      return;
    }

    try {
      validateBytes(bytes);

      await _bleService.writeBytes(
        BleUuids.serviceUuidShort,
        BleUuids.characteristicUuidShort,
        bytes,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent ${bytesToHexString(bytes)}');
    } on BleWriteException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
    }
  }

  /// Convenience: Send forward command
  Future<void> forward() => sendCommand(BleCommands.forward);

  /// Convenience: Send backward command
  Future<void> backward() => sendCommand(BleCommands.backward);

  /// Convenience: Send left command
  Future<void> left() => sendCommand(BleCommands.left);

  /// Convenience: Send right command
  Future<void> right() => sendCommand(BleCommands.right);

  /// Convenience: Send stop command
  Future<void> stop() => sendCommand(BleCommands.stop);

  // ============================================================
  // Lifecycle - CRITICAL: Dispose subscriptions to prevent leaks!
  // ============================================================

  @override
  void dispose() {
    // Cancel all stream subscriptions
    _connectionStateSubscription?.cancel();
    _scanSubscription?.cancel();
    _scanTimeoutTimer?.cancel();

    // Dispose the underlying service
    _bleService.dispose();

    super.dispose();
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
                pressCommand: BleCommands.stop,
                releaseCommand: BleCommands.stop,
                onCommand: viewModel.sendCommand,
                size: 70,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade900,
                enabled: viewModel.isConnected,
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
## File: macos\Flutter\GeneratedPluginRegistrant.swift
```swift
//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import flutter_blue_plus
import path_provider_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FlutterBluePlusPlugin.register(with: registry.registrar(forPlugin: "FlutterBluePlusPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
}

```

---
## File: macos\Flutter\ephemeral\Flutter-Generated.xcconfig
```xcconfig
// This is a generated file; do not edit or check into version control.
FLUTTER_ROOT=D:\Documents\CodesEnvironment\flutter
FLUTTER_APPLICATION_PATH=D:\Documents\Codes\2026_PhysTrigger-C3-BLE_v2
COCOAPODS_PARALLEL_CODE_SIGN=true
FLUTTER_BUILD_DIR=build
FLUTTER_BUILD_NAME=1.0.0
FLUTTER_BUILD_NUMBER=1
DART_OBFUSCATION=false
TRACK_WIDGET_CREATION=true
TREE_SHAKE_ICONS=false
PACKAGE_CONFIG=.dart_tool/package_config.json

```

---
## File: macos\Flutter\ephemeral\flutter_export_environment.sh
```sh
#!/bin/sh
# This is a generated file; do not edit or check into version control.
export "FLUTTER_ROOT=D:\Documents\CodesEnvironment\flutter"
export "FLUTTER_APPLICATION_PATH=D:\Documents\Codes\2026_PhysTrigger-C3-BLE_v2"
export "COCOAPODS_PARALLEL_CODE_SIGN=true"
export "FLUTTER_BUILD_DIR=build"
export "FLUTTER_BUILD_NAME=1.0.0"
export "FLUTTER_BUILD_NUMBER=1"
export "DART_OBFUSCATION=false"
export "TRACK_WIDGET_CREATION=true"
export "TREE_SHAKE_ICONS=false"
export "PACKAGE_CONFIG=.dart_tool/package_config.json"

```

---
## File: macos\Runner\DebugProfile.entitlements
```entitlements
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<!-- ============================================================ -->
	<!-- App Sandbox Entitlements for macOS                           -->
	<!-- Required for Bluetooth and network access                    -->
	<!-- ============================================================ -->
	
	<!-- Enable App Sandbox (required for Mac App Store) -->
	<key>com.apple.security.app-sandbox</key>
	<true/>
	
	<!-- ============================================================ -->
	<!-- BLUETOOTH ENTITLEMENT - CRITICAL!                            -->
	<!-- Without this, BLE operations will fail silently              -->
	<!-- ============================================================ -->
	<key>com.apple.security.device.bluetooth</key>
	<true/>
	
	<!-- Network access (if needed for future features) -->
	<key>com.apple.security.network.client</key>
	<true/>
	
</dict>
</plist>

```

---
## File: macos\Runner\Info.plist
```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<!-- ============================================================ -->
	<!-- Application Metadata                                         -->
	<!-- ============================================================ -->
	<key>CFBundleDevelopmentRegion</key>
	<string>$(DEVELOPMENT_LANGUAGE)</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIconFile</key>
	<string></string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$(PRODUCT_NAME)</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>$(FLUTTER_BUILD_NAME)</string>
	<key>CFBundleVersion</key>
	<string>$(FLUTTER_BUILD_NUMBER)</string>
	<key>LSMinimumSystemVersion</key>
	<string>$(MACOSX_DEPLOYMENT_TARGET)</string>
	<key>NSHumanReadableCopyright</key>
	<string>$(PRODUCT_COPYRIGHT)</string>
	<key>NSMainNibFile</key>
	<string>MainMenu</string>
	<key>NSPrincipalClass</key>
	<string>NSApplication</string>
	
	<!-- ============================================================ -->
	<!-- BLUETOOTH PERMISSIONS - CRITICAL FOR macOS!                 -->
	<!-- Without these keys, the app will CRASH on launch.           -->
	<!-- ============================================================ -->
	
	<!-- 
	┌─────────────────────────────────────────────────────────────────┐
	│ NSBluetoothAlwaysUsageDescription                               │
	│ Required for any Bluetooth access on macOS 10.15+               │
	│ User will see this message in the permission dialog             │
	└─────────────────────────────────────────────────────────────────┘
	-->
	<key>NSBluetoothAlwaysUsageDescription</key>
	<string>PhysTrigger needs Bluetooth access to connect to and control your ESP32 hardware device.</string>
	
	<!-- Also add peripheral usage description for completeness -->
	<key>NSBluetoothPeripheralUsageDescription</key>
	<string>PhysTrigger needs Bluetooth access to communicate with your BLE device.</string>
	
	<!-- ============================================================ -->
	<!-- App Sandbox Configuration                                    -->
	<!-- ============================================================ -->
	
	<!-- Enable Bluetooth hardware access -->
	<key>com.apple.security.device.bluetooth</key>
	<true/>
	
</dict>
</plist>

```

---
## File: macos\Runner\Release.entitlements
```entitlements
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<!-- ============================================================ -->
	<!-- App Sandbox Entitlements for macOS (Release)                 -->
	<!-- ============================================================ -->
	
	<key>com.apple.security.app-sandbox</key>
	<true/>
	
	<!-- BLUETOOTH ENTITLEMENT -->
	<key>com.apple.security.device.bluetooth</key>
	<true/>
	
	<key>com.apple.security.network.client</key>
	<true/>
	
</dict>
</plist>

```

---
## File: sketch_jan3a\sketch_jan3a.ino
```ino
#include <NimBLEDevice.h>
#include <ESP32Servo.h>

Servo myServo;
const int servoPin = 2; // 匹配你之前的物理接线：GPIO 2

class MyCallbacks : public NimBLECharacteristicCallbacks {
    void onWrite(NimBLECharacteristic* pCharacteristic) {
        std::string value = pCharacteristic->getValue();
        if (value.length() > 0) {
            uint8_t cmd = (uint8_t)value[0];
            if (cmd == 0x01) {
                myServo.write(90); // 按钮按下，舵机旋转 90°
                Serial.println(">>> App Pressed: Moving to 90");
            } else if (cmd == 0x00) {
                myServo.write(0);  // 按钮松开，舵机回弹到 0°
                Serial.println(">>> App Released: Resetting to 0");
            }
        }
    }
};

void setup() {
    Serial.begin(115200);
    delay(1000);
    Serial.println(">>> [STEP 1] System Rebooting...");
    
    myServo.attach(servoPin); // 初始化舵机
    myServo.write(0);

    // 初始化蓝牙
    NimBLEDevice::init("PhysTrigger_Device"); // 蓝牙名，Flutter App 会扫描这个名字
    Serial.println(">>> [STEP 3] Attempting BLE Init...");
    
    NimBLEServer* pServer = NimBLEDevice::createServer();
    
    // Use full 128-bit UUID matching Flutter app
    NimBLEService* pService = pServer->createService("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
    NimBLECharacteristic* pChar = pService->createCharacteristic(
        "beb5483e-36e1-4688-b7f5-ea07361b26a8", 
        NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_NR
    ); 
    pChar->setCallbacks(new MyCallbacks());
    pService->start();
    
    // --- 关键修复：强制广播身份 ---
    NimBLEAdvertising* pAdvertising = NimBLEDevice::getAdvertising();
    pAdvertising->addServiceUUID("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
    // 强制把名字塞进广播主包
    pAdvertising->setName("PhysTrigger_Device"); 
    pAdvertising->setScanResponse(true); // 开启响应
    pAdvertising->start();
    
    Serial.println(">>> [STEP 5] ALL SYSTEMS GO! Force Advertising Started!");
}

void loop() { delay(10); }
```

---
## File: test\widget_test.dart
```dart
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:phys_trigger_ble/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

```

---
## File: windows\.gitignore
```text
flutter/ephemeral/

# Visual Studio user-specific files.
*.suo
*.user
*.userosscache
*.sln.docstates

# Visual Studio build-related files.
x64/
x86/

# Visual Studio cache files
# files ending in .cache can be ignored
*.[Cc]ache
# but keep track of directories ending in .cache
!*.[Cc]ache/

```

---
## File: windows\CMakeLists.txt
```txt
# Project-level configuration.
cmake_minimum_required(VERSION 3.14)
project(phys_trigger_ble LANGUAGES CXX)

# The name of the executable created for the application. Change this to change
# the on-disk name of your application.
set(BINARY_NAME "phys_trigger_ble")

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent
# versions of CMake.
cmake_policy(VERSION 3.14...3.25)

# Define build configuration option.
get_property(IS_MULTICONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(IS_MULTICONFIG)
  set(CMAKE_CONFIGURATION_TYPES "Debug;Profile;Release"
    CACHE STRING "" FORCE)
else()
  if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE "Debug" CACHE
      STRING "Flutter build mode" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
      "Debug" "Profile" "Release")
  endif()
endif()
# Define settings for the Profile build mode.
set(CMAKE_EXE_LINKER_FLAGS_PROFILE "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
set(CMAKE_C_FLAGS_PROFILE "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_RELEASE}")

# Use Unicode for all projects.
add_definitions(-DUNICODE -D_UNICODE)

# Compilation settings that should be applied to most targets.
#
# Be cautious about adding new options here, as plugins use this function by
# default. In most cases, you should add new options to specific targets instead
# of modifying this function.
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_17)
  target_compile_options(${TARGET} PRIVATE /W4 /WX /wd"4100")
  target_compile_options(${TARGET} PRIVATE /EHsc)
  target_compile_definitions(${TARGET} PRIVATE "_HAS_EXCEPTIONS=0")
  target_compile_definitions(${TARGET} PRIVATE "$<$<CONFIG:Debug>:_DEBUG>")
endfunction()

# Flutter library and tool build rules.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

# Application build; see runner/CMakeLists.txt.
add_subdirectory("runner")


# Generated plugin build rules, which manage building the plugins and adding
# them to the application.
include(flutter/generated_plugins.cmake)


# === Installation ===
# Support files are copied into place next to the executable, so that it can
# run in place. This is done instead of making a separate bundle (as on Linux)
# so that building and running from within Visual Studio will work.
set(BUILD_BUNDLE_DIR "$<TARGET_FILE_DIR:${BINARY_NAME}>")
# Make the "install" step default, as it's required to run.
set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD 1)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${BUILD_BUNDLE_DIR}" CACHE PATH "..." FORCE)
endif()

set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")

install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
  COMPONENT Runtime)

if(PLUGIN_BUNDLED_LIBRARIES)
  install(FILES "${PLUGIN_BUNDLED_LIBRARIES}"
    DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endif()

# Copy the native assets provided by the build.dart from all packages.
set(NATIVE_ASSETS_DIR "${PROJECT_BUILD_DIR}native_assets/windows/")
install(DIRECTORY "${NATIVE_ASSETS_DIR}"
   DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
   COMPONENT Runtime)

# Fully re-copy the assets directory on each build to avoid having stale files
# from a previous install.
set(FLUTTER_ASSET_DIR_NAME "flutter_assets")
install(CODE "
  file(REMOVE_RECURSE \"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
  " COMPONENT Runtime)
install(DIRECTORY "${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
  DESTINATION "${INSTALL_BUNDLE_DATA_DIR}" COMPONENT Runtime)

# Install the AOT library on non-Debug builds only.
install(FILES "${AOT_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  CONFIGURATIONS Profile;Release
  COMPONENT Runtime)

```

---
## File: windows\flutter\CMakeLists.txt
```txt
# This file controls Flutter-level build steps. It should not be edited.
cmake_minimum_required(VERSION 3.14)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter tool.
include(${EPHEMERAL_DIR}/generated_config.cmake)

# TODO: Move the rest of this into files in ephemeral. See
# https://github.com/flutter/flutter/issues/57146.
set(WRAPPER_ROOT "${EPHEMERAL_DIR}/cpp_client_wrapper")

# Set fallback configurations for older versions of the flutter tool.
if (NOT DEFINED FLUTTER_TARGET_PLATFORM)
  set(FLUTTER_TARGET_PLATFORM "windows-x64")
endif()

# === Flutter Library ===
set(FLUTTER_LIBRARY "${EPHEMERAL_DIR}/flutter_windows.dll")

# Published to parent scope for install step.
set(FLUTTER_LIBRARY ${FLUTTER_LIBRARY} PARENT_SCOPE)
set(FLUTTER_ICU_DATA_FILE "${EPHEMERAL_DIR}/icudtl.dat" PARENT_SCOPE)
set(PROJECT_BUILD_DIR "${PROJECT_DIR}/build/" PARENT_SCOPE)
set(AOT_LIBRARY "${PROJECT_DIR}/build/windows/app.so" PARENT_SCOPE)

list(APPEND FLUTTER_LIBRARY_HEADERS
  "flutter_export.h"
  "flutter_windows.h"
  "flutter_messenger.h"
  "flutter_plugin_registrar.h"
  "flutter_texture_registrar.h"
)
list(TRANSFORM FLUTTER_LIBRARY_HEADERS PREPEND "${EPHEMERAL_DIR}/")
add_library(flutter INTERFACE)
target_include_directories(flutter INTERFACE
  "${EPHEMERAL_DIR}"
)
target_link_libraries(flutter INTERFACE "${FLUTTER_LIBRARY}.lib")
add_dependencies(flutter flutter_assemble)

# === Wrapper ===
list(APPEND CPP_WRAPPER_SOURCES_CORE
  "core_implementations.cc"
  "standard_codec.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_CORE PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_PLUGIN
  "plugin_registrar.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_PLUGIN PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_APP
  "flutter_engine.cc"
  "flutter_view_controller.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_APP PREPEND "${WRAPPER_ROOT}/")

# Wrapper sources needed for a plugin.
add_library(flutter_wrapper_plugin STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
)
apply_standard_settings(flutter_wrapper_plugin)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  POSITION_INDEPENDENT_CODE ON)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_link_libraries(flutter_wrapper_plugin PUBLIC flutter)
target_include_directories(flutter_wrapper_plugin PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_plugin flutter_assemble)

# Wrapper sources needed for the runner.
add_library(flutter_wrapper_app STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_APP}
)
apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_app PUBLIC flutter)
target_include_directories(flutter_wrapper_app PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_app flutter_assemble)

# === Flutter tool backend ===
# _phony_ is a non-existent file to force this command to run every time,
# since currently there's no way to get a full input/output list from the
# flutter tool.
set(PHONY_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/_phony_")
set_source_files_properties("${PHONY_OUTPUT}" PROPERTIES SYMBOLIC TRUE)
add_custom_command(
  OUTPUT ${FLUTTER_LIBRARY} ${FLUTTER_LIBRARY_HEADERS}
    ${CPP_WRAPPER_SOURCES_CORE} ${CPP_WRAPPER_SOURCES_PLUGIN}
    ${CPP_WRAPPER_SOURCES_APP}
    ${PHONY_OUTPUT}
  COMMAND ${CMAKE_COMMAND} -E env
    ${FLUTTER_TOOL_ENVIRONMENT}
    "${FLUTTER_ROOT}/packages/flutter_tools/bin/tool_backend.bat"
      ${FLUTTER_TARGET_PLATFORM} $<CONFIG>
  VERBATIM
)
add_custom_target(flutter_assemble DEPENDS
  "${FLUTTER_LIBRARY}"
  ${FLUTTER_LIBRARY_HEADERS}
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
  ${CPP_WRAPPER_SOURCES_APP}
)

```

---
## File: windows\flutter\generated_plugin_registrant.cc
```cc
//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <permission_handler_windows/permission_handler_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
}

```

---
## File: windows\flutter\generated_plugin_registrant.h
```h
//
//  Generated file. Do not edit.
//

// clang-format off

#ifndef GENERATED_PLUGIN_REGISTRANT_
#define GENERATED_PLUGIN_REGISTRANT_

#include <flutter/plugin_registry.h>

// Registers Flutter plugins.
void RegisterPlugins(flutter::PluginRegistry* registry);

#endif  // GENERATED_PLUGIN_REGISTRANT_

```

---
## File: windows\flutter\generated_plugins.cmake
```cmake
#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  permission_handler_windows
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/windows plugins/${ffi_plugin})
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)

```

---
## File: windows\flutter\ephemeral\flutter_export.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_EXPORT_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_EXPORT_H_

#ifdef FLUTTER_DESKTOP_LIBRARY

// Add visibility/export annotations when building the library.
#ifdef _WIN32
#define FLUTTER_EXPORT __declspec(dllexport)
#else
#define FLUTTER_EXPORT __attribute__((visibility("default")))
#endif

#else  // FLUTTER_DESKTOP_LIBRARY

// Add import annotations when consuming the library.
#ifdef _WIN32
#define FLUTTER_EXPORT __declspec(dllimport)
#else
#define FLUTTER_EXPORT
#endif

#endif  // FLUTTER_DESKTOP_LIBRARY

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_EXPORT_H_

```

---
## File: windows\flutter\ephemeral\flutter_messenger.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_MESSENGER_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_MESSENGER_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "flutter_export.h"

#if defined(__cplusplus)
extern "C" {
#endif  // defined(__cplusplus)

// Opaque reference to a Flutter engine messenger.
typedef struct FlutterDesktopMessenger* FlutterDesktopMessengerRef;

// Opaque handle for tracking responses to messages.
typedef struct _FlutterPlatformMessageResponseHandle
    FlutterDesktopMessageResponseHandle;

// The callback expected as a response of a binary message.
typedef void (*FlutterDesktopBinaryReply)(const uint8_t* data,
                                          size_t data_size,
                                          void* user_data);

// A message received from Flutter.
typedef struct {
  // Size of this struct as created by Flutter.
  size_t struct_size;
  // The name of the channel used for this message.
  const char* channel;
  // The raw message data.
  const uint8_t* message;
  // The length of |message|.
  size_t message_size;
  // The response handle. If non-null, the receiver of this message must call
  // FlutterDesktopSendMessageResponse exactly once with this handle.
  const FlutterDesktopMessageResponseHandle* response_handle;
} FlutterDesktopMessage;

// Function pointer type for message handler callback registration.
//
// The user data will be whatever was passed to FlutterDesktopSetMessageHandler
// for the channel the message is received on.
typedef void (*FlutterDesktopMessageCallback)(
    FlutterDesktopMessengerRef /* messenger */,
    const FlutterDesktopMessage* /* message*/,
    void* /* user data */);

// Sends a binary message to the Flutter side on the specified channel.
FLUTTER_EXPORT bool FlutterDesktopMessengerSend(
    FlutterDesktopMessengerRef messenger,
    const char* channel,
    const uint8_t* message,
    const size_t message_size);

// Sends a binary message to the Flutter side on the specified channel.
// The |reply| callback will be executed when a response is received.
FLUTTER_EXPORT bool FlutterDesktopMessengerSendWithReply(
    FlutterDesktopMessengerRef messenger,
    const char* channel,
    const uint8_t* message,
    const size_t message_size,
    const FlutterDesktopBinaryReply reply,
    void* user_data);

// Sends a reply to a FlutterDesktopMessage for the given response handle.
//
// Once this has been called, |handle| is invalid and must not be used again.
FLUTTER_EXPORT void FlutterDesktopMessengerSendResponse(
    FlutterDesktopMessengerRef messenger,
    const FlutterDesktopMessageResponseHandle* handle,
    const uint8_t* data,
    size_t data_length);

// Registers a callback function for incoming binary messages from the Flutter
// side on the specified channel.
//
// Replaces any existing callback. Provide a null handler to unregister the
// existing callback.
//
// If |user_data| is provided, it will be passed in |callback| calls.
FLUTTER_EXPORT void FlutterDesktopMessengerSetCallback(
    FlutterDesktopMessengerRef messenger,
    const char* channel,
    FlutterDesktopMessageCallback callback,
    void* user_data);

// Increments the reference count for the |messenger|.
//
// Operation is thread-safe.
//
// See also: |FlutterDesktopMessengerRelease|
FLUTTER_EXPORT FlutterDesktopMessengerRef
FlutterDesktopMessengerAddRef(FlutterDesktopMessengerRef messenger);

// Decrements the reference count for the |messenger|.
//
// Operation is thread-safe.
//
// See also: |FlutterDesktopMessengerAddRef|
FLUTTER_EXPORT void FlutterDesktopMessengerRelease(
    FlutterDesktopMessengerRef messenger);

// Returns `true` if the |FlutterDesktopMessengerRef| still references a running
// engine.
//
// This check should be made inside of a |FlutterDesktopMessengerLock| and
// before any other calls are made to the FlutterDesktopMessengerRef when using
// it from a thread other than the platform thread.
FLUTTER_EXPORT bool FlutterDesktopMessengerIsAvailable(
    FlutterDesktopMessengerRef messenger);

// Locks the `FlutterDesktopMessengerRef` ensuring that
// |FlutterDesktopMessengerIsAvailable| does not change while locked.
//
// All calls to the FlutterDesktopMessengerRef from threads other than the
// platform thread should happen inside of a lock.
//
// Operation is thread-safe.
//
// Returns the |messenger| value.
//
// See also: |FlutterDesktopMessengerUnlock|
FLUTTER_EXPORT FlutterDesktopMessengerRef
FlutterDesktopMessengerLock(FlutterDesktopMessengerRef messenger);

// Unlocks the `FlutterDesktopMessengerRef`.
//
// Operation is thread-safe.
//
// See also: |FlutterDesktopMessengerLock|
FLUTTER_EXPORT void FlutterDesktopMessengerUnlock(
    FlutterDesktopMessengerRef messenger);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_MESSENGER_H_

```

---
## File: windows\flutter\ephemeral\flutter_plugin_registrar.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_PLUGIN_REGISTRAR_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_PLUGIN_REGISTRAR_H_

#include <stddef.h>
#include <stdint.h>

#include "flutter_export.h"
#include "flutter_messenger.h"
#include "flutter_texture_registrar.h"

#if defined(__cplusplus)
extern "C" {
#endif  // defined(__cplusplus)

// Opaque reference to a plugin registrar.
typedef struct FlutterDesktopPluginRegistrar* FlutterDesktopPluginRegistrarRef;

// Function pointer type for registrar destruction callback.
typedef void (*FlutterDesktopOnPluginRegistrarDestroyed)(
    FlutterDesktopPluginRegistrarRef);

// Returns the engine messenger associated with this registrar.
FLUTTER_EXPORT FlutterDesktopMessengerRef
FlutterDesktopPluginRegistrarGetMessenger(
    FlutterDesktopPluginRegistrarRef registrar);

// Returns the texture registrar associated with this registrar.
FLUTTER_EXPORT FlutterDesktopTextureRegistrarRef
FlutterDesktopRegistrarGetTextureRegistrar(
    FlutterDesktopPluginRegistrarRef registrar);

// Registers a callback to be called when the plugin registrar is destroyed.
FLUTTER_EXPORT void FlutterDesktopPluginRegistrarSetDestructionHandler(
    FlutterDesktopPluginRegistrarRef registrar,
    FlutterDesktopOnPluginRegistrarDestroyed callback);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_PLUGIN_REGISTRAR_H_

```

---
## File: windows\flutter\ephemeral\flutter_texture_registrar.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_TEXTURE_REGISTRAR_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_TEXTURE_REGISTRAR_H_

#include <stddef.h>
#include <stdint.h>

#include "flutter_export.h"

#if defined(__cplusplus)
extern "C" {
#endif

struct FlutterDesktopTextureRegistrar;
// Opaque reference to a texture registrar.
typedef struct FlutterDesktopTextureRegistrar*
    FlutterDesktopTextureRegistrarRef;

// Possible values for the type specified in FlutterDesktopTextureInfo.
// Additional types may be added in the future.
typedef enum {
  // A Pixel buffer-based texture.
  kFlutterDesktopPixelBufferTexture,
  // A platform-specific GPU surface-backed texture.
  kFlutterDesktopGpuSurfaceTexture
} FlutterDesktopTextureType;

// Supported GPU surface types.
typedef enum {
  // Uninitialized.
  kFlutterDesktopGpuSurfaceTypeNone,
  // A DXGI shared texture handle (Windows only).
  // See
  // https://docs.microsoft.com/en-us/windows/win32/api/dxgi/nf-dxgi-idxgiresource-getsharedhandle
  kFlutterDesktopGpuSurfaceTypeDxgiSharedHandle,
  // A |ID3D11Texture2D| (Windows only).
  kFlutterDesktopGpuSurfaceTypeD3d11Texture2D
} FlutterDesktopGpuSurfaceType;

// Supported pixel formats.
typedef enum {
  // Uninitialized.
  kFlutterDesktopPixelFormatNone,
  // Represents a 32-bit RGBA color format with 8 bits each for red, green, blue
  // and alpha.
  kFlutterDesktopPixelFormatRGBA8888,
  // Represents a 32-bit BGRA color format with 8 bits each for blue, green, red
  // and alpha.
  kFlutterDesktopPixelFormatBGRA8888
} FlutterDesktopPixelFormat;

// An image buffer object.
typedef struct {
  // The pixel data buffer.
  const uint8_t* buffer;
  // Width of the pixel buffer.
  size_t width;
  // Height of the pixel buffer.
  size_t height;
  // An optional callback that gets invoked when the |buffer| can be released.
  void (*release_callback)(void* release_context);
  // Opaque data passed to |release_callback|.
  void* release_context;
} FlutterDesktopPixelBuffer;

// A GPU surface descriptor.
typedef struct {
  // The size of this struct. Must be
  // sizeof(FlutterDesktopGpuSurfaceDescriptor).
  size_t struct_size;
  // The surface handle. The expected type depends on the
  // |FlutterDesktopGpuSurfaceType|.
  //
  // Provide a |ID3D11Texture2D*| when using
  // |kFlutterDesktopGpuSurfaceTypeD3d11Texture2D| or a |HANDLE| when using
  // |kFlutterDesktopGpuSurfaceTypeDxgiSharedHandle|.
  //
  // The referenced resource needs to stay valid until it has been opened by
  // Flutter. Consider incrementing the resource's reference count in the
  // |FlutterDesktopGpuSurfaceTextureCallback| and registering a
  // |release_callback| for decrementing the reference count once it has been
  // opened.
  void* handle;
  // The physical width.
  size_t width;
  // The physical height.
  size_t height;
  // The visible width.
  // It might be less or equal to the physical |width|.
  size_t visible_width;
  // The visible height.
  // It might be less or equal to the physical |height|.
  size_t visible_height;
  // The pixel format which might be optional depending on the surface type.
  FlutterDesktopPixelFormat format;
  // An optional callback that gets invoked when the |handle| has been opened.
  void (*release_callback)(void* release_context);
  // Opaque data passed to |release_callback|.
  void* release_context;
} FlutterDesktopGpuSurfaceDescriptor;

// The pixel buffer copy callback definition provided to
// the Flutter engine to copy the texture.
// It is invoked with the intended surface size specified by |width| and
// |height| and the |user_data| held by
// |FlutterDesktopPixelBufferTextureConfig|.
//
// As this is usually called from the render thread, the callee must take
// care of proper synchronization. It also needs to be ensured that the
// returned |FlutterDesktopPixelBuffer| isn't released prior to unregistering
// the corresponding texture.
typedef const FlutterDesktopPixelBuffer* (
    *FlutterDesktopPixelBufferTextureCallback)(size_t width,
                                               size_t height,
                                               void* user_data);

// The GPU surface callback definition provided to the Flutter engine to obtain
// the surface. It is invoked with the intended surface size specified by
// |width| and |height| and the |user_data| held by
// |FlutterDesktopGpuSurfaceTextureConfig|.
typedef const FlutterDesktopGpuSurfaceDescriptor* (
    *FlutterDesktopGpuSurfaceTextureCallback)(size_t width,
                                              size_t height,
                                              void* user_data);

// An object used to configure pixel buffer textures.
typedef struct {
  // The callback used by the engine to copy the pixel buffer object.
  FlutterDesktopPixelBufferTextureCallback callback;
  // Opaque data that will get passed to the provided |callback|.
  void* user_data;
} FlutterDesktopPixelBufferTextureConfig;

// An object used to configure GPU-surface textures.
typedef struct {
  // The size of this struct. Must be
  // sizeof(FlutterDesktopGpuSurfaceTextureConfig).
  size_t struct_size;
  // The concrete surface type (e.g.
  // |kFlutterDesktopGpuSurfaceTypeDxgiSharedHandle|)
  FlutterDesktopGpuSurfaceType type;
  // The callback used by the engine to obtain the surface descriptor.
  FlutterDesktopGpuSurfaceTextureCallback callback;
  // Opaque data that will get passed to the provided |callback|.
  void* user_data;
} FlutterDesktopGpuSurfaceTextureConfig;

typedef struct {
  FlutterDesktopTextureType type;
  union {
    FlutterDesktopPixelBufferTextureConfig pixel_buffer_config;
    FlutterDesktopGpuSurfaceTextureConfig gpu_surface_config;
  };
} FlutterDesktopTextureInfo;

// Registers a new texture with the Flutter engine and returns the texture ID.
// This function can be called from any thread.
FLUTTER_EXPORT int64_t FlutterDesktopTextureRegistrarRegisterExternalTexture(
    FlutterDesktopTextureRegistrarRef texture_registrar,
    const FlutterDesktopTextureInfo* info);

// Asynchronously unregisters the texture identified by |texture_id| from the
// Flutter engine.
// An optional |callback| gets invoked upon completion.
// This function can be called from any thread.
FLUTTER_EXPORT void FlutterDesktopTextureRegistrarUnregisterExternalTexture(
    FlutterDesktopTextureRegistrarRef texture_registrar,
    int64_t texture_id,
    void (*callback)(void* user_data),
    void* user_data);

// Marks that a new texture frame is available for a given |texture_id|.
// Returns true on success or false if the specified texture doesn't exist.
// This function can be called from any thread.
FLUTTER_EXPORT bool
FlutterDesktopTextureRegistrarMarkExternalTextureFrameAvailable(
    FlutterDesktopTextureRegistrarRef texture_registrar,
    int64_t texture_id);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_PUBLIC_FLUTTER_TEXTURE_REGISTRAR_H_

```

---
## File: windows\flutter\ephemeral\flutter_windows.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_PUBLIC_FLUTTER_WINDOWS_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_PUBLIC_FLUTTER_WINDOWS_H_

#include <dxgi.h>
#include <stddef.h>
#include <stdint.h>
#include <windows.h>

#include "flutter_export.h"
#include "flutter_messenger.h"
#include "flutter_plugin_registrar.h"

#if defined(__cplusplus)
extern "C" {
#endif

typedef void (*VoidCallback)(void* /* user data */);

// Opaque reference to a Flutter view controller.
struct FlutterDesktopViewController;
typedef struct FlutterDesktopViewController* FlutterDesktopViewControllerRef;

// Opaque reference to a Flutter window.
struct FlutterDesktopView;
typedef struct FlutterDesktopView* FlutterDesktopViewRef;

// Opaque reference to a Flutter engine instance.
struct FlutterDesktopEngine;
typedef struct FlutterDesktopEngine* FlutterDesktopEngineRef;

// The unique identifier for a view.
typedef int64_t FlutterDesktopViewId;

// Configures how the Flutter engine selects a GPU.
typedef enum {
  // No preference.
  NoPreference,
  // Prefer energy efficiency over performance, such as an integrated GPU.
  // This falls back to a high performance GPU if no low power GPU is
  // available.
  LowPowerPreference,
} FlutterDesktopGpuPreference;

// Configures the thread policy for running the UI isolate.
typedef enum {
  // Default value. Currently will run the UI isolate on separate thread,
  // later will be changed to running the UI isolate on platform thread.
  Default,
  // Run the UI isolate on platform thread.
  RunOnPlatformThread,
  // Run the UI isolate on a separate thread.
  RunOnSeparateThread,
} FlutterDesktopUIThreadPolicy;

// Properties for configuring a Flutter engine instance.
typedef struct {
  // The path to the flutter_assets folder for the application to be run.
  // This can either be an absolute path or a path relative to the directory
  // containing the executable.
  const wchar_t* assets_path;

  // The path to the icudtl.dat file for the version of Flutter you are using.
  // This can either be an absolute path or a path relative to the directory
  // containing the executable.
  const wchar_t* icu_data_path;

  // The path to the AOT library file for your application, if any.
  // This can either be an absolute path or a path relative to the directory
  // containing the executable. This can be nullptr for a non-AOT build, as
  // it will be ignored in that case.
  const wchar_t* aot_library_path;

  // The name of the top-level Dart entrypoint function. If null or the empty
  // string, 'main' is assumed. If a custom entrypoint is used, this parameter
  // must specifiy the name of a top-level function in the same Dart library as
  // the app's main() function. Custom entrypoint functions must be decorated
  // with `@pragma('vm:entry-point')` to ensure the method is not tree-shaken
  // by the Dart compiler.
  const char* dart_entrypoint;

  // Number of elements in the array passed in as dart_entrypoint_argv.
  int dart_entrypoint_argc;

  // Array of Dart entrypoint arguments. This is deep copied during the call
  // to FlutterDesktopEngineCreate.
  const char** dart_entrypoint_argv;

  // GPU choice preference
  FlutterDesktopGpuPreference gpu_preference;

  // Policy for the thread that runs UI isolate.
  FlutterDesktopUIThreadPolicy ui_thread_policy;
} FlutterDesktopEngineProperties;

// ========== View Controller ==========

// Creates a view that hosts and displays the given engine instance.
//
// This takes ownership of |engine|, so FlutterDesktopEngineDestroy should no
// longer be called on it, as it will be called internally when the view
// controller is destroyed. If creating the view controller fails, the engine
// will be destroyed immediately.
//
// If |engine| is not already running, the view controller will start running
// it automatically before displaying the window.
//
// The caller owns the returned reference, and is responsible for calling
// FlutterDesktopViewControllerDestroy. Returns a null pointer in the event of
// an error.
//
// The Win32 implementation accepts width, height with view hookup explicitly
// performed using the caller using HWND parenting.
FLUTTER_EXPORT FlutterDesktopViewControllerRef
FlutterDesktopViewControllerCreate(int width,
                                   int height,
                                   FlutterDesktopEngineRef engine);

// Shuts down the engine instance associated with |controller|, and cleans up
// associated state.
//
// |controller| is no longer valid after this call.
FLUTTER_EXPORT void FlutterDesktopViewControllerDestroy(
    FlutterDesktopViewControllerRef controller);

// Returns the view controller's view ID.
FLUTTER_EXPORT FlutterDesktopViewId FlutterDesktopViewControllerGetViewId(
    FlutterDesktopViewControllerRef view_controller);

// Returns the handle for the engine running in FlutterDesktopViewControllerRef.
//
// Its lifetime is the same as the |controller|'s.
FLUTTER_EXPORT FlutterDesktopEngineRef FlutterDesktopViewControllerGetEngine(
    FlutterDesktopViewControllerRef controller);

// Returns the view managed by the given controller.
FLUTTER_EXPORT FlutterDesktopViewRef
FlutterDesktopViewControllerGetView(FlutterDesktopViewControllerRef controller);

// Requests new frame from the engine and repaints the view.
FLUTTER_EXPORT void FlutterDesktopViewControllerForceRedraw(
    FlutterDesktopViewControllerRef controller);

// Allows the Flutter engine and any interested plugins an opportunity to
// handle the given message.
//
// If the WindowProc was handled and further handling should stop, this returns
// true and |result| will be populated. |result| is not set if returning false.
FLUTTER_EXPORT bool FlutterDesktopViewControllerHandleTopLevelWindowProc(
    FlutterDesktopViewControllerRef controller,
    HWND hwnd,
    UINT message,
    WPARAM wparam,
    LPARAM lparam,
    LRESULT* result);

// ========== Engine ==========

// Creates a Flutter engine with the given properties.
//
// The caller owns the returned reference, and is responsible for calling
// FlutterDesktopEngineDestroy. The lifetime of |engine_properties| is required
// to extend only until the end of this call.
FLUTTER_EXPORT FlutterDesktopEngineRef FlutterDesktopEngineCreate(
    const FlutterDesktopEngineProperties* engine_properties);

// Shuts down and destroys the given engine instance. Returns true if the
// shutdown was successful, or if the engine was not running.
//
// |engine| is no longer valid after this call.
FLUTTER_EXPORT bool FlutterDesktopEngineDestroy(FlutterDesktopEngineRef engine);

// Starts running the given engine instance.
//
// The entry_point parameter is deprecated but preserved for
// backward-compatibility. If desired, a custom Dart entrypoint function can be
// set in the dart_entrypoint field of the FlutterDesktopEngineProperties
// struct passed to FlutterDesktopEngineCreate.
//
// If specified, entry_point must be the name of a top-level function from the
// same Dart library that contains the app's main() function, and must be
// decorated with `@pragma(vm:entry-point)` to ensure the method is not
// tree-shaken by the Dart compiler. If conflicting non-null values are passed
// to this function and via the FlutterDesktopEngineProperties struct, the run
// will fail.
//
// Returns false if running the engine failed.
FLUTTER_EXPORT bool FlutterDesktopEngineRun(FlutterDesktopEngineRef engine,
                                            const char* entry_point);

// DEPRECATED: This is no longer necessary to call, Flutter will take care of
// processing engine messages transparently through DispatchMessage.
//
// Processes any pending events in the Flutter engine, and returns the
// number of nanoseconds until the next scheduled event (or max, if none).
//
// This should be called on every run of the application-level runloop, and
// a wait for native events in the runloop should never be longer than the
// last return value from this function.
FLUTTER_EXPORT uint64_t
FlutterDesktopEngineProcessMessages(FlutterDesktopEngineRef engine);

FLUTTER_EXPORT void FlutterDesktopEngineReloadSystemFonts(
    FlutterDesktopEngineRef engine);

// Returns the plugin registrar handle for the plugin with the given name.
//
// The name must be unique across the application.
FLUTTER_EXPORT FlutterDesktopPluginRegistrarRef
FlutterDesktopEngineGetPluginRegistrar(FlutterDesktopEngineRef engine,
                                       const char* plugin_name);

// Returns the messenger associated with the engine.
//
// This does not provide an owning reference, so should *not* be balanced with a
// call to |FlutterDesktopMessengerRelease|.
//
// Callers should use |FlutterDesktopMessengerAddRef| if the returned pointer
// will potentially outlive 'engine', such as when passing it to another thread.
FLUTTER_EXPORT FlutterDesktopMessengerRef
FlutterDesktopEngineGetMessenger(FlutterDesktopEngineRef engine);

// Returns the texture registrar associated with the engine.
FLUTTER_EXPORT FlutterDesktopTextureRegistrarRef
FlutterDesktopEngineGetTextureRegistrar(FlutterDesktopEngineRef engine);

// Schedule a callback to be called after the next frame is drawn.
//
// This must be called from the platform thread. The callback is executed only
// once on the platform thread.
FLUTTER_EXPORT void FlutterDesktopEngineSetNextFrameCallback(
    FlutterDesktopEngineRef engine,
    VoidCallback callback,
    void* user_data);

// ========== View ==========

// Returns the backing HWND for manipulation in host application.
FLUTTER_EXPORT HWND FlutterDesktopViewGetHWND(FlutterDesktopViewRef view);

// Returns the DXGI adapter used for rendering or nullptr in case of error.
FLUTTER_EXPORT IDXGIAdapter* FlutterDesktopViewGetGraphicsAdapter(
    FlutterDesktopViewRef view);

// Called to pass an external window message to the engine for lifecycle
// state updates. Non-Flutter windows must call this method in their WndProc
// in order to be included in the logic for application lifecycle state
// updates. Returns a result if the message should be consumed.
FLUTTER_EXPORT bool FlutterDesktopEngineProcessExternalWindowMessage(
    FlutterDesktopEngineRef engine,
    HWND hwnd,
    UINT message,
    WPARAM wparam,
    LPARAM lparam,
    LRESULT* result);

// ========== Plugin Registrar (extensions) ==========
// These are Windows-specific extensions to flutter_plugin_registrar.h

// Function pointer type for top level WindowProc delegate registration.
//
// The user data will be whatever was passed to
// FlutterDesktopRegisterTopLevelWindowProcHandler.
//
// Implementations should populate |result| and return true if the WindowProc
// was handled and further handling should stop. |result| is ignored if the
// function returns false.
typedef bool (*FlutterDesktopWindowProcCallback)(HWND /* hwnd */,
                                                 UINT /* uMsg */,
                                                 WPARAM /*wParam*/,
                                                 LPARAM /* lParam*/,
                                                 void* /* user data */,
                                                 LRESULT* result);

// Returns the implicit view associated with this registrar's engine instance,
// or null if there is no implicit view.
//
// See:
// https://api.flutter.dev/flutter/dart-ui/PlatformDispatcher/implicitView.html
//
// DEPRECATED: Use |FlutterDesktopPluginRegistrarGetViewById| instead.
FLUTTER_EXPORT FlutterDesktopViewRef FlutterDesktopPluginRegistrarGetView(
    FlutterDesktopPluginRegistrarRef registrar);

// Returns the view associated with the registrar's engine instance, or null if
// the view does not exist.
FLUTTER_EXPORT FlutterDesktopViewRef FlutterDesktopPluginRegistrarGetViewById(
    FlutterDesktopPluginRegistrarRef registrar,
    FlutterDesktopViewId view_id);

FLUTTER_EXPORT void
FlutterDesktopPluginRegistrarRegisterTopLevelWindowProcDelegate(
    FlutterDesktopPluginRegistrarRef registrar,
    FlutterDesktopWindowProcCallback delegate,
    void* user_data);

FLUTTER_EXPORT void
FlutterDesktopPluginRegistrarUnregisterTopLevelWindowProcDelegate(
    FlutterDesktopPluginRegistrarRef registrar,
    FlutterDesktopWindowProcCallback delegate);

// ========== Freestanding Utilities ==========

// Gets the DPI for a given |hwnd|, depending on the supported APIs per
// windows version and DPI awareness mode. If nullptr is passed, returns the DPI
// of the primary monitor.
//
// This uses the same logic and fallback for older Windows versions that is used
// internally by Flutter to determine the DPI to use for displaying Flutter
// content, so should be used by any code (e.g., in plugins) that translates
// between Windows and Dart sizes/offsets.
FLUTTER_EXPORT UINT FlutterDesktopGetDpiForHWND(HWND hwnd);

// Gets the DPI for a given |monitor|. If the API is not available, a default
// DPI of 96 is returned.
//
// See FlutterDesktopGetDpiForHWND for more information.
FLUTTER_EXPORT UINT FlutterDesktopGetDpiForMonitor(HMONITOR monitor);

// Reopens stdout and stderr and resysncs the standard library output streams.
// Should be called if output is being directed somewhere in the runner process
// (e.g., after an AllocConsole call).
FLUTTER_EXPORT void FlutterDesktopResyncOutputStreams();

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_PUBLIC_FLUTTER_WINDOWS_H_

```

---
## File: windows\flutter\ephemeral\generated_config.cmake
```cmake
# Generated code do not commit.
file(TO_CMAKE_PATH "D:\\Documents\\CodesEnvironment\\flutter" FLUTTER_ROOT)
file(TO_CMAKE_PATH "D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2" PROJECT_DIR)

set(FLUTTER_VERSION "1.0.0+1" PARENT_SCOPE)
set(FLUTTER_VERSION_MAJOR 1 PARENT_SCOPE)
set(FLUTTER_VERSION_MINOR 0 PARENT_SCOPE)
set(FLUTTER_VERSION_PATCH 0 PARENT_SCOPE)
set(FLUTTER_VERSION_BUILD 1 PARENT_SCOPE)

# Environment variables to pass to tool_backend.sh
list(APPEND FLUTTER_TOOL_ENVIRONMENT
  "FLUTTER_ROOT=D:\\Documents\\CodesEnvironment\\flutter"
  "PROJECT_DIR=D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2"
  "FLUTTER_ROOT=D:\\Documents\\CodesEnvironment\\flutter"
  "FLUTTER_EPHEMERAL_DIR=D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\windows\\flutter\\ephemeral"
  "PROJECT_DIR=D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2"
  "FLUTTER_TARGET=D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\lib\\main.dart"
  "DART_DEFINES=RkxVVFRFUl9WRVJTSU9OPTMuMzguNQ==,RkxVVFRFUl9DSEFOTkVMPXN0YWJsZQ==,RkxVVFRFUl9HSVRfVVJMPWh0dHBzOi8vZ2l0aHViLmNvbS9mbHV0dGVyL2ZsdXR0ZXIuZ2l0,RkxVVFRFUl9GUkFNRVdPUktfUkVWSVNJT049ZjZmZjE1MjlmZA==,RkxVVFRFUl9FTkdJTkVfUkVWSVNJT049MTUyN2FlMGVjNQ==,RkxVVFRFUl9EQVJUX1ZFUlNJT049My4xMC40"
  "DART_OBFUSCATION=false"
  "TRACK_WIDGET_CREATION=true"
  "TREE_SHAKE_ICONS=false"
  "PACKAGE_CONFIG=D:\\Documents\\Codes\\2026_PhysTrigger-C3-BLE_v2\\.dart_tool\\package_config.json"
)

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\binary_messenger_impl.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BINARY_MESSENGER_IMPL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BINARY_MESSENGER_IMPL_H_

#include <flutter_messenger.h>

#include <map>
#include <string>

#include "include/flutter/binary_messenger.h"

namespace flutter {

// Wrapper around a FlutterDesktopMessengerRef that implements the
// BinaryMessenger API.
class BinaryMessengerImpl : public BinaryMessenger {
 public:
  explicit BinaryMessengerImpl(FlutterDesktopMessengerRef core_messenger);

  virtual ~BinaryMessengerImpl();

  // Prevent copying.
  BinaryMessengerImpl(BinaryMessengerImpl const&) = delete;
  BinaryMessengerImpl& operator=(BinaryMessengerImpl const&) = delete;

  // |flutter::BinaryMessenger|
  void Send(const std::string& channel,
            const uint8_t* message,
            size_t message_size,
            BinaryReply reply) const override;

  // |flutter::BinaryMessenger|
  void SetMessageHandler(const std::string& channel,
                         BinaryMessageHandler handler) override;

 private:
  // Handle for interacting with the C API.
  FlutterDesktopMessengerRef messenger_;

  // A map from channel names to the BinaryMessageHandler that should be called
  // for incoming messages on that channel.
  std::map<std::string, BinaryMessageHandler> handlers_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BINARY_MESSENGER_IMPL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\byte_buffer_streams.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BYTE_BUFFER_STREAMS_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BYTE_BUFFER_STREAMS_H_

#include <cassert>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <vector>

#include "include/flutter/byte_streams.h"

namespace flutter {

// Implementation of ByteStreamReader base on a byte array.
class ByteBufferStreamReader : public ByteStreamReader {
 public:
  // Createa a reader reading from |bytes|, which must have a length of |size|.
  // |bytes| must remain valid for the lifetime of this object.
  explicit ByteBufferStreamReader(const uint8_t* bytes, size_t size)
      : bytes_(bytes), size_(size) {}

  virtual ~ByteBufferStreamReader() = default;

  // |ByteStreamReader|
  uint8_t ReadByte() override {
    if (location_ >= size_) {
      std::cerr << "Invalid read in StandardCodecByteStreamReader" << std::endl;
      return 0;
    }
    return bytes_[location_++];
  }

  // |ByteStreamReader|
  void ReadBytes(uint8_t* buffer, size_t length) override {
    if (location_ + length > size_) {
      std::cerr << "Invalid read in StandardCodecByteStreamReader" << std::endl;
      return;
    }
    std::memcpy(buffer, &bytes_[location_], length);
    location_ += length;
  }

  // |ByteStreamReader|
  void ReadAlignment(uint8_t alignment) override {
    uint8_t mod = location_ % alignment;
    if (mod) {
      location_ += alignment - mod;
    }
  }

 private:
  // The buffer to read from.
  const uint8_t* bytes_;
  // The total size of the buffer.
  size_t size_;
  // The current read location.
  size_t location_ = 0;
};

// Implementation of ByteStreamWriter based on a byte array.
class ByteBufferStreamWriter : public ByteStreamWriter {
 public:
  // Creates a writer that writes into |buffer|.
  // |buffer| must remain valid for the lifetime of this object.
  explicit ByteBufferStreamWriter(std::vector<uint8_t>* buffer)
      : bytes_(buffer) {
    assert(buffer);
  }

  virtual ~ByteBufferStreamWriter() = default;

  // |ByteStreamWriter|
  void WriteByte(uint8_t byte) { bytes_->push_back(byte); }

  // |ByteStreamWriter|
  void WriteBytes(const uint8_t* bytes, size_t length) {
    assert(length > 0);
    bytes_->insert(bytes_->end(), bytes, bytes + length);
  }

  // |ByteStreamWriter|
  void WriteAlignment(uint8_t alignment) {
    uint8_t mod = bytes_->size() % alignment;
    if (mod) {
      for (int i = 0; i < alignment - mod; ++i) {
        WriteByte(0);
      }
    }
  }

 private:
  // The buffer to write to.
  std::vector<uint8_t>* bytes_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_BYTE_BUFFER_STREAMS_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\core_implementations.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file contains the implementations of any class in the wrapper that
// - is not fully inline, and
// - is necessary for all clients of the wrapper (either app or plugin).
// It exists instead of the usual structure of having some_class_name.cc files
// so that changes to the set of things that need non-header implementations
// are not breaking changes for the template.
//
// If https://github.com/flutter/flutter/issues/57146 is fixed, this can be
// removed in favor of the normal structure since templates will no longer
// manually include files.

#include <cassert>
#include <iostream>
#include <variant>

#include "binary_messenger_impl.h"
#include "include/flutter/engine_method_result.h"
#include "include/flutter/method_channel.h"
#include "include/flutter/standard_method_codec.h"
#include "texture_registrar_impl.h"

namespace flutter {

// ========== binary_messenger_impl.h ==========

namespace {

using FlutterDesktopMessengerScopedLock =
    std::unique_ptr<FlutterDesktopMessenger,
                    decltype(&FlutterDesktopMessengerUnlock)>;

// Passes |message| to |user_data|, which must be a BinaryMessageHandler, along
// with a BinaryReply that will send a response on |message|'s response handle.
//
// This serves as an adaptor between the function-pointer-based message callback
// interface provided by the C API and the std::function-based message handler
// interface of BinaryMessenger.
void ForwardToHandler(FlutterDesktopMessengerRef messenger,
                      const FlutterDesktopMessage* message,
                      void* user_data) {
  auto* response_handle = message->response_handle;
  auto messenger_ptr = std::shared_ptr<FlutterDesktopMessenger>(
      FlutterDesktopMessengerAddRef(messenger),
      &FlutterDesktopMessengerRelease);
  BinaryReply reply_handler = [messenger_ptr, response_handle](
                                  const uint8_t* reply,
                                  size_t reply_size) mutable {
    // Note: This lambda can be called on any thread.
    auto lock = FlutterDesktopMessengerScopedLock(
        FlutterDesktopMessengerLock(messenger_ptr.get()),
        &FlutterDesktopMessengerUnlock);
    if (!FlutterDesktopMessengerIsAvailable(messenger_ptr.get())) {
      // Drop reply if it comes in after the engine is destroyed.
      return;
    }
    if (!response_handle) {
      std::cerr << "Error: Response can be set only once. Ignoring "
                   "duplicate response."
                << std::endl;
      return;
    }
    FlutterDesktopMessengerSendResponse(messenger_ptr.get(), response_handle,
                                        reply, reply_size);
    // The engine frees the response handle once
    // FlutterDesktopSendMessageResponse is called.
    response_handle = nullptr;
  };

  const BinaryMessageHandler& message_handler =
      *static_cast<BinaryMessageHandler*>(user_data);

  message_handler(message->message, message->message_size,
                  std::move(reply_handler));
}
}  // namespace

BinaryMessengerImpl::BinaryMessengerImpl(
    FlutterDesktopMessengerRef core_messenger)
    : messenger_(core_messenger) {}

BinaryMessengerImpl::~BinaryMessengerImpl() = default;

void BinaryMessengerImpl::Send(const std::string& channel,
                               const uint8_t* message,
                               size_t message_size,
                               BinaryReply reply) const {
  if (reply == nullptr) {
    FlutterDesktopMessengerSend(messenger_, channel.c_str(), message,
                                message_size);
    return;
  }
  struct Captures {
    BinaryReply reply;
  };
  auto captures = new Captures();
  captures->reply = reply;

  auto message_reply = [](const uint8_t* data, size_t data_size,
                          void* user_data) {
    auto captures = reinterpret_cast<Captures*>(user_data);
    captures->reply(data, data_size);
    delete captures;
  };
  bool result = FlutterDesktopMessengerSendWithReply(
      messenger_, channel.c_str(), message, message_size, message_reply,
      captures);
  if (!result) {
    delete captures;
  }
}

void BinaryMessengerImpl::SetMessageHandler(const std::string& channel,
                                            BinaryMessageHandler handler) {
  if (!handler) {
    handlers_.erase(channel);
    FlutterDesktopMessengerSetCallback(messenger_, channel.c_str(), nullptr,
                                       nullptr);
    return;
  }
  // Save the handler, to keep it alive.
  handlers_[channel] = std::move(handler);
  BinaryMessageHandler* message_handler = &handlers_[channel];
  // Set an adaptor callback that will invoke the handler.
  FlutterDesktopMessengerSetCallback(messenger_, channel.c_str(),
                                     ForwardToHandler, message_handler);
}

// ========== engine_method_result.h ==========

namespace internal {

ReplyManager::ReplyManager(BinaryReply reply_handler)
    : reply_handler_(std::move(reply_handler)) {
  assert(reply_handler_);
}

ReplyManager::~ReplyManager() {
  if (reply_handler_) {
    // Warn, rather than send a not-implemented response, since the engine may
    // no longer be valid at this point.
    std::cerr
        << "Warning: Failed to respond to a message. This is a memory leak."
        << std::endl;
  }
}

void ReplyManager::SendResponseData(const std::vector<uint8_t>* data) {
  if (!reply_handler_) {
    std::cerr
        << "Error: Only one of Success, Error, or NotImplemented can be "
           "called,"
        << " and it can be called exactly once. Ignoring duplicate result."
        << std::endl;
    return;
  }

  const uint8_t* message = data && !data->empty() ? data->data() : nullptr;
  size_t message_size = data ? data->size() : 0;
  reply_handler_(message, message_size);
  reply_handler_ = nullptr;
}

}  // namespace internal

// ========== method_channel.h ==========

namespace {

constexpr char kControlChannelName[] = "dev.flutter/channel-buffers";
constexpr char kResizeMethod[] = "resize";
constexpr char kOverflowMethod[] = "overflow";

}  // namespace

namespace internal {

void ResizeChannel(BinaryMessenger* messenger, std::string name, int new_size) {
  auto control_channel = std::make_unique<MethodChannel<EncodableValue>>(
      messenger, kControlChannelName, &StandardMethodCodec::GetInstance());

  // The deserialization logic handles only 32 bits values, see
  // https://github.com/flutter/engine/blob/93e8901490e78c7ba7e319cce4470d9c6478c6dc/lib/ui/channel_buffers.dart#L495.
  control_channel->InvokeMethod(
      kResizeMethod, std::make_unique<EncodableValue>(EncodableList{
                         EncodableValue(name),
                         EncodableValue(static_cast<int32_t>(new_size)),
                     }));
}

void SetChannelWarnsOnOverflow(BinaryMessenger* messenger,
                               std::string name,
                               bool warns) {
  auto control_channel = std::make_unique<MethodChannel<EncodableValue>>(
      messenger, kControlChannelName, &StandardMethodCodec::GetInstance());

  control_channel->InvokeMethod(kOverflowMethod,
                                std::make_unique<EncodableValue>(EncodableList{
                                    EncodableValue(name),
                                    EncodableValue(!warns),
                                }));
}

}  // namespace internal

// ========== texture_registrar_impl.h ==========

TextureRegistrarImpl::TextureRegistrarImpl(
    FlutterDesktopTextureRegistrarRef texture_registrar_ref)
    : texture_registrar_ref_(texture_registrar_ref) {}

TextureRegistrarImpl::~TextureRegistrarImpl() = default;

int64_t TextureRegistrarImpl::RegisterTexture(TextureVariant* texture) {
  FlutterDesktopTextureInfo info = {};
  if (auto pixel_buffer_texture = std::get_if<PixelBufferTexture>(texture)) {
    info.type = kFlutterDesktopPixelBufferTexture;
    info.pixel_buffer_config.user_data = pixel_buffer_texture;
    info.pixel_buffer_config.callback =
        [](size_t width, size_t height,
           void* user_data) -> const FlutterDesktopPixelBuffer* {
      auto texture = static_cast<PixelBufferTexture*>(user_data);
      return texture->CopyPixelBuffer(width, height);
    };
  } else if (auto gpu_surface_texture =
                 std::get_if<GpuSurfaceTexture>(texture)) {
    info.type = kFlutterDesktopGpuSurfaceTexture;
    info.gpu_surface_config.struct_size =
        sizeof(FlutterDesktopGpuSurfaceTextureConfig);
    info.gpu_surface_config.type = gpu_surface_texture->surface_type();
    info.gpu_surface_config.user_data = gpu_surface_texture;
    info.gpu_surface_config.callback =
        [](size_t width, size_t height,
           void* user_data) -> const FlutterDesktopGpuSurfaceDescriptor* {
      auto texture = static_cast<GpuSurfaceTexture*>(user_data);
      return texture->ObtainDescriptor(width, height);
    };
  } else {
    std::cerr << "Attempting to register unknown texture variant." << std::endl;
    return -1;
  }

  int64_t texture_id = FlutterDesktopTextureRegistrarRegisterExternalTexture(
      texture_registrar_ref_, &info);
  return texture_id;
}  // namespace flutter

bool TextureRegistrarImpl::MarkTextureFrameAvailable(int64_t texture_id) {
  return FlutterDesktopTextureRegistrarMarkExternalTextureFrameAvailable(
      texture_registrar_ref_, texture_id);
}

void TextureRegistrarImpl::UnregisterTexture(int64_t texture_id,
                                             std::function<void()> callback) {
  if (callback == nullptr) {
    FlutterDesktopTextureRegistrarUnregisterExternalTexture(
        texture_registrar_ref_, texture_id, nullptr, nullptr);
    return;
  }

  struct Captures {
    std::function<void()> callback;
  };
  auto captures = new Captures();
  captures->callback = std::move(callback);
  FlutterDesktopTextureRegistrarUnregisterExternalTexture(
      texture_registrar_ref_, texture_id,
      [](void* opaque) {
        auto captures = reinterpret_cast<Captures*>(opaque);
        captures->callback();
        delete captures;
      },
      captures);
}

bool TextureRegistrarImpl::UnregisterTexture(int64_t texture_id) {
  UnregisterTexture(texture_id, nullptr);
  return true;
}

}  // namespace flutter

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\engine_method_result.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file is deprecated in favor of core_implementations.cc. This is a
// temporary forwarding implementation so that the switch to
// core_implementations.cc isn't an immediate breaking change, allowing for the
// template to be updated to include it and update the template version before
// removing this file.

#include "core_implementations.cc"

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\flutter_engine.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "include/flutter/flutter_engine.h"

#include <algorithm>
#include <iostream>

#include "binary_messenger_impl.h"
#include "flutter_windows.h"

namespace flutter {

FlutterEngine::FlutterEngine(const DartProject& project) {
  FlutterDesktopEngineProperties c_engine_properties = {};
  c_engine_properties.assets_path = project.assets_path().c_str();
  c_engine_properties.icu_data_path = project.icu_data_path().c_str();
  c_engine_properties.aot_library_path = project.aot_library_path().c_str();
  c_engine_properties.dart_entrypoint = project.dart_entrypoint().c_str();
  c_engine_properties.gpu_preference =
      static_cast<FlutterDesktopGpuPreference>(project.gpu_preference());
  c_engine_properties.ui_thread_policy =
      static_cast<FlutterDesktopUIThreadPolicy>(project.ui_thread_policy());

  const std::vector<std::string>& entrypoint_args =
      project.dart_entrypoint_arguments();
  std::vector<const char*> entrypoint_argv;
  std::transform(
      entrypoint_args.begin(), entrypoint_args.end(),
      std::back_inserter(entrypoint_argv),
      [](const std::string& arg) -> const char* { return arg.c_str(); });

  c_engine_properties.dart_entrypoint_argc =
      static_cast<int>(entrypoint_argv.size());
  c_engine_properties.dart_entrypoint_argv =
      entrypoint_argv.empty() ? nullptr : entrypoint_argv.data();

  engine_ = FlutterDesktopEngineCreate(&c_engine_properties);

  auto core_messenger = FlutterDesktopEngineGetMessenger(engine_);
  messenger_ = std::make_unique<BinaryMessengerImpl>(core_messenger);
}

FlutterEngine::~FlutterEngine() {
  ShutDown();
}

bool FlutterEngine::Run() {
  return Run(nullptr);
}

bool FlutterEngine::Run(const char* entry_point) {
  if (!engine_) {
    std::cerr << "Cannot run an engine that failed creation." << std::endl;
    return false;
  }
  if (run_succeeded_) {
    std::cerr << "Cannot run an engine more than once." << std::endl;
    return false;
  }
  bool run_succeeded = FlutterDesktopEngineRun(engine_, entry_point);
  if (!run_succeeded) {
    std::cerr << "Failed to start engine." << std::endl;
  }
  run_succeeded_ = true;
  return run_succeeded;
}

void FlutterEngine::ShutDown() {
  if (engine_ && owns_engine_) {
    FlutterDesktopEngineDestroy(engine_);
  }
  engine_ = nullptr;
}

std::chrono::nanoseconds FlutterEngine::ProcessMessages() {
  return std::chrono::nanoseconds(FlutterDesktopEngineProcessMessages(engine_));
}

void FlutterEngine::ReloadSystemFonts() {
  FlutterDesktopEngineReloadSystemFonts(engine_);
}

FlutterDesktopPluginRegistrarRef FlutterEngine::GetRegistrarForPlugin(
    const std::string& plugin_name) {
  if (!engine_) {
    std::cerr << "Cannot get plugin registrar on an engine that isn't running; "
                 "call Run first."
              << std::endl;
    return nullptr;
  }
  return FlutterDesktopEngineGetPluginRegistrar(engine_, plugin_name.c_str());
}

void FlutterEngine::SetNextFrameCallback(std::function<void()> callback) {
  next_frame_callback_ = std::move(callback);
  FlutterDesktopEngineSetNextFrameCallback(
      engine_,
      [](void* user_data) {
        FlutterEngine* self = static_cast<FlutterEngine*>(user_data);
        self->next_frame_callback_();
        self->next_frame_callback_ = nullptr;
      },
      this);
}

std::optional<LRESULT> FlutterEngine::ProcessExternalWindowMessage(
    HWND hwnd,
    UINT message,
    WPARAM wparam,
    LPARAM lparam) {
  LRESULT result;
  if (FlutterDesktopEngineProcessExternalWindowMessage(
          engine_, hwnd, message, wparam, lparam, &result)) {
    return result;
  }
  return std::nullopt;
}

FlutterDesktopEngineRef FlutterEngine::RelinquishEngine() {
  owns_engine_ = false;
  return engine_;
}

}  // namespace flutter

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\flutter_view_controller.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "include/flutter/flutter_view_controller.h"

#include <algorithm>
#include <iostream>

namespace flutter {

FlutterViewController::FlutterViewController(int width,
                                             int height,
                                             const DartProject& project) {
  engine_ = std::make_shared<FlutterEngine>(project);
  controller_ = FlutterDesktopViewControllerCreate(width, height,
                                                   engine_->RelinquishEngine());
  if (!controller_) {
    std::cerr << "Failed to create view controller." << std::endl;
    return;
  }
  view_ = std::make_unique<FlutterView>(
      FlutterDesktopViewControllerGetView(controller_));
}

FlutterViewController::~FlutterViewController() {
  if (controller_) {
    FlutterDesktopViewControllerDestroy(controller_);
  }
}

FlutterViewId FlutterViewController::view_id() const {
  auto view_id = FlutterDesktopViewControllerGetViewId(controller_);

  return static_cast<FlutterViewId>(view_id);
}

void FlutterViewController::ForceRedraw() {
  FlutterDesktopViewControllerForceRedraw(controller_);
}

std::optional<LRESULT> FlutterViewController::HandleTopLevelWindowProc(
    HWND hwnd,
    UINT message,
    WPARAM wparam,
    LPARAM lparam) {
  LRESULT result;
  bool handled = FlutterDesktopViewControllerHandleTopLevelWindowProc(
      controller_, hwnd, message, wparam, lparam, &result);
  return handled ? result : std::optional<LRESULT>(std::nullopt);
}

}  // namespace flutter

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\plugin_registrar.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "include/flutter/plugin_registrar.h"

#include <iostream>
#include <map>

#include "binary_messenger_impl.h"
#include "include/flutter/engine_method_result.h"
#include "include/flutter/method_channel.h"
#include "texture_registrar_impl.h"

namespace flutter {

// ===== PluginRegistrar =====

PluginRegistrar::PluginRegistrar(FlutterDesktopPluginRegistrarRef registrar)
    : registrar_(registrar) {
  auto core_messenger = FlutterDesktopPluginRegistrarGetMessenger(registrar_);
  messenger_ = std::make_unique<BinaryMessengerImpl>(core_messenger);

  auto texture_registrar =
      FlutterDesktopRegistrarGetTextureRegistrar(registrar_);
  texture_registrar_ =
      std::make_unique<TextureRegistrarImpl>(texture_registrar);
}

PluginRegistrar::~PluginRegistrar() {
  // This must always be the first call.
  ClearPlugins();

  // Explicitly cleared to facilitate testing of destruction order.
  messenger_.reset();
}

void PluginRegistrar::AddPlugin(std::unique_ptr<Plugin> plugin) {
  plugins_.insert(std::move(plugin));
}

void PluginRegistrar::ClearPlugins() {
  plugins_.clear();
}

// ===== PluginRegistrarManager =====

// static
PluginRegistrarManager* PluginRegistrarManager::GetInstance() {
  static PluginRegistrarManager* instance = new PluginRegistrarManager();
  return instance;
}

PluginRegistrarManager::PluginRegistrarManager() = default;

// static
void PluginRegistrarManager::OnRegistrarDestroyed(
    FlutterDesktopPluginRegistrarRef registrar) {
  GetInstance()->registrars()->erase(registrar);
}

}  // namespace flutter

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\readme
```text
This code is intended to be built into plugins and applications to provide
higher-level, C++ abstractions for interacting with the Flutter library.

Over time, the goal is to move more of this code into the library in a way that
provides a usable ABI (e.g., does not use standard library in the interfaces).

Note that this wrapper is still in early stages. Expect significant churn in
both the APIs and the structure of the wrapper (e.g., the exact set of files
that need to be built).

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\standard_codec.cc
```cc
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file contains what would normally be standard_codec_serializer.cc,
// standard_message_codec.cc, and standard_method_codec.cc. They are grouped
// together to simplify use of the client wrapper, since the common case is
// that any client that needs one of these files needs all three.

#include <cassert>
#include <cstring>
#include <iostream>
#include <map>
#include <string>
#include <vector>

#include "byte_buffer_streams.h"
#include "include/flutter/standard_codec_serializer.h"
#include "include/flutter/standard_message_codec.h"
#include "include/flutter/standard_method_codec.h"

namespace flutter {

// ===== standard_codec_serializer.h =====

namespace {

// The order/values here must match the constants in message_codecs.dart.
enum class EncodedType {
  kNull = 0,
  kTrue,
  kFalse,
  kInt32,
  kInt64,
  kLargeInt,  // No longer used. If encountered, treat as kString.
  kFloat64,
  kString,
  kUInt8List,
  kInt32List,
  kInt64List,
  kFloat64List,
  kList,
  kMap,
  kFloat32List,
};

// Returns the encoded type that should be written when serializing |value|.
EncodedType EncodedTypeForValue(const EncodableValue& value) {
  switch (value.index()) {
    case 0:
      return EncodedType::kNull;
    case 1:
      return std::get<bool>(value) ? EncodedType::kTrue : EncodedType::kFalse;
    case 2:
      return EncodedType::kInt32;
    case 3:
      return EncodedType::kInt64;
    case 4:
      return EncodedType::kFloat64;
    case 5:
      return EncodedType::kString;
    case 6:
      return EncodedType::kUInt8List;
    case 7:
      return EncodedType::kInt32List;
    case 8:
      return EncodedType::kInt64List;
    case 9:
      return EncodedType::kFloat64List;
    case 10:
      return EncodedType::kList;
    case 11:
      return EncodedType::kMap;
    case 13:
      return EncodedType::kFloat32List;
  }
  assert(false);
  return EncodedType::kNull;
}

}  // namespace

StandardCodecSerializer::StandardCodecSerializer() = default;

StandardCodecSerializer::~StandardCodecSerializer() = default;

const StandardCodecSerializer& StandardCodecSerializer::GetInstance() {
  static StandardCodecSerializer sInstance;
  return sInstance;
};

EncodableValue StandardCodecSerializer::ReadValue(
    ByteStreamReader* stream) const {
  uint8_t type = stream->ReadByte();
  return ReadValueOfType(type, stream);
}

void StandardCodecSerializer::WriteValue(const EncodableValue& value,
                                         ByteStreamWriter* stream) const {
  stream->WriteByte(static_cast<uint8_t>(EncodedTypeForValue(value)));
  // TODO(cbracken): Consider replacing this with std::visit.
  switch (value.index()) {
    case 0:
    case 1:
      // Null and bool are encoded directly in the type.
      break;
    case 2:
      stream->WriteInt32(std::get<int32_t>(value));
      break;
    case 3:
      stream->WriteInt64(std::get<int64_t>(value));
      break;
    case 4:
      stream->WriteAlignment(8);
      stream->WriteDouble(std::get<double>(value));
      break;
    case 5: {
      const auto& string_value = std::get<std::string>(value);
      size_t size = string_value.size();
      WriteSize(size, stream);
      if (size > 0) {
        stream->WriteBytes(
            reinterpret_cast<const uint8_t*>(string_value.data()), size);
      }
      break;
    }
    case 6:
      WriteVector(std::get<std::vector<uint8_t>>(value), stream);
      break;
    case 7:
      WriteVector(std::get<std::vector<int32_t>>(value), stream);
      break;
    case 8:
      WriteVector(std::get<std::vector<int64_t>>(value), stream);
      break;
    case 9:
      WriteVector(std::get<std::vector<double>>(value), stream);
      break;
    case 10: {
      const auto& list = std::get<EncodableList>(value);
      WriteSize(list.size(), stream);
      for (const auto& item : list) {
        WriteValue(item, stream);
      }
      break;
    }
    case 11: {
      const auto& map = std::get<EncodableMap>(value);
      WriteSize(map.size(), stream);
      for (const auto& pair : map) {
        WriteValue(pair.first, stream);
        WriteValue(pair.second, stream);
      }
      break;
    }
    case 12:
      std::cerr
          << "Unhandled custom type in StandardCodecSerializer::WriteValue. "
          << "Custom types require codec extensions." << std::endl;
      break;
    case 13: {
      WriteVector(std::get<std::vector<float>>(value), stream);
      break;
    }
  }
}

EncodableValue StandardCodecSerializer::ReadValueOfType(
    uint8_t type,
    ByteStreamReader* stream) const {
  switch (static_cast<EncodedType>(type)) {
    case EncodedType::kNull:
      return EncodableValue();
    case EncodedType::kTrue:
      return EncodableValue(true);
    case EncodedType::kFalse:
      return EncodableValue(false);
    case EncodedType::kInt32:
      return EncodableValue(stream->ReadInt32());
    case EncodedType::kInt64:
      return EncodableValue(stream->ReadInt64());
    case EncodedType::kFloat64:
      stream->ReadAlignment(8);
      return EncodableValue(stream->ReadDouble());
    case EncodedType::kLargeInt:
    case EncodedType::kString: {
      size_t size = ReadSize(stream);
      std::string string_value;
      string_value.resize(size);
      stream->ReadBytes(reinterpret_cast<uint8_t*>(&string_value[0]), size);
      return EncodableValue(string_value);
    }
    case EncodedType::kUInt8List:
      return ReadVector<uint8_t>(stream);
    case EncodedType::kInt32List:
      return ReadVector<int32_t>(stream);
    case EncodedType::kInt64List:
      return ReadVector<int64_t>(stream);
    case EncodedType::kFloat64List:
      return ReadVector<double>(stream);
    case EncodedType::kList: {
      size_t length = ReadSize(stream);
      EncodableList list_value;
      list_value.reserve(length);
      for (size_t i = 0; i < length; ++i) {
        list_value.push_back(ReadValue(stream));
      }
      return EncodableValue(list_value);
    }
    case EncodedType::kMap: {
      size_t length = ReadSize(stream);
      EncodableMap map_value;
      for (size_t i = 0; i < length; ++i) {
        EncodableValue key = ReadValue(stream);
        EncodableValue value = ReadValue(stream);
        map_value.emplace(std::move(key), std::move(value));
      }
      return EncodableValue(map_value);
    }
    case EncodedType::kFloat32List: {
      return ReadVector<float>(stream);
    }
  }
  std::cerr << "Unknown type in StandardCodecSerializer::ReadValueOfType: "
            << static_cast<int>(type) << std::endl;
  return EncodableValue();
}

size_t StandardCodecSerializer::ReadSize(ByteStreamReader* stream) const {
  uint8_t byte = stream->ReadByte();
  if (byte < 254) {
    return byte;
  } else if (byte == 254) {
    uint16_t value = 0;
    stream->ReadBytes(reinterpret_cast<uint8_t*>(&value), 2);
    return value;
  } else {
    uint32_t value = 0;
    stream->ReadBytes(reinterpret_cast<uint8_t*>(&value), 4);
    return value;
  }
}

void StandardCodecSerializer::WriteSize(size_t size,
                                        ByteStreamWriter* stream) const {
  if (size < 254) {
    stream->WriteByte(static_cast<uint8_t>(size));
  } else if (size <= 0xffff) {
    stream->WriteByte(254);
    uint16_t value = static_cast<uint16_t>(size);
    stream->WriteBytes(reinterpret_cast<uint8_t*>(&value), 2);
  } else {
    stream->WriteByte(255);
    uint32_t value = static_cast<uint32_t>(size);
    stream->WriteBytes(reinterpret_cast<uint8_t*>(&value), 4);
  }
}

template <typename T>
EncodableValue StandardCodecSerializer::ReadVector(
    ByteStreamReader* stream) const {
  size_t count = ReadSize(stream);
  std::vector<T> vector;
  vector.resize(count);
  uint8_t type_size = static_cast<uint8_t>(sizeof(T));
  if (type_size > 1) {
    stream->ReadAlignment(type_size);
  }
  stream->ReadBytes(reinterpret_cast<uint8_t*>(vector.data()),
                    count * type_size);
  return EncodableValue(vector);
}

template <typename T>
void StandardCodecSerializer::WriteVector(const std::vector<T> vector,
                                          ByteStreamWriter* stream) const {
  size_t count = vector.size();
  WriteSize(count, stream);
  if (count == 0) {
    return;
  }
  uint8_t type_size = static_cast<uint8_t>(sizeof(T));
  if (type_size > 1) {
    stream->WriteAlignment(type_size);
  }
  stream->WriteBytes(reinterpret_cast<const uint8_t*>(vector.data()),
                     count * type_size);
}

// ===== standard_message_codec.h =====

// static
const StandardMessageCodec& StandardMessageCodec::GetInstance(
    const StandardCodecSerializer* serializer) {
  if (!serializer) {
    serializer = &StandardCodecSerializer::GetInstance();
  }
  static auto* sInstances = new std::map<const StandardCodecSerializer*,
                                         std::unique_ptr<StandardMessageCodec>>;
  auto it = sInstances->find(serializer);
  if (it == sInstances->end()) {
    // Uses new due to private constructor (to prevent API clients from
    // accidentally passing temporary codec instances to channels).
    // NOLINTNEXTLINE(clang-analyzer-cplusplus.NewDeleteLeaks)
    auto emplace_result = sInstances->emplace(
        serializer, std::unique_ptr<StandardMessageCodec>(
                        new StandardMessageCodec(serializer)));
    it = emplace_result.first;
  }
  return *(it->second);
}

StandardMessageCodec::StandardMessageCodec(
    const StandardCodecSerializer* serializer)
    : serializer_(serializer) {}

StandardMessageCodec::~StandardMessageCodec() = default;

std::unique_ptr<EncodableValue> StandardMessageCodec::DecodeMessageInternal(
    const uint8_t* binary_message,
    size_t message_size) const {
  if (!binary_message) {
    return std::make_unique<EncodableValue>();
  }
  ByteBufferStreamReader stream(binary_message, message_size);
  return std::make_unique<EncodableValue>(serializer_->ReadValue(&stream));
}

std::unique_ptr<std::vector<uint8_t>>
StandardMessageCodec::EncodeMessageInternal(
    const EncodableValue& message) const {
  auto encoded = std::make_unique<std::vector<uint8_t>>();
  ByteBufferStreamWriter stream(encoded.get());
  serializer_->WriteValue(message, &stream);
  return encoded;
}

// ===== standard_method_codec.h =====

// static
const StandardMethodCodec& StandardMethodCodec::GetInstance(
    const StandardCodecSerializer* serializer) {
  if (!serializer) {
    serializer = &StandardCodecSerializer::GetInstance();
  }
  static auto* sInstances = new std::map<const StandardCodecSerializer*,
                                         std::unique_ptr<StandardMethodCodec>>;
  auto it = sInstances->find(serializer);
  if (it == sInstances->end()) {
    // Uses new due to private constructor (to prevent API clients from
    // accidentally passing temporary codec instances to channels).
    // NOLINTNEXTLINE(clang-analyzer-cplusplus.NewDeleteLeaks)
    auto emplace_result = sInstances->emplace(
        serializer, std::unique_ptr<StandardMethodCodec>(
                        new StandardMethodCodec(serializer)));
    it = emplace_result.first;
  }
  return *(it->second);
}

StandardMethodCodec::StandardMethodCodec(
    const StandardCodecSerializer* serializer)
    : serializer_(serializer) {}

StandardMethodCodec::~StandardMethodCodec() = default;

std::unique_ptr<MethodCall<EncodableValue>>
StandardMethodCodec::DecodeMethodCallInternal(const uint8_t* message,
                                              size_t message_size) const {
  ByteBufferStreamReader stream(message, message_size);
  EncodableValue method_name_value = serializer_->ReadValue(&stream);
  const auto* method_name = std::get_if<std::string>(&method_name_value);
  if (!method_name) {
    std::cerr << "Invalid method call; method name is not a string."
              << std::endl;
    return nullptr;
  }
  auto arguments =
      std::make_unique<EncodableValue>(serializer_->ReadValue(&stream));
  return std::make_unique<MethodCall<EncodableValue>>(*method_name,
                                                      std::move(arguments));
}

std::unique_ptr<std::vector<uint8_t>>
StandardMethodCodec::EncodeMethodCallInternal(
    const MethodCall<EncodableValue>& method_call) const {
  auto encoded = std::make_unique<std::vector<uint8_t>>();
  ByteBufferStreamWriter stream(encoded.get());
  serializer_->WriteValue(EncodableValue(method_call.method_name()), &stream);
  if (method_call.arguments()) {
    serializer_->WriteValue(*method_call.arguments(), &stream);
  } else {
    serializer_->WriteValue(EncodableValue(), &stream);
  }
  return encoded;
}

std::unique_ptr<std::vector<uint8_t>>
StandardMethodCodec::EncodeSuccessEnvelopeInternal(
    const EncodableValue* result) const {
  auto encoded = std::make_unique<std::vector<uint8_t>>();
  ByteBufferStreamWriter stream(encoded.get());
  stream.WriteByte(0);
  if (result) {
    serializer_->WriteValue(*result, &stream);
  } else {
    serializer_->WriteValue(EncodableValue(), &stream);
  }
  return encoded;
}

std::unique_ptr<std::vector<uint8_t>>
StandardMethodCodec::EncodeErrorEnvelopeInternal(
    const std::string& error_code,
    const std::string& error_message,
    const EncodableValue* error_details) const {
  auto encoded = std::make_unique<std::vector<uint8_t>>();
  ByteBufferStreamWriter stream(encoded.get());
  stream.WriteByte(1);
  serializer_->WriteValue(EncodableValue(error_code), &stream);
  if (error_message.empty()) {
    serializer_->WriteValue(EncodableValue(), &stream);
  } else {
    serializer_->WriteValue(EncodableValue(error_message), &stream);
  }
  if (error_details) {
    serializer_->WriteValue(*error_details, &stream);
  } else {
    serializer_->WriteValue(EncodableValue(), &stream);
  }
  return encoded;
}

bool StandardMethodCodec::DecodeAndProcessResponseEnvelopeInternal(
    const uint8_t* response,
    size_t response_size,
    MethodResult<EncodableValue>* result) const {
  ByteBufferStreamReader stream(response, response_size);
  uint8_t flag = stream.ReadByte();
  switch (flag) {
    case 0: {
      EncodableValue value = serializer_->ReadValue(&stream);
      if (value.IsNull()) {
        result->Success();
      } else {
        result->Success(value);
      }
      return true;
    }
    case 1: {
      EncodableValue code = serializer_->ReadValue(&stream);
      EncodableValue message = serializer_->ReadValue(&stream);
      EncodableValue details = serializer_->ReadValue(&stream);
      const std::string& message_string =
          message.IsNull() ? "" : std::get<std::string>(message);
      if (details.IsNull()) {
        result->Error(std::get<std::string>(code), message_string);
      } else {
        result->Error(std::get<std::string>(code), message_string, details);
      }
      return true;
    }
    default:
      return false;
  }
}

}  // namespace flutter

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\texture_registrar_impl.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_TEXTURE_REGISTRAR_IMPL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_TEXTURE_REGISTRAR_IMPL_H_

#include "include/flutter/texture_registrar.h"

namespace flutter {

// Wrapper around a FlutterDesktopTextureRegistrarRef that implements the
// TextureRegistrar API.
class TextureRegistrarImpl : public TextureRegistrar {
 public:
  explicit TextureRegistrarImpl(
      FlutterDesktopTextureRegistrarRef texture_registrar_ref);
  virtual ~TextureRegistrarImpl();

  // Prevent copying.
  TextureRegistrarImpl(TextureRegistrarImpl const&) = delete;
  TextureRegistrarImpl& operator=(TextureRegistrarImpl const&) = delete;

  // |flutter::TextureRegistrar|
  int64_t RegisterTexture(TextureVariant* texture) override;

  // |flutter::TextureRegistrar|
  bool MarkTextureFrameAvailable(int64_t texture_id) override;

  // |flutter::TextureRegistrar|
  void UnregisterTexture(int64_t texture_id,
                         std::function<void()> callback) override;

  // |flutter::TextureRegistrar|
  bool UnregisterTexture(int64_t texture_id) override;

 private:
  // Handle for interacting with the C API.
  FlutterDesktopTextureRegistrarRef texture_registrar_ref_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_TEXTURE_REGISTRAR_IMPL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\basic_message_channel.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BASIC_MESSAGE_CHANNEL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BASIC_MESSAGE_CHANNEL_H_

#include <iostream>
#include <string>
#include <utility>

#include "binary_messenger.h"
#include "message_codec.h"

namespace flutter {

namespace internal {
// Internal helper functions used by BasicMessageChannel and MethodChannel.

// Adjusts the number of messages that will get buffered when sending messages
// to channels that aren't fully set up yet. For example, the engine isn't
// running yet or the channel's message handler isn't set up on the Dart side
// yet.
void ResizeChannel(BinaryMessenger* messenger, std::string name, int new_size);

// Defines whether the channel should show warning messages when discarding
// messages due to overflow.
//
// When |warns| is false, the channel is expected to overflow and warning
// messages will not be shown.
void SetChannelWarnsOnOverflow(BinaryMessenger* messenger,
                               std::string name,
                               bool warns);

}  // namespace internal

class EncodableValue;

// A message reply callback.
//
// Used for submitting a reply back to a Flutter message sender.
template <typename T>
using MessageReply = std::function<void(const T& reply)>;

// A handler for receiving a message from the Flutter engine.
//
// Implementations must asynchronously call reply exactly once with the reply
// to the message.
template <typename T>
using MessageHandler =
    std::function<void(const T& message, const MessageReply<T>& reply)>;

// A channel for communicating with the Flutter engine by sending asynchronous
// messages.
template <typename T = EncodableValue>
class BasicMessageChannel {
 public:
  // Creates an instance that sends and receives method calls on the channel
  // named |name|, encoded with |codec| and dispatched via |messenger|.
  BasicMessageChannel(BinaryMessenger* messenger,
                      const std::string& name,
                      const MessageCodec<T>* codec)
      : messenger_(messenger), name_(name), codec_(codec) {}

  ~BasicMessageChannel() = default;

  // Prevent copying.
  BasicMessageChannel(BasicMessageChannel const&) = delete;
  BasicMessageChannel& operator=(BasicMessageChannel const&) = delete;

  // Sends a message to the Flutter engine on this channel.
  void Send(const T& message) {
    std::unique_ptr<std::vector<uint8_t>> raw_message =
        codec_->EncodeMessage(message);
    messenger_->Send(name_, raw_message->data(), raw_message->size());
  }

  // Sends a message to the Flutter engine on this channel expecting a reply.
  void Send(const T& message, BinaryReply reply) {
    std::unique_ptr<std::vector<uint8_t>> raw_message =
        codec_->EncodeMessage(message);
    messenger_->Send(name_, raw_message->data(), raw_message->size(),
                     std::move(reply));
  }

  // Registers a handler that should be called any time a message is
  // received on this channel. A null handler will remove any previous handler.
  //
  // Note that the BasicMessageChannel does not own the handler, and will not
  // unregister it on destruction, so the caller is responsible for
  // unregistering explicitly if it should no longer be called.
  void SetMessageHandler(const MessageHandler<T>& handler) const {
    if (!handler) {
      messenger_->SetMessageHandler(name_, nullptr);
      return;
    }
    const auto* codec = codec_;
    std::string channel_name = name_;
    BinaryMessageHandler binary_handler = [handler, codec, channel_name](
                                              const uint8_t* binary_message,
                                              const size_t binary_message_size,
                                              const BinaryReply& binary_reply) {
      // Use this channel's codec to decode the message and build a reply
      // handler.
      std::unique_ptr<T> message =
          codec->DecodeMessage(binary_message, binary_message_size);
      if (!message) {
        std::cerr << "Unable to decode message on channel " << channel_name
                  << std::endl;
        binary_reply(nullptr, 0);
        return;
      }

      MessageReply<T> unencoded_reply = [binary_reply,
                                         codec](const T& unencoded_response) {
        auto binary_response = codec->EncodeMessage(unencoded_response);
        binary_reply(binary_response->data(), binary_response->size());
      };
      handler(*message, std::move(unencoded_reply));
    };
    messenger_->SetMessageHandler(name_, std::move(binary_handler));
  }

  // Adjusts the number of messages that will get buffered when sending messages
  // to channels that aren't fully set up yet. For example, the engine isn't
  // running yet or the channel's message handler isn't set up on the Dart side
  // yet.
  void Resize(int new_size) {
    internal::ResizeChannel(messenger_, name_, new_size);
  }

  // Defines whether the channel should show warning messages when discarding
  // messages due to overflow.
  //
  // When |warns| is false, the channel is expected to overflow and warning
  // messages will not be shown.
  void SetWarnsOnOverflow(bool warns) {
    internal::SetChannelWarnsOnOverflow(messenger_, name_, warns);
  }

 private:
  BinaryMessenger* messenger_;
  std::string name_;
  const MessageCodec<T>* codec_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BASIC_MESSAGE_CHANNEL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\binary_messenger.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BINARY_MESSENGER_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BINARY_MESSENGER_H_

#include <functional>
#include <string>

namespace flutter {

// A binary message reply callback.
//
// Used for submitting a binary reply back to a Flutter message sender.
typedef std::function<void(const uint8_t* reply, size_t reply_size)>
    BinaryReply;

// A message handler callback.
//
// Used for receiving messages from Flutter and providing an asynchronous reply.
typedef std::function<
    void(const uint8_t* message, size_t message_size, BinaryReply reply)>
    BinaryMessageHandler;

// A protocol for a class that handles communication of binary data on named
// channels to and from the Flutter engine.
class BinaryMessenger {
 public:
  virtual ~BinaryMessenger() = default;

  // Sends a binary message to the Flutter engine on the specified channel.
  //
  // If |reply| is provided, it will be called back with the response from the
  // engine.
  virtual void Send(const std::string& channel,
                    const uint8_t* message,
                    size_t message_size,
                    BinaryReply reply = nullptr) const = 0;

  // Registers a message handler for incoming binary messages from the Flutter
  // side on the specified channel.
  //
  // Replaces any existing handler. Provide a null handler to unregister the
  // existing handler.
  virtual void SetMessageHandler(const std::string& channel,
                                 BinaryMessageHandler handler) = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BINARY_MESSENGER_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\byte_streams.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BYTE_STREAMS_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BYTE_STREAMS_H_

// Interfaces for interacting with a stream of bytes, for use in codecs.

namespace flutter {

// An interface for a class that reads from a byte stream.
class ByteStreamReader {
 public:
  explicit ByteStreamReader() = default;
  virtual ~ByteStreamReader() = default;

  // Reads and returns the next byte from the stream.
  virtual uint8_t ReadByte() = 0;

  // Reads the next |length| bytes from the stream into |buffer|. The caller
  // is responsible for ensuring that |buffer| is large enough.
  virtual void ReadBytes(uint8_t* buffer, size_t length) = 0;

  // Advances the read cursor to the next multiple of |alignment| relative to
  // the start of the stream, unless it is already aligned.
  virtual void ReadAlignment(uint8_t alignment) = 0;

  // Reads and returns the next 32-bit integer from the stream.
  int32_t ReadInt32() {
    int32_t value = 0;
    ReadBytes(reinterpret_cast<uint8_t*>(&value), 4);
    return value;
  }

  // Reads and returns the next 64-bit integer from the stream.
  int64_t ReadInt64() {
    int64_t value = 0;
    ReadBytes(reinterpret_cast<uint8_t*>(&value), 8);
    return value;
  }

  // Reads and returns the next 64-bit floating point number from the stream.
  double ReadDouble() {
    double value = 0;
    ReadBytes(reinterpret_cast<uint8_t*>(&value), 8);
    return value;
  }
};

// An interface for a class that writes to a byte stream.
class ByteStreamWriter {
 public:
  explicit ByteStreamWriter() = default;
  virtual ~ByteStreamWriter() = default;

  // Writes |byte| to the stream.
  virtual void WriteByte(uint8_t byte) = 0;

  // Writes the next |length| bytes from |bytes| to the stream
  virtual void WriteBytes(const uint8_t* bytes, size_t length) = 0;

  // Writes 0s until the next multiple of |alignment| relative to the start
  // of the stream, unless the write positition is already aligned.
  virtual void WriteAlignment(uint8_t alignment) = 0;

  // Writes the given 32-bit int to the stream.
  void WriteInt32(int32_t value) {
    WriteBytes(reinterpret_cast<const uint8_t*>(&value), 4);
  }

  // Writes the given 64-bit int to the stream.
  void WriteInt64(int64_t value) {
    WriteBytes(reinterpret_cast<const uint8_t*>(&value), 8);
  }

  // Writes the given 36-bit double to the stream.
  void WriteDouble(double value) {
    WriteBytes(reinterpret_cast<const uint8_t*>(&value), 8);
  }
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_BYTE_STREAMS_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\dart_project.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_DART_PROJECT_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_DART_PROJECT_H_

#include <string>
#include <vector>

namespace flutter {

// Configures how the Flutter engine selects a GPU.
enum class GpuPreference {
  // No preference.
  NoPreference,
  // Prefer energy efficiency over performance, such as an integrated GPU.
  // This falls back to a high performance GPU if no low power GPU is
  // available.
  LowPowerPreference,
};

// Configures the thread policy for running the UI isolate.
enum class UIThreadPolicy {
  // Default value. Currently will run the UI isolate on separate thread,
  // later will be changed to running the UI isolate on platform thread.
  Default,
  // Run the UI isolate on platform thread.
  RunOnPlatformThread,
  // Run the UI isolate on a separate thread.
  RunOnSeparateThread,
};

// A set of Flutter and Dart assets used to initialize a Flutter engine.
class DartProject {
 public:
  // Creates a DartProject from a series of absolute paths.
  // The three paths are:
  // - assets_path: Path to the assets directory as built by the Flutter tool.
  // - icu_data_path: Path to the icudtl.dat file.
  // - aot_library_path: Path to the AOT snapshot file.
  //
  // The paths may either be absolute or relative to the directory containing
  // the running executable.
  explicit DartProject(const std::wstring& assets_path,
                       const std::wstring& icu_data_path,
                       const std::wstring& aot_library_path) {
    assets_path_ = assets_path;
    icu_data_path_ = icu_data_path;
    aot_library_path_ = aot_library_path;
  }

  // Creates a DartProject from a directory path. The directory should contain
  // the following top-level items:
  // - icudtl.dat (provided as a resource by the Flutter tool)
  // - flutter_assets (as built by the Flutter tool)
  // - app.so, for an AOT build (as built by the Flutter tool)
  //
  // The path can either be absolute, or relative to the directory containing
  // the running executable.
  explicit DartProject(const std::wstring& path) {
    assets_path_ = path + L"\\flutter_assets";
    icu_data_path_ = path + L"\\icudtl.dat";
    aot_library_path_ = path + L"\\app.so";
  }

  ~DartProject() = default;

  // Sets the Dart entrypoint to the specified value.
  //
  // If not set, the default entrypoint (main) is used. Custom Dart entrypoints
  // must be decorated with `@pragma('vm:entry-point')`.
  void set_dart_entrypoint(const std::string& entrypoint) {
    if (entrypoint.empty()) {
      return;
    }
    dart_entrypoint_ = entrypoint;
  }

  // Returns the Dart entrypoint.
  const std::string& dart_entrypoint() const { return dart_entrypoint_; }

  // Sets the command line arguments that should be passed to the Dart
  // entrypoint.
  void set_dart_entrypoint_arguments(std::vector<std::string> arguments) {
    dart_entrypoint_arguments_ = std::move(arguments);
  }

  // Returns any command line arguments that should be passed to the Dart
  // entrypoint.
  const std::vector<std::string>& dart_entrypoint_arguments() const {
    return dart_entrypoint_arguments_;
  }

  // Sets the GPU usage preference for flutter engine.
  void set_gpu_preference(GpuPreference gpu_preference) {
    gpu_preference_ = gpu_preference;
  }

  // Returns the project's GPU preference.
  // Defaults to NoPreference.
  GpuPreference gpu_preference() const { return gpu_preference_; }

  // Sets the thread policy for UI isolate.
  void set_ui_thread_policy(UIThreadPolicy policy) {
    ui_thread_policy_ = policy;
  }

  // Returns the policy for UI isolate.
  // Defaults to UIThreadPolicy::Default.
  UIThreadPolicy ui_thread_policy() const { return ui_thread_policy_; }

 private:
  // Accessors for internals are private, so that they can be changed if more
  // flexible options for project structures are needed later without it
  // being a breaking change. Provide access to internal classes that need
  // them.
  friend class FlutterEngine;
  friend class FlutterViewController;
  friend class DartProjectTest;

  const std::wstring& assets_path() const { return assets_path_; }
  const std::wstring& icu_data_path() const { return icu_data_path_; }
  const std::wstring& aot_library_path() const { return aot_library_path_; }

  // The path to the assets directory.
  std::wstring assets_path_;
  // The path to the ICU data.
  std::wstring icu_data_path_;
  // The path to the AOT library. This will always return a path, but non-AOT
  // builds will not be expected to actually have a library at that path.
  std::wstring aot_library_path_;
  // The Dart entrypoint to launch.
  std::string dart_entrypoint_;
  // The list of arguments to pass through to the Dart entrypoint.
  std::vector<std::string> dart_entrypoint_arguments_;
  // The preference for GPU to be used by flutter engine.
  GpuPreference gpu_preference_ = GpuPreference::NoPreference;
  // Thread policy for UI isolate.
  UIThreadPolicy ui_thread_policy_ = UIThreadPolicy::Default;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_DART_PROJECT_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\encodable_value.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENCODABLE_VALUE_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENCODABLE_VALUE_H_

#include <any>
#include <cassert>
#include <cstdint>
#include <map>
#include <string>
#include <utility>
#include <variant>
#include <vector>

// Unless overridden, attempt to detect the RTTI state from the compiler.
#ifndef FLUTTER_ENABLE_RTTI
#if defined(_MSC_VER)
#ifdef _CPPRTTI
#define FLUTTER_ENABLE_RTTI 1
#endif
#elif defined(__clang__)
#if __has_feature(cxx_rtti)
#define FLUTTER_ENABLE_RTTI 1
#endif
#elif defined(__GNUC__)
#ifdef __GXX_RTTI
#define FLUTTER_ENABLE_RTTI 1
#endif
#endif
#endif  // #ifndef FLUTTER_ENABLE_RTTI

namespace flutter {

static_assert(sizeof(double) == 8, "EncodableValue requires a 64-bit double");

// A container for arbitrary types in EncodableValue.
//
// This is used in conjunction with StandardCodecExtension to allow using other
// types with a StandardMethodCodec/StandardMessageCodec. It is implicitly
// convertible to EncodableValue, so constructing an EncodableValue from a
// custom type can generally be written as:
//   CustomEncodableValue(MyType(...))
// rather than:
//   EncodableValue(CustomEncodableValue(MyType(...)))
//
// For extracting received custom types, it is implicitly convertible to
// std::any. For example:
//   const MyType& my_type_value =
//        std::any_cast<MyType>(std::get<CustomEncodableValue>(value));
//
// If RTTI is enabled, different extension types can be checked with type():
//   if (custom_value->type() == typeid(SomeData)) { ... }
// Clients that wish to disable RTTI would need to decide on another approach
// for distinguishing types (e.g., in StandardCodecExtension::WriteValueOfType)
// if multiple custom types are needed. For instance, wrapping all of the
// extension types in an EncodableValue-style variant, and only ever storing
// that variant in CustomEncodableValue.
class CustomEncodableValue {
 public:
  explicit CustomEncodableValue(const std::any& value) : value_(value) {}
  ~CustomEncodableValue() = default;

  // Allow implicit conversion to std::any to allow direct use of any_cast.
  // NOLINTNEXTLINE(google-explicit-constructor)
  operator std::any&() { return value_; }
  // NOLINTNEXTLINE(google-explicit-constructor)
  operator const std::any&() const { return value_; }

#if defined(FLUTTER_ENABLE_RTTI) && FLUTTER_ENABLE_RTTI
  // Passthrough to std::any's type().
  const std::type_info& type() const noexcept { return value_.type(); }
#endif

  // This operator exists only to provide a stable ordering for use as a
  // std::map key, to satisfy the compiler requirements for EncodableValue.
  // It does not attempt to provide useful ordering semantics, and using a
  // custom value as a map key is not recommended.
  bool operator<(const CustomEncodableValue& other) const {
    return this < &other;
  }
  bool operator==(const CustomEncodableValue& other) const {
    return this == &other;
  }

 private:
  std::any value_;
};

class EncodableValue;

// Convenience type aliases.
using EncodableList = std::vector<EncodableValue>;
using EncodableMap = std::map<EncodableValue, EncodableValue>;

namespace internal {
// The base class for EncodableValue. Do not use this directly; it exists only
// for EncodableValue to inherit from.
//
// Do not change the order or indexes of the items here; see the comment on
// EncodableValue
using EncodableValueVariant = std::variant<std::monostate,
                                           bool,
                                           int32_t,
                                           int64_t,
                                           double,
                                           std::string,
                                           std::vector<uint8_t>,
                                           std::vector<int32_t>,
                                           std::vector<int64_t>,
                                           std::vector<double>,
                                           EncodableList,
                                           EncodableMap,
                                           CustomEncodableValue,
                                           std::vector<float>>;
}  // namespace internal

// An object that can contain any value or collection type supported by
// Flutter's standard method codec.
//
// For details, see:
// https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html
//
// As an example, the following Dart structure:
//   {
//     'flag': true,
//     'name': 'Thing',
//     'values': [1, 2.0, 4],
//   }
// would correspond to:
//   EncodableValue(EncodableMap{
//       {EncodableValue("flag"), EncodableValue(true)},
//       {EncodableValue("name"), EncodableValue("Thing")},
//       {EncodableValue("values"), EncodableValue(EncodableList{
//                                      EncodableValue(1),
//                                      EncodableValue(2.0),
//                                      EncodableValue(4),
//                                  })},
//   })
//
// The primary API surface for this object is std::variant. For instance,
// getting a string value from an EncodableValue, with type checking:
//   if (std::holds_alternative<std::string>(value)) {
//     std::string some_string = std::get<std::string>(value);
//   }
//
// The order/indexes of the variant types is part of the API surface, and is
// guaranteed not to change.
//
// The variant types are mapped with Dart types in following ways:
// std::monostate       -> null
// bool                 -> bool
// int32_t              -> int
// int64_t              -> int
// double               -> double
// std::string          -> String
// std::vector<uint8_t> -> Uint8List
// std::vector<int32_t> -> Int32List
// std::vector<int64_t> -> Int64List
// std::vector<float>   -> Float32List
// std::vector<double>  -> Float64List
// EncodableList        -> List
// EncodableMap         -> Map
class EncodableValue : public internal::EncodableValueVariant {
 public:
  // Rely on std::variant for most of the constructors/operators.
  using super = internal::EncodableValueVariant;
  using super::super;
  using super::operator=;

  explicit EncodableValue() = default;

  // Avoid the C++17 pitfall of conversion from char* to bool. Should not be
  // needed for C++20.
  explicit EncodableValue(const char* string) : super(std::string(string)) {}
  EncodableValue& operator=(const char* other) {
    *this = std::string(other);
    return *this;
  }

  // Allow implicit conversion from CustomEncodableValue; the only reason to
  // make a CustomEncodableValue (which can only be constructed explicitly) is
  // to use it with EncodableValue, so the risk of unintended conversions is
  // minimal, and it avoids the need for the verbose:
  //   EncodableValue(CustomEncodableValue(...)).
  // NOLINTNEXTLINE(google-explicit-constructor)
  EncodableValue(const CustomEncodableValue& v) : super(v) {}

  // Override the conversion constructors from std::variant to make them
  // explicit, to avoid implicit conversion.
  //
  // While implicit conversion can be convenient in some cases, it can have very
  // surprising effects. E.g., calling a function that takes an EncodableValue
  // but accidentally passing an EncodableValue* would, instead of failing to
  // compile, go through a pointer->bool->EncodableValue(bool) chain and
  // silently call the function with a temp-constructed EncodableValue(true).
  template <class T>
  constexpr explicit EncodableValue(T&& t) noexcept : super(t) {}

  // Returns true if the value is null. Convenience wrapper since unlike the
  // other types, std::monostate uses aren't self-documenting.
  bool IsNull() const { return std::holds_alternative<std::monostate>(*this); }

  // Convenience method to simplify handling objects received from Flutter
  // where the values may be larger than 32-bit, since they have the same type
  // on the Dart side, but will be either 32-bit or 64-bit here depending on
  // the value.
  //
  // Calling this method if the value doesn't contain either an int32_t or an
  // int64_t will throw an exception.
  int64_t LongValue() const {
    if (std::holds_alternative<int32_t>(*this)) {
      return std::get<int32_t>(*this);
    }
    return std::get<int64_t>(*this);
  }

// The C++ Standard Library implementations can get into issues with recursive
// constraint satisfaction when (among other things) objects of this type (which
// is an `std::variant` subclass) are put into containers like `std::vector`.
//
// A definition of `operator<` is provided to break that recursion. However, in
// C++20 with the latest compilers (Clang compilers newer than 20 and the latest
// GCC variants, see https://gcc.godbolt.org/z/KM6n6qane) requiring that that
// the `std::three_way_comparable` constraint be satisfied requires the
// provision of `operator<=>` to do the same thing.
//
// The code below makes this translation unit be safe to include from both C++17
// and C++20 translation units while also using the newest compilers.
//
// The correctness of the compiler's gripes with this code and the subsequent
// need for these workarounds is not fully understood or explored. If you run
// into issues with this code again, the following breadcrumbs may prove
// useful. If you cannot access some or all of these links, the compiler
// explorer link above should serve a reduced test case to base an investigation
// off of.
//
// * b/423885648#comment8
// * b/423885648#comment19
// * cl/542631351
// * cl/542541552
// * https://github.com/flutter/engine/pull/43091
//
#if __cplusplus >= 202002L
  friend std::partial_ordering operator<=>(const EncodableValue& lhs,
                                           const EncodableValue& rhs) {
    auto& lv = static_cast<const super&>(lhs);
    auto& rv = static_cast<const super&>(rhs);

    if (lv < rv) {
      return std::partial_ordering::less;
    }

    if (rv < lv) {
      return std::partial_ordering::greater;
    }

    if (lv == rv) {
      return std::partial_ordering::equivalent;
    }

    return std::partial_ordering::unordered;
  }
#else   //  __cplusplus >= 202002L
  friend bool operator<(const EncodableValue& lhs, const EncodableValue& rhs) {
    return static_cast<const super&>(lhs) < static_cast<const super&>(rhs);
  }
#endif  //  __cplusplus >= 202002L
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENCODABLE_VALUE_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\engine_method_result.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENGINE_METHOD_RESULT_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENGINE_METHOD_RESULT_H_

#include <memory>
#include <string>
#include <vector>

#include "binary_messenger.h"
#include "method_codec.h"
#include "method_result.h"

namespace flutter {

namespace internal {
// Manages the one-time sending of response data. This is an internal helper
// class for EngineMethodResult, separated out since the implementation doesn't
// vary based on the template type.
class ReplyManager {
 public:
  explicit ReplyManager(BinaryReply reply_handler_);
  ~ReplyManager();

  // Prevent copying.
  ReplyManager(ReplyManager const&) = delete;
  ReplyManager& operator=(ReplyManager const&) = delete;

  // Sends the given response data (which must either be nullptr, which
  // indicates an unhandled method, or a response serialized with |codec_|) to
  // the engine.
  void SendResponseData(const std::vector<uint8_t>* data);

 private:
  BinaryReply reply_handler_;
};
}  // namespace internal

// Implemention of MethodResult that sends a response to the Flutter engine
// exactly once, encoded using a given codec.
template <typename T>
class EngineMethodResult : public MethodResult<T> {
 public:
  // Creates a result object that will send results to |reply_handler|, encoded
  // using |codec|. The |codec| pointer must remain valid for as long as this
  // object exists.
  EngineMethodResult(BinaryReply reply_handler, const MethodCodec<T>* codec)
      : reply_manager_(
            std::make_unique<internal::ReplyManager>(std::move(reply_handler))),
        codec_(codec) {}

  ~EngineMethodResult() = default;

 protected:
  // |flutter::MethodResult|
  void SuccessInternal(const T* result) override {
    std::unique_ptr<std::vector<uint8_t>> data =
        codec_->EncodeSuccessEnvelope(result);
    reply_manager_->SendResponseData(data.get());
  }

  // |flutter::MethodResult|
  void ErrorInternal(const std::string& error_code,
                     const std::string& error_message,
                     const T* error_details) override {
    std::unique_ptr<std::vector<uint8_t>> data =
        codec_->EncodeErrorEnvelope(error_code, error_message, error_details);
    reply_manager_->SendResponseData(data.get());
  }

  // |flutter::MethodResult|
  void NotImplementedInternal() override {
    reply_manager_->SendResponseData(nullptr);
  }

 private:
  std::unique_ptr<internal::ReplyManager> reply_manager_;

  const MethodCodec<T>* codec_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_ENGINE_METHOD_RESULT_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\event_channel.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_CHANNEL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_CHANNEL_H_

#include <iostream>
#include <memory>
#include <string>

#include "binary_messenger.h"
#include "engine_method_result.h"
#include "event_sink.h"
#include "event_stream_handler.h"

namespace flutter {

class EncodableValue;

// A named channel for communicating with the Flutter application using
// asynchronous event streams. Incoming requests for event stream setup are
// decoded from binary on receipt, and C++ responses and events are encoded into
// binary before being transmitted back to Flutter. The MethodCodec used must be
// compatible with the one used by the Flutter application. This can be achieved
// by creating an EventChannel
// ("https://api.flutter.dev/flutter/services/EventChannel-class.html")
// counterpart of this channel on the Dart side.
// The C++ type of stream configuration arguments, events, and error details are
// templated, but only values supported by the specified MethodCodec can be
// used.
template <typename T = EncodableValue>
class EventChannel {
 public:
  // Creates an instance that sends and receives event handler on the channel
  // named |name|, encoded with |codec| and dispatched via |messenger|.
  EventChannel(BinaryMessenger* messenger,
               const std::string& name,
               const MethodCodec<T>* codec)
      : messenger_(messenger), name_(name), codec_(codec) {}
  ~EventChannel() = default;

  // Prevent copying.
  EventChannel(EventChannel const&) = delete;
  EventChannel& operator=(EventChannel const&) = delete;

  // Registers a stream handler on this channel.
  // If no handler has been registered, any incoming stream setup requests will
  // be handled silently by providing an empty stream.
  //
  // Note that the EventChannel does not own the handler and will not
  // unregister it on destruction. The caller is responsible for unregistering
  // the handler if it should no longer be called.
  void SetStreamHandler(std::unique_ptr<StreamHandler<T>> handler) {
    if (!handler) {
      messenger_->SetMessageHandler(name_, nullptr);
      return;
    }

    // std::function requires a copyable lambda, so convert to a shared pointer.
    // This is safe since only one copy of the shared_pointer will ever be
    // accessed.
    std::shared_ptr<StreamHandler<T>> shared_handler(handler.release());
    const MethodCodec<T>* codec = codec_;
    const std::string channel_name = name_;
    const BinaryMessenger* messenger = messenger_;
    BinaryMessageHandler binary_handler =
        [shared_handler, codec, channel_name, messenger,
         // Mutable state to track the handler's listening status.
         is_listening = false](const uint8_t* message,
                               const size_t message_size,
                               const BinaryReply& reply) mutable {
          constexpr char kOnListenMethod[] = "listen";
          constexpr char kOnCancelMethod[] = "cancel";

          std::unique_ptr<MethodCall<T>> method_call =
              codec->DecodeMethodCall(message, message_size);
          if (!method_call) {
            std::cerr
                << "Unable to construct method call from message on channel: "
                << channel_name << std::endl;
            reply(nullptr, 0);
            return;
          }

          const std::string& method = method_call->method_name();
          if (method.compare(kOnListenMethod) == 0) {
            if (is_listening) {
              std::unique_ptr<StreamHandlerError<T>> error =
                  shared_handler->OnCancel(nullptr);
              if (error) {
                std::cerr << "Failed to cancel existing stream: "
                          << (error->error_code) << ", "
                          << (error->error_message) << ", "
                          << (error->error_details);
              }
            }
            is_listening = true;

            std::unique_ptr<std::vector<uint8_t>> result;
            auto sink = std::make_unique<EventSinkImplementation>(
                messenger, channel_name, codec);
            std::unique_ptr<StreamHandlerError<T>> error =
                shared_handler->OnListen(method_call->arguments(),
                                         std::move(sink));
            if (error) {
              result = codec->EncodeErrorEnvelope(error->error_code,
                                                  error->error_message,
                                                  error->error_details.get());
            } else {
              result = codec->EncodeSuccessEnvelope();
            }
            reply(result->data(), result->size());
          } else if (method.compare(kOnCancelMethod) == 0) {
            std::unique_ptr<std::vector<uint8_t>> result;
            if (is_listening) {
              std::unique_ptr<StreamHandlerError<T>> error =
                  shared_handler->OnCancel(method_call->arguments());
              if (error) {
                result = codec->EncodeErrorEnvelope(error->error_code,
                                                    error->error_message,
                                                    error->error_details.get());
              } else {
                result = codec->EncodeSuccessEnvelope();
              }
              is_listening = false;
            } else {
              result = codec->EncodeErrorEnvelope(
                  "error", "No active stream to cancel", nullptr);
            }
            reply(result->data(), result->size());
          } else {
            reply(nullptr, 0);
          }
        };
    messenger_->SetMessageHandler(name_, std::move(binary_handler));
  }

 private:
  class EventSinkImplementation : public EventSink<T> {
   public:
    EventSinkImplementation(const BinaryMessenger* messenger,
                            const std::string& name,
                            const MethodCodec<T>* codec)
        : messenger_(messenger), name_(name), codec_(codec) {}
    ~EventSinkImplementation() = default;

    // Prevent copying.
    EventSinkImplementation(EventSinkImplementation const&) = delete;
    EventSinkImplementation& operator=(EventSinkImplementation const&) = delete;

   private:
    const BinaryMessenger* messenger_;
    const std::string name_;
    const MethodCodec<T>* codec_;

   protected:
    void SuccessInternal(const T* event = nullptr) override {
      auto result = codec_->EncodeSuccessEnvelope(event);
      messenger_->Send(name_, result->data(), result->size());
    }

    void ErrorInternal(const std::string& error_code,
                       const std::string& error_message,
                       const T* error_details) override {
      auto result =
          codec_->EncodeErrorEnvelope(error_code, error_message, error_details);
      messenger_->Send(name_, result->data(), result->size());
    }

    void EndOfStreamInternal() override { messenger_->Send(name_, nullptr, 0); }
  };

  BinaryMessenger* messenger_;
  const std::string name_;
  const MethodCodec<T>* codec_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_CHANNEL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\event_sink.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_SINK_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_SINK_H_

namespace flutter {

class EncodableValue;

// Event callback. Events to be sent to Flutter application
// act as clients of this interface for sending events.
template <typename T = EncodableValue>
class EventSink {
 public:
  EventSink() = default;
  virtual ~EventSink() = default;

  // Prevent copying.
  EventSink(EventSink const&) = delete;
  EventSink& operator=(EventSink const&) = delete;

  // Consumes a successful event
  void Success(const T& event) { SuccessInternal(&event); }

  // Consumes a successful event.
  void Success() { SuccessInternal(nullptr); }

  // Consumes an error event.
  void Error(const std::string& error_code,
             const std::string& error_message,
             const T& error_details) {
    ErrorInternal(error_code, error_message, &error_details);
  }

  // Consumes an error event.
  void Error(const std::string& error_code,
             const std::string& error_message = "") {
    ErrorInternal(error_code, error_message, nullptr);
  }

  // Consumes end of stream. Ensuing calls to Success() or
  // Error(), if any, are ignored.
  void EndOfStream() { EndOfStreamInternal(); }

 protected:
  // Implementation of the public interface, to be provided by subclasses.
  virtual void SuccessInternal(const T* event = nullptr) = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual void ErrorInternal(const std::string& error_code,
                             const std::string& error_message,
                             const T* error_details) = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual void EndOfStreamInternal() = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_SINK_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\event_stream_handler.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_H_

#include <memory>
#include <string>

#include "event_sink.h"

namespace flutter {

class EncodableValue;

template <typename T = EncodableValue>
struct StreamHandlerError {
  const std::string error_code;
  const std::string error_message;
  const std::unique_ptr<T> error_details;

  StreamHandlerError(const std::string& error_code,
                     const std::string& error_message,
                     std::unique_ptr<T>&& error_details)
      : error_code(error_code),
        error_message(error_message),
        error_details(std::move(error_details)) {}
};

// Handler for stream setup and teardown requests.
// Implementations must be prepared to accept sequences of alternating calls to
// OnListen() and OnCancel(). Implementations should ideally consume no
// resources when the last such call is not OnListen(). In typical situations,
// this means that the implementation should register itself with
// platform-specific event sources OnListen() and deregister again OnCancel().
template <typename T = EncodableValue>
class StreamHandler {
 public:
  StreamHandler() = default;
  virtual ~StreamHandler() = default;

  // Prevent copying.
  StreamHandler(StreamHandler const&) = delete;
  StreamHandler& operator=(StreamHandler const&) = delete;

  // Handles a request to set up an event stream. Returns nullptr on success,
  // or an error on failure.
  // |arguments| is stream configuration arguments and
  // |events| is an EventSink for emitting events to the Flutter receiver.
  std::unique_ptr<StreamHandlerError<T>> OnListen(
      const T* arguments,
      std::unique_ptr<EventSink<T>>&& events) {
    return OnListenInternal(arguments, std::move(events));
  }

  // Handles a request to tear down the most recently created event stream.
  // Returns nullptr on success, or an error on failure.
  // |arguments| is stream configuration arguments.
  std::unique_ptr<StreamHandlerError<T>> OnCancel(const T* arguments) {
    return OnCancelInternal(arguments);
  }

 protected:
  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<StreamHandlerError<T>> OnListenInternal(
      const T* arguments,
      std::unique_ptr<EventSink<T>>&& events) = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<StreamHandlerError<T>> OnCancelInternal(
      const T* arguments) = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\event_stream_handler_functions.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_FUNCTIONS_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_FUNCTIONS_H_

#include <memory>

#include "event_sink.h"
#include "event_stream_handler.h"

namespace flutter {

class EncodableValue;

// Handler types for each of the StreamHandler setup and teardown
// requests.
template <typename T>
using StreamHandlerListen =
    std::function<std::unique_ptr<StreamHandlerError<T>>(
        const T* arguments,
        std::unique_ptr<EventSink<T>>&& events)>;

template <typename T>
using StreamHandlerCancel =
    std::function<std::unique_ptr<StreamHandlerError<T>>(const T* arguments)>;

// An implementation of StreamHandler that pass calls through to
// provided function objects.
template <typename T = EncodableValue>
class StreamHandlerFunctions : public StreamHandler<T> {
 public:
  // Creates a handler object that calls the provided functions
  // for the corresponding StreamHandler outcomes.
  StreamHandlerFunctions(StreamHandlerListen<T> on_listen,
                         StreamHandlerCancel<T> on_cancel)
      : on_listen_(std::move(on_listen)), on_cancel_(std::move(on_cancel)) {}

  virtual ~StreamHandlerFunctions() = default;

  // Prevent copying.
  StreamHandlerFunctions(StreamHandlerFunctions const&) = delete;
  StreamHandlerFunctions& operator=(StreamHandlerFunctions const&) = delete;

 protected:
  // |flutter::StreamHandler|
  std::unique_ptr<StreamHandlerError<T>> OnListenInternal(
      const T* arguments,
      std::unique_ptr<EventSink<T>>&& events) override {
    if (on_listen_) {
      return on_listen_(arguments, std::move(events));
    }

    auto error = std::make_unique<StreamHandlerError<T>>(
        "error", "No OnListen handler set", nullptr);
    return std::move(error);
  }

  // |flutter::StreamHandler|
  std::unique_ptr<StreamHandlerError<T>> OnCancelInternal(
      const T* arguments) override {
    if (on_cancel_) {
      return on_cancel_(arguments);
    }

    auto error = std::make_unique<StreamHandlerError<T>>(
        "error", "No OnCancel handler set", nullptr);
    return std::move(error);
  }

  StreamHandlerListen<T> on_listen_;
  StreamHandlerCancel<T> on_cancel_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_EVENT_STREAM_HANDLER_FUNCTIONS_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\flutter_engine.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_ENGINE_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_ENGINE_H_

#include <flutter_windows.h>

#include <chrono>
#include <memory>
#include <optional>
#include <string>

#include "binary_messenger.h"
#include "dart_project.h"
#include "plugin_registrar.h"
#include "plugin_registry.h"

namespace flutter {

// An instance of a Flutter engine.
//
// In the future, this will be the API surface used for all interactions with
// the engine, rather than having them duplicated on FlutterViewController.
// For now it is only used in the rare case where you need a headless Flutter
// engine.
class FlutterEngine : public PluginRegistry {
 public:
  // Creates a new engine for running the given project.
  explicit FlutterEngine(const DartProject& project);

  virtual ~FlutterEngine();

  // Prevent copying.
  FlutterEngine(FlutterEngine const&) = delete;
  FlutterEngine& operator=(FlutterEngine const&) = delete;

  // Starts running the engine at the entrypoint function specified in the
  // DartProject used to configure the engine, or main() by default.
  bool Run();

  // Starts running the engine, with an optional entry point.
  //
  // If provided, entry_point must be the name of a top-level function from the
  // same Dart library that contains the app's main() function, and must be
  // decorated with `@pragma(vm:entry-point)` to ensure the method is not
  // tree-shaken by the Dart compiler. If not provided, defaults to main().
  bool Run(const char* entry_point);

  // Terminates the running engine.
  void ShutDown();

  // Processes any pending events in the Flutter engine, and returns the
  // nanosecond delay until the next scheduled event (or  max, if none).
  //
  // This should be called on every run of the application-level runloop, and
  // a wait for native events in the runloop should never be longer than the
  // last return value from this function.
  std::chrono::nanoseconds ProcessMessages();

  // Tells the engine that the system font list has changed. Should be called
  // by clients when OS-level font changes happen (e.g., WM_FONTCHANGE in a
  // Win32 application).
  void ReloadSystemFonts();

  // Tells the engine that the platform brightness value has changed. Should be
  // called by clients when OS-level theme changes happen (e.g.,
  // WM_DWMCOLORIZATIONCOLORCHANGED in a Win32 application).
  void ReloadPlatformBrightness();

  // flutter::PluginRegistry:
  FlutterDesktopPluginRegistrarRef GetRegistrarForPlugin(
      const std::string& plugin_name) override;

  // Returns the messenger to use for creating channels to communicate with the
  // Flutter engine.
  //
  // This pointer will remain valid for the lifetime of this instance.
  BinaryMessenger* messenger() { return messenger_.get(); }

  // Schedule a callback to be called after the next frame is drawn.
  //
  // This must be called from the platform thread. The callback is executed only
  // once on the platform thread.
  void SetNextFrameCallback(std::function<void()> callback);

  // Called to pass an external window message to the engine for lifecycle
  // state updates. Non-Flutter windows must call this method in their WndProc
  // in order to be included in the logic for application lifecycle state
  // updates. Returns a result if the message should be consumed.
  std::optional<LRESULT> ProcessExternalWindowMessage(HWND hwnd,
                                                      UINT message,
                                                      WPARAM wparam,
                                                      LPARAM lparam);

 private:
  // For access to the engine handle.
  friend class FlutterViewController;

  // Gives up ownership of |engine_|, but keeps a weak reference to it.
  //
  // This is intended to be used by FlutterViewController, since the underlying
  // C API for view controllers takes over engine ownership.
  FlutterDesktopEngineRef RelinquishEngine();

  // Handle for interacting with the C API's engine reference.
  FlutterDesktopEngineRef engine_ = nullptr;

  // Messenger for communicating with the engine.
  std::unique_ptr<BinaryMessenger> messenger_;

  // Whether or not this wrapper owns |engine_|.
  bool owns_engine_ = true;

  // Whether |Run| has been called successfully.
  //
  // This is used to improve error messages. This can be false while the engine
  // is running if the engine was started by creating a view.
  bool run_succeeded_ = false;

  // The callback to execute once the next frame is drawn.
  std::function<void()> next_frame_callback_ = nullptr;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_ENGINE_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\flutter_view.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_H_

#include <flutter_windows.h>

namespace flutter {

// The unique identifier for a view.
typedef int64_t FlutterViewId;

// A view displaying Flutter content.
class FlutterView {
 public:
  explicit FlutterView(FlutterDesktopViewRef view) : view_(view) {}

  // Destroys this reference to the view. The underlying view is not destroyed.
  virtual ~FlutterView() = default;

  // Prevent copying.
  FlutterView(FlutterView const&) = delete;
  FlutterView& operator=(FlutterView const&) = delete;

  // Returns the backing HWND for the view.
  HWND GetNativeWindow() { return FlutterDesktopViewGetHWND(view_); }

  // Returns the DXGI adapter used for rendering or nullptr in case of error.
  IDXGIAdapter* GetGraphicsAdapter() {
    return FlutterDesktopViewGetGraphicsAdapter(view_);
  }

 private:
  // Handle for interacting with the C API's view.
  FlutterDesktopViewRef view_ = nullptr;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\flutter_view_controller.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_CONTROLLER_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_CONTROLLER_H_

#include <flutter_windows.h>
#include <windows.h>

#include <memory>
#include <optional>

#include "dart_project.h"
#include "flutter_engine.h"
#include "flutter_view.h"

namespace flutter {

// A controller for a view displaying Flutter content.
//
// This is the primary wrapper class for the desktop C API.
// If you use this class, you should not call any of the setup or teardown
// methods in the C API directly, as this class will do that internally.
class FlutterViewController {
 public:
  // Creates a FlutterView that can be parented into a Windows View hierarchy
  // either using HWNDs.
  //
  // This also creates a new FlutterEngine.
  //
  // |dart_project| will be used to configure the engine backing this view.
  FlutterViewController(int width, int height, const DartProject& project);

  virtual ~FlutterViewController();

  // Prevent copying.
  FlutterViewController(FlutterViewController const&) = delete;
  FlutterViewController& operator=(FlutterViewController const&) = delete;

  // Returns the view controller's view ID.
  FlutterViewId view_id() const;

  // Returns the engine running Flutter content in this view.
  FlutterEngine* engine() const { return engine_.get(); }

  // Returns the view managed by this controller.
  FlutterView* view() const { return view_.get(); }

  // Requests new frame from the engine and repaints the view.
  void ForceRedraw();

  // Allows the Flutter engine and any interested plugins an opportunity to
  // handle the given message.
  //
  // If a result is returned, then the message was handled in such a way that
  // further handling should not be done.
  std::optional<LRESULT> HandleTopLevelWindowProc(HWND hwnd,
                                                  UINT message,
                                                  WPARAM wparam,
                                                  LPARAM lparam);

 private:
  // Handle for interacting with the C API's view controller, if any.
  FlutterDesktopViewControllerRef controller_ = nullptr;

  // The backing engine
  std::shared_ptr<FlutterEngine> engine_;

  // The owned FlutterView.
  std::unique_ptr<FlutterView> view_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_FLUTTER_VIEW_CONTROLLER_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\message_codec.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_MESSAGE_CODEC_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_MESSAGE_CODEC_H_

#include <memory>
#include <string>
#include <vector>

namespace flutter {

// Translates between a binary message and higher-level method call and
// response/error objects.
template <typename T>
class MessageCodec {
 public:
  MessageCodec() = default;

  virtual ~MessageCodec() = default;

  // Prevent copying.
  MessageCodec(MessageCodec<T> const&) = delete;
  MessageCodec& operator=(MessageCodec<T> const&) = delete;

  // Returns the message encoded in |binary_message|, or nullptr if it cannot be
  // decoded by this codec.
  std::unique_ptr<T> DecodeMessage(const uint8_t* binary_message,
                                   const size_t message_size) const {
    return std::move(DecodeMessageInternal(binary_message, message_size));
  }

  // Returns the message encoded in |binary_message|, or nullptr if it cannot be
  // decoded by this codec.
  std::unique_ptr<T> DecodeMessage(
      const std::vector<uint8_t>& binary_message) const {
    size_t size = binary_message.size();
    const uint8_t* data = size > 0 ? &binary_message[0] : nullptr;
    return std::move(DecodeMessageInternal(data, size));
  }

  // Returns a binary encoding of the given |message|, or nullptr if the
  // message cannot be serialized by this codec.
  std::unique_ptr<std::vector<uint8_t>> EncodeMessage(const T& message) const {
    return std::move(EncodeMessageInternal(message));
  }

 protected:
  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<T> DecodeMessageInternal(
      const uint8_t* binary_message,
      const size_t message_size) const = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<std::vector<uint8_t>> EncodeMessageInternal(
      const T& message) const = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_MESSAGE_CODEC_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\method_call.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CALL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CALL_H_

#include <memory>
#include <string>

namespace flutter {

class EncodableValue;

// An object encapsulating a method call from Flutter whose arguments are of
// type T.
template <typename T = EncodableValue>
class MethodCall {
 public:
  // Creates a MethodCall with the given name and arguments.
  MethodCall(const std::string& method_name, std::unique_ptr<T> arguments)
      : method_name_(method_name), arguments_(std::move(arguments)) {}

  virtual ~MethodCall() = default;

  // Prevent copying.
  MethodCall(MethodCall<T> const&) = delete;
  MethodCall& operator=(MethodCall<T> const&) = delete;

  // The name of the method being called.
  const std::string& method_name() const { return method_name_; }

  // The arguments to the method call, or NULL if there are none.
  const T* arguments() const { return arguments_.get(); }

 private:
  std::string method_name_;
  std::unique_ptr<T> arguments_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CALL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\method_channel.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CHANNEL_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CHANNEL_H_

#include <iostream>
#include <string>

#include "basic_message_channel.h"
#include "binary_messenger.h"
#include "engine_method_result.h"
#include "method_call.h"
#include "method_codec.h"
#include "method_result.h"

namespace flutter {

class EncodableValue;

// A handler for receiving a method call from the Flutter engine.
//
// Implementations must asynchronously call exactly one of the methods on
// |result| to indicate the result of the method call.
template <typename T>
using MethodCallHandler =
    std::function<void(const MethodCall<T>& call,
                       std::unique_ptr<MethodResult<T>> result)>;

// A channel for communicating with the Flutter engine using invocation of
// asynchronous methods.
template <typename T = EncodableValue>
class MethodChannel {
 public:
  // Creates an instance that sends and receives method calls on the channel
  // named |name|, encoded with |codec| and dispatched via |messenger|.
  MethodChannel(BinaryMessenger* messenger,
                const std::string& name,
                const MethodCodec<T>* codec)
      : messenger_(messenger), name_(name), codec_(codec) {}

  ~MethodChannel() = default;

  // Prevent copying.
  MethodChannel(MethodChannel const&) = delete;
  MethodChannel& operator=(MethodChannel const&) = delete;

  // Sends a message to the Flutter engine on this channel.
  //
  // If |result| is provided, one of its methods will be invoked with the
  // response from the engine.
  void InvokeMethod(const std::string& method,
                    std::unique_ptr<T> arguments,
                    std::unique_ptr<MethodResult<T>> result = nullptr) {
    MethodCall<T> method_call(method, std::move(arguments));
    std::unique_ptr<std::vector<uint8_t>> message =
        codec_->EncodeMethodCall(method_call);
    if (!result) {
      messenger_->Send(name_, message->data(), message->size(), nullptr);
      return;
    }

    // std::function requires a copyable lambda, so convert to a shared pointer.
    // This is safe since only one copy of the shared_pointer will ever be
    // accessed.
    std::shared_ptr<MethodResult<T>> shared_result(result.release());
    const auto* codec = codec_;
    std::string channel_name = name_;
    BinaryReply reply_handler = [shared_result, codec, channel_name](
                                    const uint8_t* reply, size_t reply_size) {
      if (reply_size == 0) {
        shared_result->NotImplemented();
        return;
      }
      // Use this channel's codec to decode and handle the
      // reply.
      bool decoded = codec->DecodeAndProcessResponseEnvelope(
          reply, reply_size, shared_result.get());
      if (!decoded) {
        std::cerr << "Unable to decode reply to method "
                     "invocation on channel "
                  << channel_name << std::endl;
        shared_result->NotImplemented();
      }
    };

    messenger_->Send(name_, message->data(), message->size(),
                     std::move(reply_handler));
  }

  // Registers a handler that should be called any time a method call is
  // received on this channel. A null handler will remove any previous handler.
  //
  // The handler will be owned by the underlying BinaryMessageHandler.
  // Destroying the MethodChannel will not unregister the handler, so
  // the caller is responsible for unregistering explicitly if the handler
  // stops being valid before the engine is destroyed.
  void SetMethodCallHandler(const MethodCallHandler<T>& handler) const {
    if (!handler) {
      messenger_->SetMessageHandler(name_, nullptr);
      return;
    }
    const auto* codec = codec_;
    std::string channel_name = name_;
    BinaryMessageHandler binary_handler = [handler, codec, channel_name](
                                              const uint8_t* message,
                                              size_t message_size,
                                              BinaryReply reply) {
      // Use this channel's codec to decode the call and build a result handler.
      auto result =
          std::make_unique<EngineMethodResult<T>>(std::move(reply), codec);
      std::unique_ptr<MethodCall<T>> method_call =
          codec->DecodeMethodCall(message, message_size);
      if (!method_call) {
        std::cerr << "Unable to construct method call from message on channel "
                  << channel_name << std::endl;
        result->NotImplemented();
        return;
      }
      handler(*method_call, std::move(result));
    };
    messenger_->SetMessageHandler(name_, std::move(binary_handler));
  }

  // Adjusts the number of messages that will get buffered when sending messages
  // to channels that aren't fully set up yet. For example, the engine isn't
  // running yet or the channel's message handler isn't set up on the Dart side
  // yet.
  void Resize(int new_size) {
    internal::ResizeChannel(messenger_, name_, new_size);
  }

  // Defines whether the channel should show warning messages when discarding
  // messages due to overflow.
  //
  // When |warns| is false, the channel is expected to overflow and warning
  // messages will not be shown.
  void SetWarnsOnOverflow(bool warns) {
    internal::SetChannelWarnsOnOverflow(messenger_, name_, warns);
  }

 private:
  BinaryMessenger* messenger_;
  std::string name_;
  const MethodCodec<T>* codec_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CHANNEL_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\method_codec.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CODEC_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CODEC_H_

#include <memory>
#include <string>
#include <vector>

#include "method_call.h"
#include "method_result.h"

namespace flutter {

// Translates between a binary message and higher-level method call and
// response/error objects.
template <typename T>
class MethodCodec {
 public:
  MethodCodec() = default;

  virtual ~MethodCodec() = default;

  // Prevent copying.
  MethodCodec(MethodCodec<T> const&) = delete;
  MethodCodec& operator=(MethodCodec<T> const&) = delete;

  // Returns the MethodCall encoded in |message|, or nullptr if it cannot be
  // decoded.
  std::unique_ptr<MethodCall<T>> DecodeMethodCall(const uint8_t* message,
                                                  size_t message_size) const {
    return std::move(DecodeMethodCallInternal(message, message_size));
  }

  // Returns the MethodCall encoded in |message|, or nullptr if it cannot be
  // decoded.
  std::unique_ptr<MethodCall<T>> DecodeMethodCall(
      const std::vector<uint8_t>& message) const {
    size_t size = message.size();
    const uint8_t* data = size > 0 ? &message[0] : nullptr;
    return std::move(DecodeMethodCallInternal(data, size));
  }

  // Returns a binary encoding of the given |method_call|, or nullptr if the
  // method call cannot be serialized by this codec.
  std::unique_ptr<std::vector<uint8_t>> EncodeMethodCall(
      const MethodCall<T>& method_call) const {
    return std::move(EncodeMethodCallInternal(method_call));
  }

  // Returns a binary encoding of |result|. |result| must be a type supported
  // by the codec.
  std::unique_ptr<std::vector<uint8_t>> EncodeSuccessEnvelope(
      const T* result = nullptr) const {
    return std::move(EncodeSuccessEnvelopeInternal(result));
  }

  // Returns a binary encoding of |error|. The |error_details| must be a type
  // supported by the codec.
  std::unique_ptr<std::vector<uint8_t>> EncodeErrorEnvelope(
      const std::string& error_code,
      const std::string& error_message = "",
      const T* error_details = nullptr) const {
    return std::move(
        EncodeErrorEnvelopeInternal(error_code, error_message, error_details));
  }

  // Decodes the response envelope encoded in |response|, calling the
  // appropriate method on |result|.
  //
  // Returns false if |response| cannot be decoded. In that case the caller is
  // responsible for calling a |result| method.
  bool DecodeAndProcessResponseEnvelope(const uint8_t* response,
                                        size_t response_size,
                                        MethodResult<T>* result) const {
    return DecodeAndProcessResponseEnvelopeInternal(response, response_size,
                                                    result);
  }

 protected:
  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<MethodCall<T>> DecodeMethodCallInternal(
      const uint8_t* message,
      size_t message_size) const = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<std::vector<uint8_t>> EncodeMethodCallInternal(
      const MethodCall<T>& method_call) const = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<std::vector<uint8_t>> EncodeSuccessEnvelopeInternal(
      const T* result) const = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual std::unique_ptr<std::vector<uint8_t>> EncodeErrorEnvelopeInternal(
      const std::string& error_code,
      const std::string& error_message,
      const T* error_details) const = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual bool DecodeAndProcessResponseEnvelopeInternal(
      const uint8_t* response,
      size_t response_size,
      MethodResult<T>* result) const = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_CODEC_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\method_result.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_H_

#include <string>

namespace flutter {

class EncodableValue;

// Encapsulates a result returned from a MethodCall. Only one method should be
// called on any given instance.
template <typename T = EncodableValue>
class MethodResult {
 public:
  MethodResult() = default;

  virtual ~MethodResult() = default;

  // Prevent copying.
  MethodResult(MethodResult const&) = delete;
  MethodResult& operator=(MethodResult const&) = delete;

  // Sends a success response, indicating that the call completed successfully
  // with the given result.
  void Success(const T& result) { SuccessInternal(&result); }

  // Sends a success response, indicating that the call completed successfully
  // with no result.
  void Success() { SuccessInternal(nullptr); }

  // Sends an error response, indicating that the call was understood but
  // handling failed in some way.
  //
  // error_code: A string error code describing the error.
  // error_message: A user-readable error message.
  // error_details: Arbitrary extra details about the error.
  void Error(const std::string& error_code,
             const std::string& error_message,
             const T& error_details) {
    ErrorInternal(error_code, error_message, &error_details);
  }

  // Sends an error response, indicating that the call was understood but
  // handling failed in some way.
  //
  // error_code: A string error code describing the error.
  // error_message: A user-readable error message (optional).
  void Error(const std::string& error_code,
             const std::string& error_message = "") {
    ErrorInternal(error_code, error_message, nullptr);
  }

  // Sends a not-implemented response, indicating that the method either was not
  // recognized, or has not been implemented.
  void NotImplemented() { NotImplementedInternal(); }

 protected:
  // Implementation of the public interface, to be provided by subclasses.
  virtual void SuccessInternal(const T* result) = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual void ErrorInternal(const std::string& error_code,
                             const std::string& error_message,
                             const T* error_details) = 0;

  // Implementation of the public interface, to be provided by subclasses.
  virtual void NotImplementedInternal() = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\method_result_functions.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_FUNCTIONS_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_FUNCTIONS_H_

#include <functional>
#include <string>
#include <utility>

#include "method_result.h"

namespace flutter {

class EncodableValue;

// Handler types for each of the MethodResult outcomes.
template <typename T>
using ResultHandlerSuccess = std::function<void(const T* result)>;
template <typename T>
using ResultHandlerError = std::function<void(const std::string& error_code,
                                              const std::string& error_message,
                                              const T* error_details)>;
template <typename T>
using ResultHandlerNotImplemented = std::function<void()>;

// An implementation of MethodResult that pass calls through to provided
// function objects, for ease of constructing one-off result handlers.
template <typename T = EncodableValue>
class MethodResultFunctions : public MethodResult<T> {
 public:
  // Creates a result object that calls the provided functions for the
  // corresponding MethodResult outcomes.
  MethodResultFunctions(ResultHandlerSuccess<T> on_success,
                        ResultHandlerError<T> on_error,
                        ResultHandlerNotImplemented<T> on_not_implemented)
      : on_success_(std::move(on_success)),
        on_error_(std::move(on_error)),
        on_not_implemented_(std::move(on_not_implemented)) {}

  virtual ~MethodResultFunctions() = default;

  // Prevent copying.
  MethodResultFunctions(MethodResultFunctions const&) = delete;
  MethodResultFunctions& operator=(MethodResultFunctions const&) = delete;

 protected:
  // |flutter::MethodResult|
  void SuccessInternal(const T* result) override {
    if (on_success_) {
      on_success_(result);
    }
  }

  // |flutter::MethodResult|
  void ErrorInternal(const std::string& error_code,
                     const std::string& error_message,
                     const T* error_details) override {
    if (on_error_) {
      on_error_(error_code, error_message, error_details);
    }
  }

  // |flutter::MethodResult|
  void NotImplementedInternal() override {
    if (on_not_implemented_) {
      on_not_implemented_();
    }
  }

 private:
  ResultHandlerSuccess<T> on_success_;
  ResultHandlerError<T> on_error_;
  ResultHandlerNotImplemented<T> on_not_implemented_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_METHOD_RESULT_FUNCTIONS_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\plugin_registrar.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_H_

#include <flutter_plugin_registrar.h>

#include <map>
#include <memory>
#include <set>
#include <string>

#include "binary_messenger.h"
#include "texture_registrar.h"

namespace flutter {

class Plugin;

// A object managing the registration of a plugin for various events.
//
// Currently this class has very limited functionality, but is expected to
// expand over time to more closely match the functionality of
// the Flutter mobile plugin APIs' plugin registrars.
class PluginRegistrar {
 public:
  // Creates a new PluginRegistrar. |core_registrar| and the messenger it
  // provides must remain valid as long as this object exists.
  explicit PluginRegistrar(FlutterDesktopPluginRegistrarRef core_registrar);

  virtual ~PluginRegistrar();

  // Prevent copying.
  PluginRegistrar(PluginRegistrar const&) = delete;
  PluginRegistrar& operator=(PluginRegistrar const&) = delete;

  // Returns the messenger to use for creating channels to communicate with the
  // Flutter engine.
  //
  // This pointer will remain valid for the lifetime of this instance.
  BinaryMessenger* messenger() { return messenger_.get(); }

  // Returns the texture registrar to use for the plugin to render a pixel
  // buffer.
  TextureRegistrar* texture_registrar() { return texture_registrar_.get(); }

  // Takes ownership of |plugin|.
  //
  // Plugins are not required to call this method if they have other lifetime
  // management, but this is a convenient place for plugins to be owned to
  // ensure that they stay valid for any registered callbacks.
  void AddPlugin(std::unique_ptr<Plugin> plugin);

 protected:
  FlutterDesktopPluginRegistrarRef registrar() const { return registrar_; }

  // Destroys all owned plugins. Subclasses should call this at the beginning of
  // their destructors to prevent the possibility of an owned plugin trying to
  // access destroyed state during its own destruction.
  void ClearPlugins();

 private:
  // Handle for interacting with the C API's registrar.
  FlutterDesktopPluginRegistrarRef registrar_;

  std::unique_ptr<BinaryMessenger> messenger_;

  std::unique_ptr<TextureRegistrar> texture_registrar_;

  // Plugins registered for ownership.
  std::set<std::unique_ptr<Plugin>> plugins_;
};

// A plugin that can be registered for ownership by a PluginRegistrar.
class Plugin {
 public:
  virtual ~Plugin() = default;
};

// A singleton to own PluginRegistrars. This is intended for use in plugins,
// where there is no higher-level object to own a PluginRegistrar that can
// own plugin instances and ensure that they live as long as the engine they
// are registered with.
class PluginRegistrarManager {
 public:
  static PluginRegistrarManager* GetInstance();

  // Prevent copying.
  PluginRegistrarManager(PluginRegistrarManager const&) = delete;
  PluginRegistrarManager& operator=(PluginRegistrarManager const&) = delete;

  // Returns a plugin registrar wrapper of type T, which must be a kind of
  // PluginRegistrar, creating it if necessary. The returned registrar will
  // live as long as the underlying FlutterDesktopPluginRegistrarRef, so
  // can be used to own plugin instances.
  //
  // Calling this multiple times for the same registrar_ref with different
  // template types results in undefined behavior.
  template <class T>
  T* GetRegistrar(FlutterDesktopPluginRegistrarRef registrar_ref) {
    auto insert_result =
        registrars_.emplace(registrar_ref, std::make_unique<T>(registrar_ref));
    auto& registrar_pair = *(insert_result.first);
    FlutterDesktopPluginRegistrarSetDestructionHandler(registrar_pair.first,
                                                       OnRegistrarDestroyed);
    return static_cast<T*>(registrar_pair.second.get());
  }

  // Destroys all registrar wrappers created by the manager.
  //
  // This is intended primarily for use in tests.
  void Reset() { registrars_.clear(); }

 private:
  PluginRegistrarManager();

  using WrapperMap = std::map<FlutterDesktopPluginRegistrarRef,
                              std::unique_ptr<PluginRegistrar>>;

  static void OnRegistrarDestroyed(FlutterDesktopPluginRegistrarRef registrar);

  WrapperMap* registrars() { return &registrars_; }

  WrapperMap registrars_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\plugin_registrar_windows.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_WINDOWS_H_
#define FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_WINDOWS_H_

#include <flutter_windows.h>
#include <windows.h>

#include <memory>
#include <optional>

#include "flutter_view.h"
#include "plugin_registrar.h"

namespace flutter {

// A delegate callback for WindowProc delegation.
//
// Implementations should return a value only if they have handled the message
// and want to stop all further handling.
using WindowProcDelegate = std::function<std::optional<
    LRESULT>(HWND hwnd, UINT message, WPARAM wparam, LPARAM lparam)>;

// An extension to PluginRegistrar providing access to Windows-specific
// functionality.
class PluginRegistrarWindows : public PluginRegistrar {
 public:
  // Creates a new PluginRegistrar. |core_registrar| and the messenger it
  // provides must remain valid as long as this object exists.
  explicit PluginRegistrarWindows(
      FlutterDesktopPluginRegistrarRef core_registrar)
      : PluginRegistrar(core_registrar) {
    FlutterDesktopViewRef implicit_view =
        FlutterDesktopPluginRegistrarGetView(core_registrar);
    if (implicit_view) {
      implicit_view_ = std::make_unique<FlutterView>(implicit_view);
    }
  }

  virtual ~PluginRegistrarWindows() {
    // Must be the first call.
    ClearPlugins();
    // Explicitly cleared to facilitate destruction order testing.
    implicit_view_.reset();
  }

  // Prevent copying.
  PluginRegistrarWindows(PluginRegistrarWindows const&) = delete;
  PluginRegistrarWindows& operator=(PluginRegistrarWindows const&) = delete;

  // Returns the implicit view, or nullptr if there is no implicit view.
  //
  // See:
  // https://api.flutter.dev/flutter/dart-ui/PlatformDispatcher/implicitView.html
  //
  // DEPRECATED: Use |GetViewById| instead.
  FlutterView* GetView() { return implicit_view_.get(); }

  // Returns the view with the given ID, or nullptr if the view does not exist.
  //
  // Destroying the shared pointer destroys the reference to the view; it does
  // not destroy the underlying view.
  std::shared_ptr<FlutterView> GetViewById(FlutterViewId view_id) const {
    FlutterDesktopViewRef view =
        FlutterDesktopPluginRegistrarGetViewById(registrar(), view_id);
    if (!view) {
      return nullptr;
    }

    return std::make_shared<FlutterView>(view);
  }

  // Registers |delegate| to receive WindowProc callbacks for the top-level
  // window containing this Flutter instance. Returns an ID that can be used to
  // unregister the handler.
  //
  // Delegates are not guaranteed to be called:
  // - The application may choose not to delegate WindowProc calls.
  // - If multiple plugins are registered, the first one that returns a value
  //   from the delegate message will "win", and others will not be called.
  //   The order of delegate calls is not defined.
  //
  // Delegates should be implemented as narrowly as possible, only returning
  // a value in cases where it's important that other delegates not run, to
  // minimize the chances of conflicts between plugins.
  int RegisterTopLevelWindowProcDelegate(WindowProcDelegate delegate) {
    if (window_proc_delegates_.empty()) {
      FlutterDesktopPluginRegistrarRegisterTopLevelWindowProcDelegate(
          registrar(), PluginRegistrarWindows::OnTopLevelWindowProc, this);
    }
    int delegate_id = next_window_proc_delegate_id_++;
    window_proc_delegates_.emplace(delegate_id, std::move(delegate));
    return delegate_id;
  }

  // Unregisters a previously registered delegate.
  void UnregisterTopLevelWindowProcDelegate(int proc_id) {
    window_proc_delegates_.erase(proc_id);
    if (window_proc_delegates_.empty()) {
      FlutterDesktopPluginRegistrarUnregisterTopLevelWindowProcDelegate(
          registrar(), PluginRegistrarWindows::OnTopLevelWindowProc);
    }
  }

 private:
  // A FlutterDesktopWindowProcCallback implementation that forwards back to
  // a PluginRegistarWindows instance provided as |user_data|.
  static bool OnTopLevelWindowProc(HWND hwnd,
                                   UINT message,
                                   WPARAM wparam,
                                   LPARAM lparam,
                                   void* user_data,
                                   LRESULT* result) {
    const auto* registrar = static_cast<PluginRegistrarWindows*>(user_data);
    std::optional optional_result = registrar->CallTopLevelWindowProcDelegates(
        hwnd, message, wparam, lparam);
    if (optional_result) {
      *result = *optional_result;
    }
    return optional_result.has_value();
  }

  std::optional<LRESULT> CallTopLevelWindowProcDelegates(HWND hwnd,
                                                         UINT message,
                                                         WPARAM wparam,
                                                         LPARAM lparam) const {
    std::optional<LRESULT> result;
    for (const auto& pair : window_proc_delegates_) {
      result = pair.second(hwnd, message, wparam, lparam);
      // Stop as soon as any delegate indicates that it has handled the message.
      if (result) {
        break;
      }
    }
    return result;
  }

  // The associated FlutterView, if any.
  std::unique_ptr<FlutterView> implicit_view_;

  // The next ID to return from RegisterWindowProcDelegate.
  int next_window_proc_delegate_id_ = 1;

  std::map<int, WindowProcDelegate> window_proc_delegates_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_WINDOWS_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRAR_WINDOWS_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\plugin_registry.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRY_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRY_H_

#include <string>

#include <flutter_plugin_registrar.h>

namespace flutter {

// Vends PluginRegistrars for named plugins.
//
// Plugins are identified by unique string keys, typically the name of the
// plugin's main class.
class PluginRegistry {
 public:
  PluginRegistry() = default;
  virtual ~PluginRegistry() = default;

  // Prevent copying.
  PluginRegistry(PluginRegistry const&) = delete;
  PluginRegistry& operator=(PluginRegistry const&) = delete;

  // Returns the FlutterDesktopPluginRegistrarRef to register a plugin with the
  // given name.
  //
  // The name must be unique across the application.
  virtual FlutterDesktopPluginRegistrarRef GetRegistrarForPlugin(
      const std::string& plugin_name) = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_PLUGIN_REGISTRY_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\standard_codec_serializer.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_CODEC_SERIALIZER_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_CODEC_SERIALIZER_H_

#include "byte_streams.h"
#include "encodable_value.h"

namespace flutter {

// Encapsulates the logic for encoding/decoding EncodableValues to/from the
// standard codec binary representation.
//
// This can be subclassed to extend the standard codec with support for new
// types.
class StandardCodecSerializer {
 public:
  virtual ~StandardCodecSerializer();

  // Returns the shared serializer instance.
  static const StandardCodecSerializer& GetInstance();

  // Prevent copying.
  StandardCodecSerializer(StandardCodecSerializer const&) = delete;
  StandardCodecSerializer& operator=(StandardCodecSerializer const&) = delete;

  // Reads and returns the next value from |stream|.
  EncodableValue ReadValue(ByteStreamReader* stream) const;

  // Writes the encoding of |value| to |stream|, including the initial type
  // discrimination byte.
  //
  // Can be overridden by a subclass to extend the codec.
  virtual void WriteValue(const EncodableValue& value,
                          ByteStreamWriter* stream) const;

 protected:
  // Codecs require long-lived serializers, so clients should always use
  // GetInstance().
  StandardCodecSerializer();

  // Reads and returns the next value from |stream|, whose discrimination byte
  // was |type|.
  //
  // The discrimination byte will already have been read from the stream when
  // this is called.
  //
  // Can be overridden by a subclass to extend the codec.
  virtual EncodableValue ReadValueOfType(uint8_t type,
                                         ByteStreamReader* stream) const;

  // Reads the variable-length size from the current position in |stream|.
  size_t ReadSize(ByteStreamReader* stream) const;

  // Writes the variable-length size encoding to |stream|.
  void WriteSize(size_t size, ByteStreamWriter* stream) const;

 private:
  // Reads a fixed-type list whose values are of type T from the current
  // position in |stream|, and returns it as the corresponding EncodableValue.
  // |T| must correspond to one of the supported list value types of
  // EncodableValue.
  template <typename T>
  EncodableValue ReadVector(ByteStreamReader* stream) const;

  // Writes |vector| to |stream| as a fixed-type list. |T| must correspond to
  // one of the supported list value types of EncodableValue.
  template <typename T>
  void WriteVector(const std::vector<T> vector, ByteStreamWriter* stream) const;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_CODEC_SERIALIZER_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\standard_message_codec.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_MESSAGE_CODEC_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_MESSAGE_CODEC_H_

#include <memory>

#include "encodable_value.h"
#include "message_codec.h"
#include "standard_codec_serializer.h"

namespace flutter {

// A binary message encoding/decoding mechanism for communications to/from the
// Flutter engine via message channels.
class StandardMessageCodec : public MessageCodec<EncodableValue> {
 public:
  // Returns an instance of the codec, optionally using a custom serializer to
  // add support for more types.
  //
  // If provided, |serializer| must be long-lived. If no serializer is provided,
  // the default will be used.
  //
  // The instance returned for a given |serializer| will be shared, and
  // any instance returned from this will be long-lived, and can be safely
  // passed to, e.g., channel constructors.
  static const StandardMessageCodec& GetInstance(
      const StandardCodecSerializer* serializer = nullptr);

  ~StandardMessageCodec();

  // Prevent copying.
  StandardMessageCodec(StandardMessageCodec const&) = delete;
  StandardMessageCodec& operator=(StandardMessageCodec const&) = delete;

 protected:
  // |flutter::MessageCodec|
  std::unique_ptr<EncodableValue> DecodeMessageInternal(
      const uint8_t* binary_message,
      const size_t message_size) const override;

  // |flutter::MessageCodec|
  std::unique_ptr<std::vector<uint8_t>> EncodeMessageInternal(
      const EncodableValue& message) const override;

 private:
  // Instances should be obtained via GetInstance.
  explicit StandardMessageCodec(const StandardCodecSerializer* serializer);

  const StandardCodecSerializer* serializer_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_MESSAGE_CODEC_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\standard_method_codec.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_METHOD_CODEC_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_METHOD_CODEC_H_

#include <memory>

#include "encodable_value.h"
#include "method_call.h"
#include "method_codec.h"
#include "standard_codec_serializer.h"

namespace flutter {

// An implementation of MethodCodec that uses a binary serialization.
class StandardMethodCodec : public MethodCodec<EncodableValue> {
 public:
  // Returns an instance of the codec, optionally using a custom serializer to
  // add support for more types.
  //
  // If provided, |serializer| must be long-lived. If no serializer is provided,
  // the default will be used.
  //
  // The instance returned for a given |extension| will be shared, and
  // any instance returned from this will be long-lived, and can be safely
  // passed to, e.g., channel constructors.
  static const StandardMethodCodec& GetInstance(
      const StandardCodecSerializer* serializer = nullptr);

  ~StandardMethodCodec();

  // Prevent copying.
  StandardMethodCodec(StandardMethodCodec const&) = delete;
  StandardMethodCodec& operator=(StandardMethodCodec const&) = delete;

 protected:
  // |flutter::MethodCodec|
  std::unique_ptr<MethodCall<EncodableValue>> DecodeMethodCallInternal(
      const uint8_t* message,
      size_t message_size) const override;

  // |flutter::MethodCodec|
  std::unique_ptr<std::vector<uint8_t>> EncodeMethodCallInternal(
      const MethodCall<EncodableValue>& method_call) const override;

  // |flutter::MethodCodec|
  std::unique_ptr<std::vector<uint8_t>> EncodeSuccessEnvelopeInternal(
      const EncodableValue* result) const override;

  // |flutter::MethodCodec|
  std::unique_ptr<std::vector<uint8_t>> EncodeErrorEnvelopeInternal(
      const std::string& error_code,
      const std::string& error_message,
      const EncodableValue* error_details) const override;

  // |flutter::MethodCodec|
  bool DecodeAndProcessResponseEnvelopeInternal(
      const uint8_t* response,
      size_t response_size,
      MethodResult<EncodableValue>* result) const override;

 private:
  // Instances should be obtained via GetInstance.
  explicit StandardMethodCodec(const StandardCodecSerializer* serializer);

  const StandardCodecSerializer* serializer_;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_STANDARD_METHOD_CODEC_H_

```

---
## File: windows\flutter\ephemeral\cpp_client_wrapper\include\flutter\texture_registrar.h
```h
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_TEXTURE_REGISTRAR_H_
#define FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_TEXTURE_REGISTRAR_H_

#include <flutter_texture_registrar.h>

#include <cstdint>
#include <functional>
#include <memory>
#include <utility>
#include <variant>

namespace flutter {

// A pixel buffer texture.
class PixelBufferTexture {
 public:
  // A callback used for retrieving pixel buffers.
  typedef std::function<const FlutterDesktopPixelBuffer*(size_t width,
                                                         size_t height)>
      CopyBufferCallback;

  // Creates a pixel buffer texture that uses the provided |copy_buffer_cb| to
  // retrieve the buffer.
  // As the callback is usually invoked from the render thread, the callee must
  // take care of proper synchronization. It also needs to be ensured that the
  // returned buffer isn't released prior to unregistering this texture.
  explicit PixelBufferTexture(CopyBufferCallback copy_buffer_callback)
      : copy_buffer_callback_(std::move(copy_buffer_callback)) {}

  // Returns the callback-provided FlutterDesktopPixelBuffer that contains the
  // actual pixel data. The intended surface size is specified by |width| and
  // |height|.
  const FlutterDesktopPixelBuffer* CopyPixelBuffer(size_t width,
                                                   size_t height) const {
    return copy_buffer_callback_(width, height);
  }

 private:
  const CopyBufferCallback copy_buffer_callback_;
};

// A GPU surface-based texture.
class GpuSurfaceTexture {
 public:
  // A callback used for retrieving surface descriptors.
  typedef std::function<
      const FlutterDesktopGpuSurfaceDescriptor*(size_t width, size_t height)>
      ObtainDescriptorCallback;

  GpuSurfaceTexture(FlutterDesktopGpuSurfaceType surface_type,
                    ObtainDescriptorCallback obtain_descriptor_callback)
      : surface_type_(surface_type),
        obtain_descriptor_callback_(std::move(obtain_descriptor_callback)) {}

  // Returns the callback-provided FlutterDesktopGpuSurfaceDescriptor that
  // contains the surface handle. The intended surface size is specified by
  // |width| and |height|.
  const FlutterDesktopGpuSurfaceDescriptor* ObtainDescriptor(
      size_t width,
      size_t height) const {
    return obtain_descriptor_callback_(width, height);
  }

  // Gets the surface type.
  FlutterDesktopGpuSurfaceType surface_type() const { return surface_type_; }

 private:
  const FlutterDesktopGpuSurfaceType surface_type_;
  const ObtainDescriptorCallback obtain_descriptor_callback_;
};

// The available texture variants.
// Only PixelBufferTexture is currently implemented.
// Other variants are expected to be added in the future.
typedef std::variant<PixelBufferTexture, GpuSurfaceTexture> TextureVariant;

// An object keeping track of external textures.
//
// Thread safety:
// It's safe to call the member methods from any thread.
class TextureRegistrar {
 public:
  virtual ~TextureRegistrar() = default;

  // Registers a |texture| object and returns the ID for that texture.
  virtual int64_t RegisterTexture(TextureVariant* texture) = 0;

  // Notifies the flutter engine that the texture object corresponding
  // to |texure_id| needs to render a new frame.
  //
  // For PixelBufferTextures, this will effectively make the engine invoke
  // the callback that was provided upon creating the texture.
  virtual bool MarkTextureFrameAvailable(int64_t texture_id) = 0;

  // Asynchronously unregisters an existing texture object.
  // Upon completion, the optional |callback| gets invoked.
  virtual void UnregisterTexture(int64_t texture_id,
                                 std::function<void()> callback) = 0;

  // Unregisters an existing texture object.
  // DEPRECATED: Use UnregisterTexture(texture_id, optional_callback) instead.
  virtual bool UnregisterTexture(int64_t texture_id) = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_COMMON_CLIENT_WRAPPER_INCLUDE_FLUTTER_TEXTURE_REGISTRAR_H_

```

---
## File: windows\runner\CMakeLists.txt
```txt
cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the build version.
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

# Disable Windows macros that collide with C++ standard library functions.
target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

# Add dependency libraries and include directories. Add any application-specific
# dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

```

---
## File: windows\runner\Runner.rc
```rc
// Microsoft Visual C++ generated resource script.
//
#pragma code_page(65001)
#include "resource.h"

#define APSTUDIO_READONLY_SYMBOLS
/////////////////////////////////////////////////////////////////////////////
//
// Generated from the TEXTINCLUDE 2 resource.
//
#include "winres.h"

/////////////////////////////////////////////////////////////////////////////
#undef APSTUDIO_READONLY_SYMBOLS

/////////////////////////////////////////////////////////////////////////////
// English (United States) resources

#if !defined(AFX_RESOURCE_DLL) || defined(AFX_TARG_ENU)
LANGUAGE LANG_ENGLISH, SUBLANG_ENGLISH_US

#ifdef APSTUDIO_INVOKED
/////////////////////////////////////////////////////////////////////////////
//
// TEXTINCLUDE
//

1 TEXTINCLUDE
BEGIN
    "resource.h\0"
END

2 TEXTINCLUDE
BEGIN
    "#include ""winres.h""\r\n"
    "\0"
END

3 TEXTINCLUDE
BEGIN
    "\r\n"
    "\0"
END

#endif    // APSTUDIO_INVOKED


/////////////////////////////////////////////////////////////////////////////
//
// Icon
//

// Icon with lowest ID value placed first to ensure application icon
// remains consistent on all systems.
IDI_APP_ICON            ICON                    "resources\\app_icon.ico"


/////////////////////////////////////////////////////////////////////////////
//
// Version
//

#if defined(FLUTTER_VERSION_MAJOR) && defined(FLUTTER_VERSION_MINOR) && defined(FLUTTER_VERSION_PATCH) && defined(FLUTTER_VERSION_BUILD)
#define VERSION_AS_NUMBER FLUTTER_VERSION_MAJOR,FLUTTER_VERSION_MINOR,FLUTTER_VERSION_PATCH,FLUTTER_VERSION_BUILD
#else
#define VERSION_AS_NUMBER 1,0,0,0
#endif

#if defined(FLUTTER_VERSION)
#define VERSION_AS_STRING FLUTTER_VERSION
#else
#define VERSION_AS_STRING "1.0.0"
#endif

VS_VERSION_INFO VERSIONINFO
 FILEVERSION VERSION_AS_NUMBER
 PRODUCTVERSION VERSION_AS_NUMBER
 FILEFLAGSMASK VS_FFI_FILEFLAGSMASK
#ifdef _DEBUG
 FILEFLAGS VS_FF_DEBUG
#else
 FILEFLAGS 0x0L
#endif
 FILEOS VOS__WINDOWS32
 FILETYPE VFT_APP
 FILESUBTYPE 0x0L
BEGIN
    BLOCK "StringFileInfo"
    BEGIN
        BLOCK "040904e4"
        BEGIN
            VALUE "CompanyName", "com.example" "\0"
            VALUE "FileDescription", "phys_trigger_ble" "\0"
            VALUE "FileVersion", VERSION_AS_STRING "\0"
            VALUE "InternalName", "phys_trigger_ble" "\0"
            VALUE "LegalCopyright", "Copyright (C) 2026 com.example. All rights reserved." "\0"
            VALUE "OriginalFilename", "phys_trigger_ble.exe" "\0"
            VALUE "ProductName", "phys_trigger_ble" "\0"
            VALUE "ProductVersion", VERSION_AS_STRING "\0"
        END
    END
    BLOCK "VarFileInfo"
    BEGIN
        VALUE "Translation", 0x409, 1252
    END
END

#endif    // English (United States) resources
/////////////////////////////////////////////////////////////////////////////



#ifndef APSTUDIO_INVOKED
/////////////////////////////////////////////////////////////////////////////
//
// Generated from the TEXTINCLUDE 3 resource.
//


/////////////////////////////////////////////////////////////////////////////
#endif    // not APSTUDIO_INVOKED

```

---
## File: windows\runner\flutter_window.cpp
```cpp
#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}

```

---
## File: windows\runner\flutter_window.h
```h
#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

#include <memory>

#include "win32_window.h"

// A window that does nothing but host a Flutter view.
class FlutterWindow : public Win32Window {
 public:
  // Creates a new FlutterWindow hosting a Flutter view running |project|.
  explicit FlutterWindow(const flutter::DartProject& project);
  virtual ~FlutterWindow();

 protected:
  // Win32Window:
  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message, WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

 private:
  // The project to run.
  flutter::DartProject project_;

  // The Flutter instance hosted by this window.
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;
};

#endif  // RUNNER_FLUTTER_WINDOW_H_

```

---
## File: windows\runner\main.cpp
```cpp
#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"phys_trigger_ble", origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}

```

---
## File: windows\runner\resource.h
```h
//{{NO_DEPENDENCIES}}
// Microsoft Visual C++ generated include file.
// Used by Runner.rc
//
#define IDI_APP_ICON                    101

// Next default values for new objects
//
#ifdef APSTUDIO_INVOKED
#ifndef APSTUDIO_READONLY_SYMBOLS
#define _APS_NEXT_RESOURCE_VALUE        102
#define _APS_NEXT_COMMAND_VALUE         40001
#define _APS_NEXT_CONTROL_VALUE         1001
#define _APS_NEXT_SYMED_VALUE           101
#endif
#endif

```

---
## File: windows\runner\runner.exe.manifest
```manifest
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
  <application xmlns="urn:schemas-microsoft-com:asm.v3">
    <windowsSettings>
      <dpiAwareness xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">PerMonitorV2</dpiAwareness>
    </windowsSettings>
  </application>
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
    <application>
      <!-- Windows 10 and Windows 11 -->
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"/>
    </application>
  </compatibility>
</assembly>

```

---
## File: windows\runner\utils.cpp
```cpp
#include "utils.h"

#include <flutter_windows.h>
#include <io.h>
#include <stdio.h>
#include <windows.h>

#include <iostream>

void CreateAndAttachConsole() {
  if (::AllocConsole()) {
    FILE *unused;
    if (freopen_s(&unused, "CONOUT$", "w", stdout)) {
      _dup2(_fileno(stdout), 1);
    }
    if (freopen_s(&unused, "CONOUT$", "w", stderr)) {
      _dup2(_fileno(stdout), 2);
    }
    std::ios::sync_with_stdio();
    FlutterDesktopResyncOutputStreams();
  }
}

std::vector<std::string> GetCommandLineArguments() {
  // Convert the UTF-16 command line arguments to UTF-8 for the Engine to use.
  int argc;
  wchar_t** argv = ::CommandLineToArgvW(::GetCommandLineW(), &argc);
  if (argv == nullptr) {
    return std::vector<std::string>();
  }

  std::vector<std::string> command_line_arguments;

  // Skip the first argument as it's the binary name.
  for (int i = 1; i < argc; i++) {
    command_line_arguments.push_back(Utf8FromUtf16(argv[i]));
  }

  ::LocalFree(argv);

  return command_line_arguments;
}

std::string Utf8FromUtf16(const wchar_t* utf16_string) {
  if (utf16_string == nullptr) {
    return std::string();
  }
  unsigned int target_length = ::WideCharToMultiByte(
      CP_UTF8, WC_ERR_INVALID_CHARS, utf16_string,
      -1, nullptr, 0, nullptr, nullptr)
    -1; // remove the trailing null character
  int input_length = (int)wcslen(utf16_string);
  std::string utf8_string;
  if (target_length == 0 || target_length > utf8_string.max_size()) {
    return utf8_string;
  }
  utf8_string.resize(target_length);
  int converted_length = ::WideCharToMultiByte(
      CP_UTF8, WC_ERR_INVALID_CHARS, utf16_string,
      input_length, utf8_string.data(), target_length, nullptr, nullptr);
  if (converted_length == 0) {
    return std::string();
  }
  return utf8_string;
}

```

---
## File: windows\runner\utils.h
```h
#ifndef RUNNER_UTILS_H_
#define RUNNER_UTILS_H_

#include <string>
#include <vector>

// Creates a console for the process, and redirects stdout and stderr to
// it for both the runner and the Flutter library.
void CreateAndAttachConsole();

// Takes a null-terminated wchar_t* encoded in UTF-16 and returns a std::string
// encoded in UTF-8. Returns an empty std::string on failure.
std::string Utf8FromUtf16(const wchar_t* utf16_string);

// Gets the command line arguments passed in as a std::vector<std::string>,
// encoded in UTF-8. Returns an empty std::vector<std::string> on failure.
std::vector<std::string> GetCommandLineArguments();

#endif  // RUNNER_UTILS_H_

```

---
## File: windows\runner\win32_window.cpp
```cpp
#include "win32_window.h"

#include <dwmapi.h>
#include <flutter_windows.h>

#include "resource.h"

namespace {

/// Window attribute that enables dark mode window decorations.
///
/// Redefined in case the developer's machine has a Windows SDK older than
/// version 10.0.22000.0.
/// See: https://docs.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
#ifndef DWMWA_USE_IMMERSIVE_DARK_MODE
#define DWMWA_USE_IMMERSIVE_DARK_MODE 20
#endif

constexpr const wchar_t kWindowClassName[] = L"FLUTTER_RUNNER_WIN32_WINDOW";

/// Registry key for app theme preference.
///
/// A value of 0 indicates apps should use dark mode. A non-zero or missing
/// value indicates apps should use light mode.
constexpr const wchar_t kGetPreferredBrightnessRegKey[] =
  L"Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize";
constexpr const wchar_t kGetPreferredBrightnessRegValue[] = L"AppsUseLightTheme";

// The number of Win32Window objects that currently exist.
static int g_active_window_count = 0;

using EnableNonClientDpiScaling = BOOL __stdcall(HWND hwnd);

// Scale helper to convert logical scaler values to physical using passed in
// scale factor
int Scale(int source, double scale_factor) {
  return static_cast<int>(source * scale_factor);
}

// Dynamically loads the |EnableNonClientDpiScaling| from the User32 module.
// This API is only needed for PerMonitor V1 awareness mode.
void EnableFullDpiSupportIfAvailable(HWND hwnd) {
  HMODULE user32_module = LoadLibraryA("User32.dll");
  if (!user32_module) {
    return;
  }
  auto enable_non_client_dpi_scaling =
      reinterpret_cast<EnableNonClientDpiScaling*>(
          GetProcAddress(user32_module, "EnableNonClientDpiScaling"));
  if (enable_non_client_dpi_scaling != nullptr) {
    enable_non_client_dpi_scaling(hwnd);
  }
  FreeLibrary(user32_module);
}

}  // namespace

// Manages the Win32Window's window class registration.
class WindowClassRegistrar {
 public:
  ~WindowClassRegistrar() = default;

  // Returns the singleton registrar instance.
  static WindowClassRegistrar* GetInstance() {
    if (!instance_) {
      instance_ = new WindowClassRegistrar();
    }
    return instance_;
  }

  // Returns the name of the window class, registering the class if it hasn't
  // previously been registered.
  const wchar_t* GetWindowClass();

  // Unregisters the window class. Should only be called if there are no
  // instances of the window.
  void UnregisterWindowClass();

 private:
  WindowClassRegistrar() = default;

  static WindowClassRegistrar* instance_;

  bool class_registered_ = false;
};

WindowClassRegistrar* WindowClassRegistrar::instance_ = nullptr;

const wchar_t* WindowClassRegistrar::GetWindowClass() {
  if (!class_registered_) {
    WNDCLASS window_class{};
    window_class.hCursor = LoadCursor(nullptr, IDC_ARROW);
    window_class.lpszClassName = kWindowClassName;
    window_class.style = CS_HREDRAW | CS_VREDRAW;
    window_class.cbClsExtra = 0;
    window_class.cbWndExtra = 0;
    window_class.hInstance = GetModuleHandle(nullptr);
    window_class.hIcon =
        LoadIcon(window_class.hInstance, MAKEINTRESOURCE(IDI_APP_ICON));
    window_class.hbrBackground = 0;
    window_class.lpszMenuName = nullptr;
    window_class.lpfnWndProc = Win32Window::WndProc;
    RegisterClass(&window_class);
    class_registered_ = true;
  }
  return kWindowClassName;
}

void WindowClassRegistrar::UnregisterWindowClass() {
  UnregisterClass(kWindowClassName, nullptr);
  class_registered_ = false;
}

Win32Window::Win32Window() {
  ++g_active_window_count;
}

Win32Window::~Win32Window() {
  --g_active_window_count;
  Destroy();
}

bool Win32Window::Create(const std::wstring& title,
                         const Point& origin,
                         const Size& size) {
  Destroy();

  const wchar_t* window_class =
      WindowClassRegistrar::GetInstance()->GetWindowClass();

  const POINT target_point = {static_cast<LONG>(origin.x),
                              static_cast<LONG>(origin.y)};
  HMONITOR monitor = MonitorFromPoint(target_point, MONITOR_DEFAULTTONEAREST);
  UINT dpi = FlutterDesktopGetDpiForMonitor(monitor);
  double scale_factor = dpi / 96.0;

  HWND window = CreateWindow(
      window_class, title.c_str(), WS_OVERLAPPEDWINDOW,
      Scale(origin.x, scale_factor), Scale(origin.y, scale_factor),
      Scale(size.width, scale_factor), Scale(size.height, scale_factor),
      nullptr, nullptr, GetModuleHandle(nullptr), this);

  if (!window) {
    return false;
  }

  UpdateTheme(window);

  return OnCreate();
}

bool Win32Window::Show() {
  return ShowWindow(window_handle_, SW_SHOWNORMAL);
}

// static
LRESULT CALLBACK Win32Window::WndProc(HWND const window,
                                      UINT const message,
                                      WPARAM const wparam,
                                      LPARAM const lparam) noexcept {
  if (message == WM_NCCREATE) {
    auto window_struct = reinterpret_cast<CREATESTRUCT*>(lparam);
    SetWindowLongPtr(window, GWLP_USERDATA,
                     reinterpret_cast<LONG_PTR>(window_struct->lpCreateParams));

    auto that = static_cast<Win32Window*>(window_struct->lpCreateParams);
    EnableFullDpiSupportIfAvailable(window);
    that->window_handle_ = window;
  } else if (Win32Window* that = GetThisFromHandle(window)) {
    return that->MessageHandler(window, message, wparam, lparam);
  }

  return DefWindowProc(window, message, wparam, lparam);
}

LRESULT
Win32Window::MessageHandler(HWND hwnd,
                            UINT const message,
                            WPARAM const wparam,
                            LPARAM const lparam) noexcept {
  switch (message) {
    case WM_DESTROY:
      window_handle_ = nullptr;
      Destroy();
      if (quit_on_close_) {
        PostQuitMessage(0);
      }
      return 0;

    case WM_DPICHANGED: {
      auto newRectSize = reinterpret_cast<RECT*>(lparam);
      LONG newWidth = newRectSize->right - newRectSize->left;
      LONG newHeight = newRectSize->bottom - newRectSize->top;

      SetWindowPos(hwnd, nullptr, newRectSize->left, newRectSize->top, newWidth,
                   newHeight, SWP_NOZORDER | SWP_NOACTIVATE);

      return 0;
    }
    case WM_SIZE: {
      RECT rect = GetClientArea();
      if (child_content_ != nullptr) {
        // Size and position the child window.
        MoveWindow(child_content_, rect.left, rect.top, rect.right - rect.left,
                   rect.bottom - rect.top, TRUE);
      }
      return 0;
    }

    case WM_ACTIVATE:
      if (child_content_ != nullptr) {
        SetFocus(child_content_);
      }
      return 0;

    case WM_DWMCOLORIZATIONCOLORCHANGED:
      UpdateTheme(hwnd);
      return 0;
  }

  return DefWindowProc(window_handle_, message, wparam, lparam);
}

void Win32Window::Destroy() {
  OnDestroy();

  if (window_handle_) {
    DestroyWindow(window_handle_);
    window_handle_ = nullptr;
  }
  if (g_active_window_count == 0) {
    WindowClassRegistrar::GetInstance()->UnregisterWindowClass();
  }
}

Win32Window* Win32Window::GetThisFromHandle(HWND const window) noexcept {
  return reinterpret_cast<Win32Window*>(
      GetWindowLongPtr(window, GWLP_USERDATA));
}

void Win32Window::SetChildContent(HWND content) {
  child_content_ = content;
  SetParent(content, window_handle_);
  RECT frame = GetClientArea();

  MoveWindow(content, frame.left, frame.top, frame.right - frame.left,
             frame.bottom - frame.top, true);

  SetFocus(child_content_);
}

RECT Win32Window::GetClientArea() {
  RECT frame;
  GetClientRect(window_handle_, &frame);
  return frame;
}

HWND Win32Window::GetHandle() {
  return window_handle_;
}

void Win32Window::SetQuitOnClose(bool quit_on_close) {
  quit_on_close_ = quit_on_close;
}

bool Win32Window::OnCreate() {
  // No-op; provided for subclasses.
  return true;
}

void Win32Window::OnDestroy() {
  // No-op; provided for subclasses.
}

void Win32Window::UpdateTheme(HWND const window) {
  DWORD light_mode;
  DWORD light_mode_size = sizeof(light_mode);
  LSTATUS result = RegGetValue(HKEY_CURRENT_USER, kGetPreferredBrightnessRegKey,
                               kGetPreferredBrightnessRegValue,
                               RRF_RT_REG_DWORD, nullptr, &light_mode,
                               &light_mode_size);

  if (result == ERROR_SUCCESS) {
    BOOL enable_dark_mode = light_mode == 0;
    DwmSetWindowAttribute(window, DWMWA_USE_IMMERSIVE_DARK_MODE,
                          &enable_dark_mode, sizeof(enable_dark_mode));
  }
}

```

---
## File: windows\runner\win32_window.h
```h
#ifndef RUNNER_WIN32_WINDOW_H_
#define RUNNER_WIN32_WINDOW_H_

#include <windows.h>

#include <functional>
#include <memory>
#include <string>

// A class abstraction for a high DPI-aware Win32 Window. Intended to be
// inherited from by classes that wish to specialize with custom
// rendering and input handling
class Win32Window {
 public:
  struct Point {
    unsigned int x;
    unsigned int y;
    Point(unsigned int x, unsigned int y) : x(x), y(y) {}
  };

  struct Size {
    unsigned int width;
    unsigned int height;
    Size(unsigned int width, unsigned int height)
        : width(width), height(height) {}
  };

  Win32Window();
  virtual ~Win32Window();

  // Creates a win32 window with |title| that is positioned and sized using
  // |origin| and |size|. New windows are created on the default monitor. Window
  // sizes are specified to the OS in physical pixels, hence to ensure a
  // consistent size this function will scale the inputted width and height as
  // as appropriate for the default monitor. The window is invisible until
  // |Show| is called. Returns true if the window was created successfully.
  bool Create(const std::wstring& title, const Point& origin, const Size& size);

  // Show the current window. Returns true if the window was successfully shown.
  bool Show();

  // Release OS resources associated with window.
  void Destroy();

  // Inserts |content| into the window tree.
  void SetChildContent(HWND content);

  // Returns the backing Window handle to enable clients to set icon and other
  // window properties. Returns nullptr if the window has been destroyed.
  HWND GetHandle();

  // If true, closing this window will quit the application.
  void SetQuitOnClose(bool quit_on_close);

  // Return a RECT representing the bounds of the current client area.
  RECT GetClientArea();

 protected:
  // Processes and route salient window messages for mouse handling,
  // size change and DPI. Delegates handling of these to member overloads that
  // inheriting classes can handle.
  virtual LRESULT MessageHandler(HWND window,
                                 UINT const message,
                                 WPARAM const wparam,
                                 LPARAM const lparam) noexcept;

  // Called when CreateAndShow is called, allowing subclass window-related
  // setup. Subclasses should return false if setup fails.
  virtual bool OnCreate();

  // Called when Destroy is called.
  virtual void OnDestroy();

 private:
  friend class WindowClassRegistrar;

  // OS callback called by message pump. Handles the WM_NCCREATE message which
  // is passed when the non-client area is being created and enables automatic
  // non-client DPI scaling so that the non-client area automatically
  // responds to changes in DPI. All other messages are handled by
  // MessageHandler.
  static LRESULT CALLBACK WndProc(HWND const window,
                                  UINT const message,
                                  WPARAM const wparam,
                                  LPARAM const lparam) noexcept;

  // Retrieves a class instance pointer for |window|
  static Win32Window* GetThisFromHandle(HWND const window) noexcept;

  // Update the window frame's theme to match the system theme.
  static void UpdateTheme(HWND const window);

  bool quit_on_close_ = false;

  // window handle for top level window.
  HWND window_handle_ = nullptr;

  // window handle for hosted content.
  HWND child_content_ = nullptr;
};

#endif  // RUNNER_WIN32_WINDOW_H_

```

---
