# reusable_dialog

A lightweight and customizable dialog package for Flutter, designed to streamline the creation of consistent and reusable alert dialogs in your app.

## Features
- Predefined warning dialog with custom titles and messages
- Fully customizable buttons, colors, and content widgets
- Easy integration with your app's design system
- Clean and modular implementation

## Getting Started
Add the dependency to your `pubspec.yaml`:

```yaml
resolution: workspace

dependencies:
  reusable_dialog: <latest_version>
```

## Usage
Import the package and use the `AppDialog.warning` method for quick alert dialogs, or customize further with `CustomDialog.show`.

### Example
```dart
import 'package:flutter/material.dart';
import 'package:reusable_dialog/app_dialog.dart';

AppDialog.warning(
  context: context,
  title: "Warning",
  msg: "This action cannot be undone.",
  onOk: () {
    // Handle confirmation
  },
);
```

### Advanced Customization
```dart
CustomDialog.show(
  context: context,
  title: "Confirm",
  child: Text("Are you sure you want to proceed?"),
  okBtnTxt: "Yes",
  cancelBtnTxt: "No",
  okBtnTxtColor: Colors.green,
  cancelBtnTxtColor: Colors.red,
  onOk: () {
    // Handle OK
  },
  onCancel: () {
    // Handle Cancel
  },
);
```

## Dependencies
- `flutter`
- `app_style`: for styling
- `reusable_button`: for custom button widgets

> Ensure these are included in your project or provide alternatives that match your design system.

## License
MIT License

## Contributions
Feel free to submit issues and pull requests to improve this package!

