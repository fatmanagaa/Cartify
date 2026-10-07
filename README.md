# Cartify

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8+-0175C2?logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green)](#architecture)
[![State Management](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blue)](#tech-stack--packages)
[![Status](https://img.shields.io/badge/Status-Work%20in%20Progress-orange)](#screenshots--ui-showcase)

A modern, scalable, and feature-rich E-Commerce mobile application built using **Flutter**, following **Clean Architecture** principles and production-grade software engineering practices.

> 🚧 **Work in Progress**  
> *Note: This application is currently under active development. New features, UI improvements, and integrations are being added continuously.*

---

## Table of Contents
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Tech Stack & Packages](#tech-stack--packages)
- [Folder Structure](#folder-structure)
- [Screenshots & UI Showcase](#screenshots--ui-showcase)
- [Setup & Installation](#setup--installation)

---

## Key Features

- **🔒 Authentication & Session Management**:
  - Secure Login & Registration with request validation.
  - Auto-login check on Splash Screen using persistent local caching.
  - Secure Token Storage (`SharedPreferences`) with automatic request headers injection via Dio Interceptors.
  - Logout functionality with session clearing.

- **🏠 Home Dashboard**:
  - Interactive Promo Banners Carousel using `carousel_slider_plus` & `smooth_page_indicator`.
  - Categories horizontal list with remote data fetching.
  - Brands section showcase.
  - Popular / Best-Selling products grid.

- **🗂️ Category & Subcategory Exploration**:
  - Main categories navigation list.
  - Subcategories grid cards.

- **🛍️ Product Listing & Filtering**:
  - Grid view of available products.
  - Search bar integration.
  - Quick add-to-wishlist (Heart button) and add-to-cart actions.

- **📖 Product Details View**:
  - Detailed product page with dynamic ID/entity route parameters.
  - Full product description with expand/collapse (`readmore_flutter`).
  - Interactive product rating showcase.
  - Quantity counter (`ProductCounter`) with real-time price updates.
  - Product image showcase & color/size selection.

- **🛒 Shopping Cart**:
  - View all added items with real-time total price calculation.
  - Quantity controls (increment/decrement) per item.
  - Slidable item actions (`flutter_slidable`) for quick removal.
  - Direct integration with Cart API endpoints.

- **❤️ Wishlist / Favorites**:
  - Personal wishlist tab to save favorite items.

- **👤 User Profile**:
  - Account info display and settings tab.

---

## Architecture

This project strictly adheres to **Clean Architecture** principles, dividing the codebase into three decoupled layers:

1. **Presentation Layer**:
   - Manages UI widgets, layout, screens, and state representation using **BLoC / Cubit**.
   - Handles route navigation via **GoRouter**.

2. **Domain Layer**:
   - Contains core business entities (`Product`, `AuthResponse`, `CategoryOrBrand`, etc.) and contracts (Data Source & Repository interfaces).
   - Independent of any external frameworks or libraries.

3. **Data Layer**:
   - Implements repositories and data sources (Remote via **Retrofit/Dio** & Local via **SharedPreferences**).
   - Utilizes Mappers to transform raw DTOs (Data Transfer Objects) into clean Domain Entities.

---

## Tech Stack & Packages

- **Core & Framework**: [Flutter](https://flutter.dev) (Dart SDK `^3.8.0`)
- **State Management**: [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) & [`bloc`](https://pub.dev/packages/bloc)
- **Dependency Injection**: [`get_it`](https://pub.dev/packages/get_it) & [`injectable`](https://pub.dev/packages/injectable)
- **Networking**: [`dio`](https://pub.dev/packages/dio), [`retrofit`](https://pub.dev/packages/retrofit), and [`pretty_dio_logger`](https://pub.dev/packages/pretty_dio_logger)
- **Navigation & Routing**: [`go_router`](https://pub.dev/packages/go_router)
- **Local Storage**: [`shared_preferences`](https://pub.dev/packages/shared_preferences) (wrapped in `SharedPrefsUtils`)
- **Responsive UI**: [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)
- **UI Components & Utilities**:
  - [`cached_network_image`](https://pub.dev/packages/cached_network_image) (Network image caching)
  - [`carousel_slider_plus`](https://pub.dev/packages/carousel_slider_plus) (Image sliders)
  - [`smooth_page_indicator`](https://pub.dev/packages/smooth_page_indicator) (Page indicators)
  - [`flutter_slidable`](https://pub.dev/packages/flutter_slidable) (Slide-to-delete actions)
  - [`flutter_svg`](https://pub.dev/packages/flutter_svg) (SVG vector icons)
  - [`readmore_flutter`](https://pub.dev/packages/readmore_flutter) (Expandable text)
  - [`google_fonts`](https://pub.dev/packages/google_fonts) (Custom typography - Poppins)
- **Code Generation & Serialization**:
  - `build_runner`
  - `retrofit_generator`
  - `json_serializable` & `json_annotation`
  - `injectable_generator`

---

## Folder Structure

```text
lib/
├── api/                      # Remote API config, endpoints, DTOs, Retrofit service & Mappers
│   ├── data_source/          # Remote & Local data source implementations
│   ├── dio/                  # Dio instance configuration, Interceptors & DI modules
│   ├── mapper/               # DTO to Domain Entity Mappers
│   ├── model/                # API Request DTOs, Response DTOs & Endpoints
│   └── retrofit/             # Retrofit API Service definition
├── core/                     # Common core utilities, theme, widgets & routing
│   ├── cache/                # SharedPreferences helper (SharedPrefsUtils)
│   ├── di/                   # GetIt & Injectable initialization
│   ├── exceptions/           # Custom App exceptions
│   ├── routes_manager/       # GoRouter config & Route definitions
│   ├── utils/                # App colors, styles, assets, fonts & constants
│   └── widget/               # Reusable widgets (Buttons, TextFields, AppBars, Cards)
├── data/                     # Data layer contracts & Repository implementations
│   ├── data_source/          # Data Source interfaces (Local & Remote)
│   └── repository/           # Repository implementations
├── domain/                   # Business domain layer
│   └── entities/             # Pure Dart domain entities (Request & Response)
├── features/                 # Modular feature screens & Cubits
│   ├── auth/                 # Sign In & Sign Up screens & Cubits
│   ├── cart/                 # Shopping Cart screen, item widgets & Cubits
│   ├── main_layout/          # Bottom Navigation Layout (Home, Category, Wishlist, Profile)
│   ├── product_details/      # Product Details screen & widgets
│   ├── products_screen/      # Product Listing screen
│   └── splash/               # Splash screen & auto-login check ViewModel
└── main.dart                 # Application entry point
```

---

## Screenshots & UI Showcase

> ℹ️ *الواجهات قابلة للتحديث والتطوير - UI features are continuously being refined and expanded.*

| Splash & Auth | Home & Categories | Product Details | Shopping Cart |
| :---: | :---: | :---: | :---: |
| *(Work in progress)* | *(Work in progress)* | *(Work in progress)* | *(Work in progress)* |

> 📌 **Development Status Note**:  
> Current screens implemented include Splash, Sign In, Sign Up, Main Bottom Navigation Layout (Home, Category, Wishlist, Profile), Product Listing, Product Details, and Shopping Cart. Additional screens (Checkout, Payment Integration, Order Tracking) are actively being developed.

---

## Setup & Installation

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>=3.3.4`)
- [Dart SDK](https://dart.dev/get-started) (`^3.8.0`)
- Android Studio / VS Code with Flutter extension

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

3. **Run Code Generation (Injectable, Retrofit, JSON Serializable):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the Application:**
   ```bash
   flutter run
   ```


