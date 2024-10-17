
# Movies App

# Directory Structure

lib
├── core
│   ├── constant
│   ├── i10n
│   └── failure.dart
├── data
│   ├── datasources
│   ├── mapper
│   ├── model
│   └── repositories
├── di
│   ├── injection.config.dart
│   ├── injection.dart
│   ├── network_module.dart
│   └── register_module.dart
├── domain
│   ├── entities
│   ├── repository
│   └── usecase
├── generated
│   └── intl
│       ├── messages_all.dart
│       ├── messages_en.dart
│       └── l10n.dart
└── presentation
    ├── bookmark
    ├── dashboard
    ├── detail
    ├── home
    ├── router
    ├── theme
    ├── widget
    └── main.dart



## Setup Development

### Requirements

Flutter (Channel stable, 3.19.6). Installation guide: https://flutter.dev/docs/get-started/install/

Check your installation status using `flutter doctor` command.

```bash  
$ flutter doctor  
Doctor summary (to see all details, run flutter doctor -v):  
[✓] Flutter (Channel stable, 3.19.6, on macOS 14.2.1 23C71 darwin-arm64, locale
    en-ID)
[✓] Android toolchain - develop for Android devices (Android SDK version 32.0.0)  
[✓] Xcode - develop for iOS and macOS (Xcode 13.4)  
[✓] Android Studio (version 2020.3)  
[✓] VS Code (version 1.68.0)    
```  

### Install Dependency

```bash
flutter pub get
```

### Run DEBUG Mode

```bash
flutter run
```

### Run PROFILE Mode

```bash
flutter run --profile
```

### Run RELEASE Mode

```bash
flutter run --release 
```

### Build APK

```bash
flutter build apk --release 
