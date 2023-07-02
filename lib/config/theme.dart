import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.black,
          offset: Offset(0, -8),
        ),
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationColor: Colors.black,
      decorationThickness: 3,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  );
}
