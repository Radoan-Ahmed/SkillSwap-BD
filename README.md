# SkillSwap BD

**SkillSwap BD** is a production-ready, cross-platform mobile application built with **Flutter** and **Supabase** that connects individuals across Bangladesh and beyond to barter skills and exchange knowledge without monetary transactions (Time Banking / Skill Barter model).

---

## 🌟 Key Features

- 🔐 **Authentication & Session Management**: Secure Email/Password & Google Sign-In with Supabase Auth, persistent session handling via `SessionCubit`.
- 👤 **Profile & Skill Setup**: Full name, bio, and dual skill-tagging system (`skills_offered` and `skills_learned`).
- 🔍 **Discovery & Matching Feed**: Real-time peer directory with debounced search and filtering by skills you want to learn or teach.
- 💬 **Real-time 1-on-1 Chat**: Instant messaging powered by Supabase Real-time database and streams.
- 🚀 **Shorebird CodePush OTA**: Over-the-air Dart code patches without needing Play Store / App Store re-submission.
- 🎨 **Scalable Design System**: Centralized design tokens (colors, typography, spacing, radii) adhering strictly to Clean Architecture.

---

## 🏗️ Architecture & Tech Stack

This project follows **Feature-first Clean Architecture** as detailed in `PROJECT_STRUCTURE.md`:

```
lib/
├── core/                  # Cross-cutting foundational modules
│   ├── config/            # Environment configurations (dev, staging, prod)
│   ├── di/                # Dependency injection with GetIt & Injectable
│   ├── error/             # Result<T>, guard(), Failure abstractions
│   ├── l10n/              # Localization (en, bn)
│   ├── router/            # GoRouter navigation configuration
│   ├── services/          # Shorebird OTA & system services
│   ├── storage/           # TokenStorage & LocalStorage
│   ├── theme/             # Design tokens & Material 3 theme
│   ├── utils/             # Formatters, validators, logger, debouncer
│   └── widget/            # Core atomic reusable UI widgets
└── features/              # Feature modules
    ├── common/            # Shared features (SessionCubit, etc.)
    ├── auth/              # Authentication module
    ├── profile/           # User profile & skill management
    ├── discovery/         # Feed & peer matching
    └── chat/              # Real-time 1-on-1 messaging
```

- **State Management**: `flutter_bloc` (Cubit only)
- **Data Modeling**: `freezed` & `json_annotation`
- **Backend / BaaS**: `supabase_flutter` (Auth, Database, Realtime)
- **Networking**: `dio` & Supabase Client
- **Navigation**: `go_router` (declarative routing)
- **Code Quality**: `very_good_analysis` (zero warnings policy)

---

## 🚀 Getting Started

### Prerequisites

- Flutter 3.29+ / Dart 3.7+
- Supabase project credentials

### Environment Setup

Create or update `config/env/dev.json`:

```json
{
  "FLAVOR": "dev",
  "BASE_URL": "https://dev-api.skillswapbd.com",
  "SUPABASE_URL": "https://your-project.supabase.co",
  "SUPABASE_ANON_KEY": "your-anon-key"
}
```

### Run the Application

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --dart-define-from-file=config/env/dev.json
```

---

## 🧪 Testing

```bash
flutter test
flutter analyze
```

---

## 📄 License

This project is licensed under the MIT License.
