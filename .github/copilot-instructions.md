# RxCE Copilot Instructions

## Project Overview
RxCE is an **e-learning Flutter application** using a **Melos monorepo** structure. It manages courses, enables searching, and applies theming. The codebase separates concerns into reusable packages while the main app handles presentation and state management.

## Monorepo Architecture
This is a **Melos workspace** with four subprojects (defined in [pubspec.yaml](../pubspec.yaml#L9)):

```
workspace:
  - app              # Flutter app (presentation layer)
  - packages/api_package
  - packages/course_package
  - packages/theme_package
```

**Key principle**: Packages are dependencies for the app; always run `melos` commands from the workspace root, not individual package directories.

### Package Responsibilities
- **api_package**: HTTP client (Dio-based), API models with Freezed codegen, interceptor setup (Talker logging)
- **course_package**: Course business logic and data models (depends on api_package)
- **theme_package**: Shared Material theme definitions
- **app**: Flutter UI, routing (AutoRoute), BLoCs, localization (intl/l10n)

## Critical Workflows

### Build & Generate Code
```bash
# From workspace root
melos bootstrap           # Initialize all packages (required first time)
melos run generate        # Code generation (Freezed, JsonSerializable, AutoRoute)
```

### Running the App
Development, staging, and production **flavors** with separate entry points:
```bash
melos run run:dev        # main_development.dart with "development" flavor
melos run run:prod       # main_production.dart with "production" flavor
```

### Building Release APK
```bash
melos run build:release  # Production APK with "production" flavor
melos run build:web      # Web release build
```

### Code Quality
```bash
melos exec -- dart analyze .          # Lint all packages
melos run generate                     # Required before committing (codegen)
```

## Architecture Patterns

### State Management: BLoC Pattern
Located in [app/lib/bloc/](../app/lib/bloc):
- **BLoC classes** handle business logic (e.g., `CourseListBloc`, `CourseSearchBloc`)
- **Events** trigger state transitions; **States** represent UI conditions
- Use `bloc_test` for testing (mocktail for dependencies)
- Bloc observer configured via Talker in [bootstrap.dart](../app/lib/bootstrap.dart#L19)

### Routing: AutoRoute
Configured in [app/lib/router/router.dart](../app/lib/router/router.dart):
- Routes defined as `AutoRoute` declarations with nested children
- `router.gr.dart` auto-generated from router.dart (do NOT edit)
- `CourseRoute` is the initial/root route with course list/search children
- Use `context.router` for navigation in widgets

### API Layer: Dio + Freezed Models
[api_package/lib/src/](../packages/api_package/lib/src/):
- HTTP client initialized in [bootstrap.dart](../app/lib/bootstrap.dart#L20-L25)
- Models are **immutable** (Freezed `@freezed` classes with `.freezed.dart` generated files)
- Interceptors include `TalkerDioLogger` (automatic request/response logging)
- No direct Dio usage in app—abstractions through package exports

### Localization (i18n)
- Config: [app/l10n.yaml](../app/l10n.yaml) (generates `app/lib/l10n/gen/`)
- Access strings via `AppLocalizations.of(context)?.key`
- Generated files in `lib/l10n/gen/` (excluded from analysis)

## File Organization & Conventions

### UI Layer (app/lib/ui/)
```
ui/course/
  ├── course.dart          # Exports for this feature
  ├── pages/              # Full screens with @RoutePage
  │   └── course_list_page.dart
  └── widgets/            # Reusable components (no routing)
```
- **Screens** use `@RoutePage` (AutoRoute) and consume BLoCs
- **Widgets** are presentation-only, receive data via constructor parameters

### Shared Layer (app/lib/shared/)
```
shared/
  ├── components/         # Reusable UI components across features
  ├── constants/          # App-wide constants
  └── utils/              # Helper functions, extensions
```

### Code Generation Files
**Never edit** generated files; modify source instead:
- `*.freezed.dart` ← from `@freezed` in source
- `*.g.dart` ← from JsonSerializable or auto_route decorators
- `router.gr.dart` ← from router.dart
- Files in `lib/l10n/gen/` ← from l10n.yaml and .arb files

## Quality Standards

### Analysis Configuration
- Uses `very_good_analysis` (strict linting) + `bloc_lint` (BLoC best practices)
- Analysis excludes `lib/l10n/gen/` (generated code)
- See [analysis_options.yaml](../app/analysis_options.yaml)

### Dependencies
- **Never** add packages to individual packages without understanding the dependency graph
- Use `melos exec -- dart pub add <package>` to add across specific packages
- Cross-package deps: use `any:` version (workspace resolution)

## Integration Points & External APIs
- **API Base URL**: Configured in [ApiConfig](../packages/api_package/lib/src/config/) (set via bootstrap)
- **Logging**: Talker captures BLoC transitions + Dio requests (development feature)
- **Flavors**: App reads environment at runtime via constants/config (production URL differs from dev)

## When Making Changes
1. **Code generation required** → `melos run generate` after adding `@freezed`, `@JsonSerializable`, or new routes
2. **New feature** → Create feature folder in `ui/` with BLoC in `bloc/`, feature screens and widgets
3. **New API models** → Add to api_package with Freezed + JsonSerializable
4. **New data models** → May belong in course_package (coordinate with api_package)
5. **Styling** → Reference theme_package exports in widgets; avoid inline colors
6. **Testing** → Place in `test/` mirrors of lib structure; use bloc_test + mocktail
