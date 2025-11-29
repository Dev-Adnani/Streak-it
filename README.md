# 🔥 Streak-it

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?style=flat&logo=github)](https://github.com/Dev-Adnani/Streak-it)

**Streak-it** is a beautiful, feature-rich habit tracking Flutter application designed to help users build and maintain consistent habits through visual streak tracking, analytics, and an engaging user experience.

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

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/Dev-Adnani/Streak-it.git
   cd Streak-it
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure your environment**
   - Set up Supabase credentials in `lib/ui/common/app.credentials.dart`
   - Configure Firebase (see [SETUP.md](SETUP.md) for details)
   - Run code generation: `flutter pub run build_runner build --delete-conflicting-outputs`

4. **Run the app**
   ```bash
   flutter run
   ```

📖 **For detailed setup instructions, see [SETUP.md](SETUP.md)**

---

## 📱 Platform Support

- ✅ **Android** - Fully supported
- ✅ **iOS** - Fully supported
- ✅ **Web** - Supported (with some limitations)

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

1. Check the [Issues](https://github.com/Dev-Adnani/Streak-it/issues) page
2. Create a new issue with detailed information
3. For security issues, please email directly

---

**Made with ❤️ and Flutter**

