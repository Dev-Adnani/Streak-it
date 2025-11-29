# 🔥 Streak-it

**Streak-it** is a beautiful, feature-rich habit tracking Flutter application designed to help users build and maintain consistent habits through visual streak tracking, analytics, and an engaging user experience.

---

## 📸 App Screenshots

Example format:
<p align="center">
  <img src="screenshots/screenshot1.png" width="200" alt="Home Screen"/>
  <img src="screenshots/screenshot2.png" width="200" alt="Analytics Screen"/>
  <img src="screenshots/screenshot3.png" width="200" alt="Habit Creation"/>
  <img src="screenshots/screenshot4.png" width="200" alt="Profile Screen"/>
</p>
---

## ✨ Features

### Core Features
- 🎯 **Habit Tracking** - Create, manage, and track multiple habits with customizable details
- 🔥 **Streak Visualization** - Beautiful heatmap calendars (monthly and weekly views) to visualize your consistency
- 📊 **Advanced Analytics** - Comprehensive analytics with:
  - Monthly completion graphs
  - Weekly trend analysis
  - Streak trends and insights
  - Best month tracking
  - Current and best streak counters
- 🎨 **Customization** - Personalize habits with:
  - Custom icons from an extensive icon pack
  - Color themes (14+ color options)
  - Categories for better organization
  - Custom descriptions
- 📅 **Flexible Scheduling** - Set reminders with:
  - Custom days of the week
  - Time-based notifications
  - Multiple completions per day support
- 📱 **Offline-First** - Works seamlessly offline with automatic sync when online
- 🔐 **Authentication** - Secure authentication via:
  - Email/OTP verification
  - Google Sign-in
- 👤 **User Profiles** - Personalize your profile with animated animal spirit emojis
- 📦 **Habit Management** - Archive and restore habits
- 🔔 **Smart Notifications** - Never miss a habit with customizable reminders

### Premium Features
- Free Plan: 3 habits max, 10 completions per habit per day
- Premium Plan: 6 habits max, 20 completions per habit per day

---

## 🎨 Stunning UI & Animations

Streak-it features a beautifully crafted user interface with **smooth, polished animations** that create an exceptional user experience. Every interaction feels fluid and delightful, from the moment you launch the app to exploring your habits and analytics.

The app uses **Lottie animations** throughout, bringing emojis and graphics to life with smooth, professional animations. The onboarding experience captivates users with large, animated emojis and seamless page transitions. Loading states are elegant with shimmer effects that maintain visual interest while data loads.

Interactive elements respond beautifully to user actions - metrics slide in with perfect timing, graphs animate smoothly as they render, and navigation feels buttery smooth. The heatmap calendar provides visual feedback with smooth color transitions, making habit tracking not just functional but genuinely enjoyable.

Every screen transition, every state change, and every interaction is carefully animated to create a cohesive, premium feel throughout the entire app experience.

---

## 🛠 Tech Stack

### Core Framework
- **Flutter** - Cross-platform mobile framework (SDK >=3.0.3)
- **Dart** - Programming language

### Architecture
- **Stacked** - MVVM architecture pattern with dependency injection
- **Stacked Services** - Navigation, dialogs, bottom sheets, and alerts

### Backend & Database
- **Supabase** - Backend-as-a-Service for authentication and data storage
- **Brick** - Offline-first ORM with Supabase integration
- **SQLite** - Local database for offline functionality

### Firebase
- **Firebase Core** - Firebase initialization
- **Firebase Analytics** - User behavior analytics

### State Management & Routing
- **Stacked** - State management and routing
- **Stacked Generator** - Code generation for routes and dependencies

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
git clone https://github.com/yourusername/streak-it.git
cd streak-it
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Supabase

**⚠️ Security Warning**: The current `app.credentials.dart` file may contain placeholder or old credentials. You **must** replace them with your own Supabase credentials before running the app.

1. Create a new Supabase project at [supabase.com](https://supabase.com)
2. Get your Supabase URL and API key from the project settings (Dashboard → Settings → API)
3. Update `lib/ui/common/app.credentials.dart`:

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

## 📱 Platform Support

- ✅ **Android** - Fully supported
- ✅ **iOS** - Fully supported
- ✅ **Web** - Supported (with some limitations)

---

## 🎯 Key Features Explained

### Habit Tracking
Create habits with custom names, descriptions, icons, and colors. Set completion goals and track progress with beautiful heatmap calendars.

### Streak Visualization
Visualize your consistency with interactive heatmap calendars. See monthly and weekly views to understand your habit patterns.

### Analytics Dashboard
Get insights into your habits with:
- Monthly completion trends
- Weekly activity patterns
- Current and best streak tracking
- Most active days analysis

### Offline-First Architecture
All data is stored locally first and automatically synced when online. Built using Brick ORM for seamless offline/online transitions.

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

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/yourusername/streak-it/issues) page
2. Create a new issue with detailed information
3. For security issues, please email directly

---

**Made with ❤️ and Flutter**

