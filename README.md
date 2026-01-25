# 📰 News App (Flutter)

A Flutter news application that delivers recommended and breaking news with a clean UI, smooth animations, and a performance-focused architecture.

The app includes a powerful discovery experience with advanced filtering, search history, and offline saved articles.

---

## ✨ Features

- 🏠 **Home Screen**
  - Recommended news
  - Breaking news section with pagination for better performance

- 🔍 **Discover Screen**
  - Advanced filters (country, category, date)
  - Search with history tracking

- 🔖 **Saved Articles**
  - Save articles locally using Hive
  - Access saved content offline

- 📖 **Full Article View**
  - Redirect to the original source to read full content (API content limit workaround)

- 🎨 **UI & UX Enhancements**
  - Shimmer loading instead of circular progress indicators
  - Smooth animations (Hero & BottomAppBar)
  - Fully responsive UI across devices

---

## 🧠 Tech Stack & Architecture

- **Flutter**
- **Riverpod** – State management  
- **GetIt** – Dependency injection  
- **Hive** – Local storage  
- **Pagination** – Performance optimization  
- **ScreenUtil & Device Preview** – Responsive design  

> Search debouncing was intentionally not implemented to reduce API calls and stay within the NewsAPI free-plan limits.

---

## 📸 Screenshots

<p align="center">
  <img src="assets/images/home.jpg" width="250" />
  <img src="assets/images/discover.jpg" width="250" />
  <img src="assets/images/shimmer.jpg" width="250" />
</p>

<p align="center">
  <img src="assets/images/article.jpg" width="250" />
  <img src="assets/images/search.jpg" width="250" />
  <img src="assets/images/saved.jpg" width="250" />
</p>

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Android Emulator / iOS Simulator or physical device

### Installation

```bash
git fetch
git checkout main
flutter pub get
flutter run
