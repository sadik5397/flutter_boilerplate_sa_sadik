# Flutter Boilerplate Project by S.a. Sadik

Welcome to the Flutter Boilerplate Project! This repository provides a well-structured starting point for building Flutter applications. It includes reusable components, pre-defined themes, and utility functions to accelerate your development process.

---

## Features

- **Customizable Themes**: Pre-defined colors, typography, and spacing.
- **Reusable Widgets**: Includes buttons, text fields, dropdowns, and more.
- **Alert & Snackbar Messages**: Built-in utilities for quick feedback.
- **Date Picker**: Integrated date and date range pickers.
- **Responsive Design**: Optimized layouts for different screen sizes.
- **Image Caching**: Efficiently handles images with `CachedNetworkImage`.
- **Structured Codebase**: Easy-to-navigate project structure.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Widgets and Components](#widgets-and-components)
4. [Themes](#themes)
5. [Utilities](#utilities)
6. [Contribution Guidelines](#contribution-guidelines)
7. [License](#license)

---

## Getting Started

Follow these steps to set up the project:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/sadik5397/flutter_boilerplate_sa_sadik
   cd flutter_boilerplate_sa_sadik
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

---

## Project Structure

The project follows a modular structure for scalability and maintainability:

```plaintext
lib/
├── api/                # API-related configurations and constants
│   ├── api.dart
│   ├── app_info.dart
│   ├── constant.dart
│   └── seed.dart
├── model/              # Data models
│   └── example_class.dart
├── service/            # Utility services (e.g., alerts, snackbars)
│   ├── alert_message.dart
│   ├── date_format.dart
│   ├── global_function.dart
│   ├── http_functions.dart
│   ├── initial_configuration.dart
│   ├── local_save.dart
│   ├── page_navigation.dart
│   ├── print.dart
│   ├── save_file_mobile.dart
│   ├── save_file_web.dart
│   └── snackbar_message.dart
├── theme/              # Application-wide themes and styles
│   ├── border_radius.dart
│   ├── button.dart
│   ├── colors.dart
│   ├── dropdown_button.dart
│   ├── gap.dart
│   ├── heading.dart
│   ├── hyperlink.dart
│   ├── no_data.dart
│   ├── padding.dart
│   ├── shadow.dart
│   ├── text_field.dart
│   └── theme.dart
├── view/               # Screen layouts and views
│   └── splash/
│       └── splash.dart
├── widget/             # Reusable widgets
│   ├── app_bar.dart
│   ├── datepicker.dart
│   ├── full_screen_image.dart
│   ├── image_picker.dart
├── boilerplate.dart
├── main.dart           # Entry point of the application
```

---

## Widgets and Components

### 1. **App Bar**
```dart
MyAppBar.primary()
```

### 2. **Buttons**
Various button styles:
```dart
ThemeButton.primary(onTap: () {}, title: "Primary")
ThemeButton.secondary(onTap: () {}, title: "Secondary")
ThemeButton.border(onTap: () {}, title: "Border")
```

### 3. **Text Fields**
Pre-styled text fields:
```dart
ThemeTextField.primary(labelText: "Primary TextField", controller: TextEditingController())
```

### 4. **Dropdowns**
```dart
ThemeDropDown.primary(title: "Select Item", options: Seed.randomNames, value: Seed.randomName, onChanged: (value) {})
```

### 5. **Snackbars and Alerts**
```dart
SnackBarMessage.info(label: "Information Message")
AlertMessage.error(label: "Error Occurred")
```

---

## Themes

### Colors
Customizable color palette available in `theme/colors.dart`:

- `ThemeColor.primary`
- `ThemeColor.success`
- `ThemeColor.warning`
- `ThemeColor.danger`

### Typography
Heading styles available in `theme/heading.dart`:
```dart
ThemeHeading.h1("Heading 1")
ThemeHeading.h2("Heading 2")
```

---

## Utilities

- **Date Picker**:
  ```dart
  MyDatePicker.dateRange(onDateRangeSelected: (range) { print(range); })
  ```

- **Box Shadows**: Defined in `theme/shadow.dart`:
  ```dart
  BoxDecoration(color: ThemeColor.light, boxShadow: ThemeShadow.primary)
  ```

---

## Contribution Guidelines

1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes and push to the branch:
   ```bash
   git push origin feature-name
   ```
4. Create a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

Happy coding! 🚀
