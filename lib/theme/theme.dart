import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColor.backgroundLight,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade700, foregroundColor: Colors.white, elevation: 4),
      buttonTheme: ButtonThemeData(buttonColor: Colors.blue.shade600, textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54)),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blue.shade400)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blue.shade200)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blue.shade600))));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xff151718),
      appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white, elevation: 4),
      buttonTheme: ButtonThemeData(buttonColor: Colors.blueGrey.shade700, textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white54)),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blueGrey.shade400)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blueGrey.shade600)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.blueGrey.shade800))));

  static ThemeData highContrastTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.orange,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
      buttonTheme: ButtonThemeData(buttonColor: Colors.orange.shade600, textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.orange.shade200),
      ));
}
