import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/home_screen.dart'; // Make sure this path is correct
import 'package:nevil_portofolio/themes/theme.dart';
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
      theme: theme,
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