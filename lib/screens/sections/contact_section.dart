import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 50,
          ),
          // color: Colors.black.withOpacity(0.3), // Optional overlay
          constraints: const BoxConstraints(minHeight: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center content
            children: [
              Text(
                'Get In Touch',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Interested in working together or have a question?',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Wrap( // Use Wrap for buttons to handle wrapping on smaller screens
                spacing: 20,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('nevilingutu12@gmail.com'),
                    onPressed: () {
                      // Implement mailto link
                      // Consider using url_launcher package
                    },
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.link), // Replace with LinkedIn/GitHub Icon
                    label: const Text('GitHub'),
                    onPressed: () {
                      // Implement link opening
                      // Consider using url_launcher package
                    },
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.link), // Replace with LinkedIn/GitHub Icon
                    label: const Text('LinkedIn'),
                    onPressed: () {
                      // Implement link opening
                      // Consider using url_launcher package
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // You could add a simple contact form here as well
            ],
          ),
        );
      },
    );
  }
}