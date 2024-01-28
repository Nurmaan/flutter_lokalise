run:
  dart run build_runner build --verbose --delete-conflicting-outputs

inspect:
  dart analyze --fatal-infos --fatal-warnings .

android:
  flutter build apk --release

translate:
  dart run lokalise_flutter_sdk:gen-lok-l10n