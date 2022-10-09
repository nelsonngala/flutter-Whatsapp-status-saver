import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF075E54),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey),
  AppTheme.darkTheme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.black),
};
