# app_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


```shell
    lib/
    ├── app
    │   ├── modules
    │   │   ├── home
    │   │   ├── domain
    │   │   │   ├── entities
    │   │   │   │   └── user_entity.dart
    │   │   │   ├── repositories
    │   │   │   │   └── get_users_repository.dart
    │   │   │   └── usecases
    │   │   │       ├── get_users_usecase.dart
    │   │   ├── external
    │   │   │   └── datasources
    │   │   │       └── get_users_datasource_impl.dart
    │   │   ├── infra
    │   │   │   ├── datasources
    │   │   │   │   └── get_users_datasource.dart
    │   │   │   ├── models
    │   │   │   │   └── user_model.dart
    │   │   │   └── repositories
    │   │   │       └── get_users_repository_impl.dart
    │   │   └── ui
    │   │       ├── bindings
    │   │       │   └── home_binding.dart
    │   │       ├── components
    │   │       │   └── user_widgets
    │   │       │       ├── list_user_bindings.dart
    │   │       │       ├── list_user_controller.dart
    │   │       │       └── list_user_page.dart
    │   │       ├── controllers
    │   │       │   └── home_controller.dart
    │   │       └── pages
    │   │           └── home_view.dart
    │   ├── routes
    │   │   ├── app_pages.dart
    │   │   └── app_routes.dart
    │   ├── shared
    │   │   ├── http
    │   │   │   └── http_client.dart
    │   │   ├── material-theme
    │   │   │   ├── color_schemes.g.dart
    │   │   └── response
    │   │       └── response.dart
    └── main.dart
```

