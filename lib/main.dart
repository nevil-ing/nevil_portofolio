import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/home_screen.dart'; // Make sure this path is correct
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nevil\'s Portfolio', // Add a title
      theme: ThemeData(
        // Define the bluish theme
        brightness: Brightness.dark, // Important for dark background image
        primarySwatch: Colors.blue, // Base blue color
        primaryColor: Colors.blue[700],
        hintColor: Colors.lightBlueAccent, // Accent color
        scaffoldBackgroundColor: Colors.transparent, // Allow background image to show through

        // Define text themes for better contrast on dark background
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          // Add other text styles as needed
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
        dividerColor: Colors.grey[700], // Color for dividers if used
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE), // Adjusted mobile breakpoint slightly
          const Breakpoint(start: 481, end: 850, name: TABLET), // Adjusted tablet breakpoint
          const Breakpoint(start: 851, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        // Optional: Background widget that doesn't scale with ResponsiveScaledBox
        // background: Container(color: const Color(0xFFF5F5F5)) // Example background color
      ),
      home: const MyHomePage(),
    );
  }
}