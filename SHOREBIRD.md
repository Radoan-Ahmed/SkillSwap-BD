# Shorebird Code Push Guidelines for SkillSwap BD

Shorebird enables instant Over-The-Air (OTA) Dart code patches without resubmitting builds to the Google Play Store or Apple App Store.

## 1. Initial Setup
Run in your terminal (with Shorebird CLI installed):
```bash
shorebird init
```
This registers the application with Shorebird and adds `shorebird.yaml` to the project root with your `app_id`.

## 2. Creating a Release
Whenever you release a new version to the Play Store / App Store:
```bash
# Android
shorebird release android --dart-define-from-file=config/env/prod.json

# iOS
shorebird release ios --dart-define-from-file=config/env/prod.json
```

## 3. Pushing an OTA Patch
When you need to fix a bug, update UI, or adjust business logic instantly without app store review:
```bash
# Android
shorebird patch android --dart-define-from-file=config/env/prod.json

# iOS
shorebird patch ios --dart-define-from-file=config/env/prod.json
```

Users will receive the update automatically in the background on next app launch.

