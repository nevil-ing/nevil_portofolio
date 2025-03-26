import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder for specific responsive adjustments if needed
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600; // Example breakpoint

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80, // Responsive padding
            vertical: 50,
          ),
          // Optional: Add a semi-transparent overlay color if needed
          // color: Colors.black.withOpacity(0.3),
          constraints: const BoxConstraints(minHeight: 500), // Ensure minimum height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.lightBlueAccent, // Highlight section title
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Hello! I\'m Nevil, a passionate developer specializing in Flutter and web technologies. '
                    'I love creating beautiful, functional, and responsive applications. '
                    'This portfolio showcases some of my work and skills.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15),
              Text(
                'My journey in tech started with [Your Story Briefly]. I am proficient in Dart, Flutter, [Other Skills like Firebase, State Management, etc.]. '
                    'I am always eager to learn new things and take on challenging projects.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Add more content, maybe an image, skills list etc.
            ],
          ),
        );
      },
    );
  }
}