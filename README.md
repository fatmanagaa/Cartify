# Cartify

A modern, high-performance e-commerce mobile application built with Flutter, following professional development standards and Clean Architecture principles.

## 🚀 Overview

This project is a fully-featured e-commerce application designed to provide a seamless shopping experience. It features a clean, responsive UI and a robust backend integration using modern Flutter best practices.

## ✨ Key Features

- **User Authentication**: Secure Login and Sign-up flows.
- **Product Discovery**: 
  - Home dashboard with featured categories and banners.
  - Comprehensive product listing with search and filtering.
  - Detailed product views with rich descriptions and images.
- **Shopping Cart**: Manage items, adjust quantities, and real-time total calculation.
- **Wishlist**: Save favorite products for later.
- **Category Browsing**: Explore products organized by categories.
- **User Profile**: Personal information management and order history.
- **Responsive UI**: Optimized for different screen sizes using `flutter_screenutil`.

## 🛠️ Technologies & Packages

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [BLoC](https://pub.dev/packages/flutter_bloc) & [Cubit](https://pub.dev/packages/bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences) (Implicitly used or ready for integration)
- **UI Components**:
  - `cached_network_image`: Efficient image loading and caching.
  - `carousel_slider_plus`: Interactive banners.
  - `flutter_svg`: Vector graphics support.
  - `smooth_page_indicator`: Custom indicators for sliders.
- **Utilities**:
  - `json_annotation` & `json_serializable`: Type-safe JSON parsing.
  - `logger`: Professional logging for debugging.
  - `pretty_dio_logger`: Beautiful API request/response logging.

## 🏗️ Architecture

The project follows **Clean Architecture** patterns to ensure scalability, maintainability, and testability. It is divided into three main layers:

1.  **Data Layer**: Handles API calls, local storage, and repository implementations.
2.  **Domain Layer**: Contains entities and business logic (Use Cases).
3.  **Presentation Layer**: UI logic using BLoC for state management and modular feature folders.

### Folder Structure
```text
lib/
├── api/        # Network configurations and API clients
├── core/       # Shared utilities, themes, and constants
├── data/       # Repositories and Data Sources
├── domain/     # Entities and Business Logic
├── features/   # Feature-based modules (Auth, Cart, Home, etc.)
└── main.dart   # App entry point
```

## ⚙️ Setup and Installation

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.3.4 or higher)
- [Dart SDK](https://dart.dev/get-started)
- Android Studio / VS Code

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/ecommerce-app-final-design.git
   cd ecommerce-app-final-design
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate code (for Retrofit and Injectable):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```


