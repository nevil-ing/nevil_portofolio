import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/widgets/main_body.dart'; // Correct path

class MyHomePage extends StatelessWidget { // Can be StatelessWidget now
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // The Scaffold is now inside MainBody to allow the background
    // image to cover the AppBar area if we were to add one later.
    return const MainBody();
  }
}