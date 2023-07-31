/*
Description:
    App config file to support multiple flavors in the app.
Authors:
    Sai Pranav Dhupati
Created:
    19 July, 2023
*/

import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({super.key, required this.appName, required Widget child})
      : super(child: child);
  final String appName;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
