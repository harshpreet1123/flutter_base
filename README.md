# Flutter Base Template

A professional, feature-rich starter template for building modern Flutter applications. This template mirrors the robustness of a high-quality React Native template, adjusted for best practices in the Flutter ecosystem.

## 🚀 Features

- **Authentication Flow**: Pre-built Login, Signup, and Forgot Password screens with validation.
- **Internationalization (i18n)**: 
  - Full support for **8 languages**: English, Arabic, Spanish, German, Hindi, Punjabi, Japanese, Korean.
  - **RTL Support**: Automatic layout adjustments for Right-to-Left languages (e.g., Arabic).
  - Language switcher built-in.
- **Theme System**: 
  - Dynamic **Light/Dark mode** support.
  - Custom `AppTheme` based on a slate color palette.
  - Persisted user preference.
- **State Management**: Scalable architecture using **Provider**.
- **Navigation**: Native **Named Routes** for robust and standard navigation handling.
- **Persistence**:
  - `shared_preferences` for non-sensitive settings (Theme, Language).
  - `flutter_secure_storage` for sensitive data (Auth Tokens).
- **Reusable UI Components**: Modular widgets for Buttons, Inputs, Sheets, and Menu Items.

## 📂 Project Structure

The project follows a flattened, clean architecture mainly located within `lib/`:

```
lib/
├── l10n/                  # Localization ARB files (app_en.arb, app_ar.arb, etc.)
├── navigation/            # (Deprecated) - Navigation logic is now in app.dart & screens
├── providers/             # State management (AuthProvider, SettingsProvider)
├── screens/               # Application screens (Login, Home, Profile, etc.)
├── theme/                 # Theme definitions (AppTheme)
├── utils/                 # Utility classes (Preferences, SecureStorage)
├── widgets/               # Reusable UI components (AppButton, LanguageSheet, etc.)
├── app.dart               # Root `MaterialApp` widget, routes, and providers
└── main.dart              # Entry point
```

## ⚡ Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- Android Studio / Xcode

### Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd flutter_base
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the App**:
    ```bash
    flutter run
    ```
    *Note: If you encounter build issues related to localization files, try running: `flutter gen-l10n`*

## 🌍 Internationalization (i18n)

Translations are managed via ARB files in `lib/l10n/`.

**To add a new language:**
1.  Create a new file `app_<locale_code>.arb` in `lib/l10n/`.
2.  Copy the keys from `app_en.arb` and translate the values.
3.  Add the new locale to the `supportedLocales` list in `lib/app.dart`.
4.  Add the language to the list in `lib/screens/profile_screen.dart` (for the selector UI).
5.  Run the app (or `flutter gen-l10n`) to regenerate delegates.

## 🔐 State Management & Storage

- **AuthProvider**: Handles login/logout logic and notifies the app to switch between Auth/Main stacks.
- **SettingsProvider**: Manages Theme and Locale state, persisting changes to disk immediately.
- **SecureStorage**: Used to store the 'userToken', ensuring sensitive session data is safe.

## 🧭 Navigation

We use standard Flutter **Named Routes** defined in `lib/app.dart`:

- `/login`: Login Screen
- `/signup`: Signup Screen
- `/forgot-password`: Password Reset
- `/home`: Main Screen (Tab Bar Wrapper)

Navigation is guarded by the `AuthProvider`. If the user is unauthenticated, the app defaults to the Login screen. Once authenticated, `home` switches to `MainScreen`.

## 🎨 Theming

Modify `lib/theme/app_theme.dart` to customize colors, fonts, and component styles. The app automatically respects the system theme or the user's manual override.
