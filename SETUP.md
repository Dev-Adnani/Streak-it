# 🔧 Setup Guide

This guide will help you set up Streak-it on your local machine.

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>=3.0.3) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development on macOS)
- **CocoaPods** (for iOS dependencies)
- **Supabase Account** - [Create Account](https://supabase.com)
- **Firebase Account** - [Create Account](https://firebase.google.com)
- **Google Cloud Console** access (for Google Sign-in)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Dev-Adnani/Streak-it.git
cd Streak-it
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Supabase

**⚠️ Security Warning**: The current `app.credentials.dart` file may contain placeholder or old credentials. You **must** replace them with your own Supabase credentials before running the app.

1. Create a new Supabase project at [supabase.com](https://supabase.com)
2. Get your Supabase URL and API key from the project settings (Dashboard → Settings → API)
3. Create `lib/ui/common/app.credentials.dart` (if it doesn't exist) or update the existing one:

```dart
class AppCredentials {
  static const String supbaseApiUrl = "YOUR_SUPABASE_URL";
  static const String supbaseApiKey = "YOUR_SUPABASE_ANON_KEY";
}
```

**Note**: For production apps, consider using environment variables or a configuration file that's excluded from version control using `.gitignore`.

### 4. Configure Firebase

#### For Android:

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
2. Add an Android app to your Firebase project:
   - Package name: Check `android/app/build.gradle` for `applicationId`
   - Download `google-services.json`
   - Place it in `android/app/google-services.json`

3. Configure Firebase options:

```bash
flutterfire configure
```

This will regenerate `lib/firebase_options.dart` with your Firebase configuration.

#### For iOS:

1. Add an iOS app to your Firebase project in the Firebase Console
2. Download `GoogleService-Info.plist`
3. Place it in `ios/Runner/GoogleService-Info.plist`
4. Run `flutterfire configure` (or manually update `firebase_options.dart`)

#### For Web:

Firebase web configuration is handled through `firebase_options.dart`.

### 5. Configure Google Sign-In

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project or select existing
3. Enable Google Sign-In API
4. Create OAuth 2.0 credentials:
   - For Android: Add your SHA-1 certificate fingerprint
   - For iOS: Add your bundle identifier
5. Update credentials in Firebase Console

### 6. Set Up Android Keystore (for Release Builds)

Create a keystore file for signing release builds:

```bash
keytool -genkey -v -keystore android/app/keystore/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Create `android/key.properties`:

```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=keystore/upload-keystore.jks
```

### 7. Set Up Supabase Database Schema

You'll need to create the following tables in your Supabase database:

- `habits` - Stores habit information
- `habit_completions` - Stores habit completion records
- `users` - User profiles (if not using Supabase Auth)

Refer to the Brick models in `lib/brick/models/` for the schema structure.

### 8. Generate Code

Run the build runner to generate necessary code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🏃 Running the App

### Development Mode

```bash
flutter run
```

### Build for Release

#### Android APK:
```bash
flutter build apk --release
```

#### Android App Bundle:
```bash
flutter build appbundle --release --build-name=0.1.2 --build-number=1 --obfuscate --split-debug-info
```

#### iOS:
```bash
flutter build ios --release
```

---

## 🏗 Project Structure

```
streak-it/
├── android/                 # Android-specific files
│   ├── app/
│   │   ├── build.gradle
│   │   └── google-services.json  # Add your Firebase config
│   └── key.properties      # Add your keystore config
├── ios/                     # iOS-specific files
│   └── Runner/
│       └── GoogleService-Info.plist  # Add your Firebase config
├── lib/
│   ├── app/                # App configuration and routing
│   ├── brick/              # Database models and repository
│   │   ├── models/         # Data models
│   │   └── repository.dart # Repository configuration
│   ├── local/              # Local data and configurations
│   ├── repository/         # Repository implementations
│   ├── services/           # Business logic services
│   │   ├── analytics_service.dart
│   │   ├── google_auth_service.dart
│   │   ├── notification_service.dart
│   │   ├── supabase_api_service.dart
│   │   └── user_service.dart
│   ├── ui/                 # UI layer
│   │   ├── common/         # Common UI components and themes
│   │   ├── utils/          # Utility functions
│   │   ├── views/          # Screen views
│   │   │   ├── analytics/  # Analytics screen
│   │   │   ├── create_habit/  # Habit creation
│   │   │   ├── home/       # Home screen
│   │   │   ├── onboarding/ # Onboarding flow
│   │   │   ├── settings/   # Settings screen
│   │   │   ├── streak_ui/  # Streak visualization
│   │   │   └── ...
│   │   └── widget/         # Reusable widgets
│   └── z_animated_emoji/   # Custom animated emoji system
├── assets/
│   ├── gifs/               # GIF assets
│   ├── icon_pack/          # SVG icons
│   ├── lottie/             # Lottie animation files
│   ├── logo/               # App logos
│   └── svg/                # SVG assets
├── flutter_heatmap_calendar/  # Custom heatmap calendar package
├── pubspec.yaml            # Dependencies
└── README.md               # This file
```

---

## 🐛 Troubleshooting

### Common Issues

1. **Build errors after cloning**
   - Run `flutter clean` then `flutter pub get`
   - Run `flutter pub run build_runner build --delete-conflicting-outputs`

2. **Firebase configuration errors**
   - Ensure `google-services.json` is in the correct location
   - Verify Firebase options are correctly generated

3. **Supabase connection issues**
   - Check your Supabase URL and API key in `app.credentials.dart`
   - Verify your Supabase project is active

4. **Google Sign-in not working**
   - Verify OAuth credentials in Google Cloud Console
   - Check SHA-1 fingerprint for Android
   - Ensure bundle identifier matches for iOS

---

## 📝 Configuration Checklist

Before running the app, make sure you've:

- [ ] Installed Flutter and dependencies
- [ ] Created Supabase project and added credentials to `app.credentials.dart`
- [ ] Created Firebase project and added `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- [ ] Configured Firebase using `flutterfire configure`
- [ ] Set up Google Sign-In credentials in Google Cloud Console
- [ ] Created Android keystore for release builds
- [ ] Created Supabase database tables
- [ ] Run `flutter pub get`
- [ ] Run `flutter pub run build_runner build --delete-conflicting-outputs`

---

## 🔒 Security Notes

**Before using this app in production or committing to your repository:**

- [ ] Replace all Supabase credentials in `lib/ui/common/app.credentials.dart`
- [ ] Add your own `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- [ ] Regenerate `firebase_options.dart` with your Firebase project credentials
- [ ] Create your own Android keystore for signing release builds
- [ ] Consider using environment variables for sensitive credentials
- [ ] Review and update all API keys and tokens

**Note**: All sensitive files (keystores, certificates, credentials) are already configured in `.gitignore` and should not be committed to the repository.

