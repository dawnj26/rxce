# Flutter Starter Kit

A starter kit for Flutter applications using Melos, BLoC pattern, Freezed, and AutoRoute.

## Project Structure
 - `packages/`: Represents data layer packages.
 - `app/`: Contains main Flutter application.
 - `app/lib/shared/`: Shared utilities and components.
 - `app/lib/blocs/`: BLoC implementations for state management.
 - `app/lib/ui/`: Presentation layer with screens and widgets.
 - `app/lib/router/`: AutoRoute configurations.

## Getting Started
 1. Clone the repository.
 2. Install Melos: `dart pub global activate melos`
 3. Run `melos bootstrap` to install dependencies and link packages.
 4. Run `melos run generate` to generate code for all packages.
 5. Change directory to `app`: `cd app`
 6. Start the app: `flutter run -t lib/main_development.dart --flavor development`