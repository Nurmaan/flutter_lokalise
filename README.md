# flutter_localise

This is a test project for the `flutter_lokalise` package.

## Justfile Commands

The project includes a Justfile with the following commands:

- `just run`: 
  - Command: `dart run build_runner build --verbose --delete-conflicting-outputs`
  - Description: This command runs the build runner tool for your Dart project. It generates necessary files and code based on the annotations in your codebase. The `--verbose` flag provides detailed output, and the `--delete-conflicting-outputs` flag ensures that any conflicting outputs are deleted before the build.

- `just inspect`
  - Command: `dart analyze --fatal-infos --fatal-warnings .`
  - Description: This command performs static analysis on your Dart project using the Dart analyzer. It checks for potential issues, including warnings and infos. The --fatal-infos and --fatal-warnings flags treat all infos and warnings as fatal errors, causing the analysis to fail if any are found.

- `just android`
  - Command: `flutter build apk --release`
  - Description: This command builds the Android APK (Android Package) for your Flutter project. The --release flag specifies that the build should be optimized for release, resulting in a smaller and more efficient APK file.

- `just translate`
  - Command: `dart run lokalise_flutter_sdk:gen-lok-l10n`
  - Description: The command dart run lokalise_flutter_sdk:gen-lok-l10n is used to generate localization files for your Flutter project using the lokalise_flutter_sdk package.

To execute these commands, make sure you have the Just CLI installed. You can install it by running `cargo install just`.

For more information on using the Just CLI, refer to the [Just documentation](https://github.com/casey/just).