import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue[700],
  hintColor: Colors.lightBlueAccent, // Accent color
  scaffoldBackgroundColor: Colors.transparent, // Allow background image to show through


  textTheme:  TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontWeight:
    FontWeight.bold, fontSize: 26),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(color: Colors.blue[800], fontSize: 100, fontWeight: FontWeight.w900 )
  ),

  // Style buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[600],
      foregroundColor: Colors.white,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent,
      side: const BorderSide(color: Colors.lightBlueAccent, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold)
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.grey[850], // Dark background for popup
    textStyle: const TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.lightBlueAccent), // Color for icons like menu
  dividerColor: Colors.grey[700],
);