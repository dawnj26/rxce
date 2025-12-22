# RxCE

A e-learning platform built with Flutter

## Project Structure

- `packages/`: Represents data layer packages.
- `app/`: Contains main Flutter application.
- `app/lib/shared/`: Shared utilities and components.
- `app/lib/blocs/`: BLoC implementations for state management.
- `app/lib/ui/`: Presentation layer with screens and widgets.
- `app/lib/router/`: AutoRoute configurations.

## Getting Started

1.  Clone the repository.
2.  Install Melos: `dart pub global activate melos`
3.  Run `melos bootstrap` to install dependencies and link packages.
4.  Run `melos run generate` to generate code for all packages.

### Running the App

- Run `melos run run:dev` to start the app in development mode.
- Run `melos run run:prod` to start the app in production mode.

### Building the App

- Run `melos run build:release` to build the production APK.
- Run `melos run build:web` to build the production web app.

## Testing (TODO)
