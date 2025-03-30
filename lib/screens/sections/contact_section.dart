import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Helper function to launch URLs
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // Opens in browser/app
    )) {
      print('Could not launch $urlString');
      // Optional: Show a snackbar or dialog to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hintColor = Theme.of(context).hintColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 60,
          ),
          color: Colors.black.withOpacity(0.2), // Slightly different background
          constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get In Touch',
                style: textTheme.headlineSmall?.copyWith(color: hintColor),
              ),
              const SizedBox(height: 20),
              Text(
                'Feel free to reach out! I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
                style: textTheme.bodyLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.normal), // Adjusted style
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Use Wrap for responsive buttons/links
              Wrap(
                spacing: 20,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: [
                  // --- Email Button ---
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('nevilingutu12@gmail.com'),
                    onPressed: () => _launchUrl('mailto:nevilingutu12@gmail.com'),
                    style: ElevatedButton.styleFrom( // Can customize further if needed
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),

                  // --- LinkedIn Button ---
                  OutlinedButton.icon(
                    // Consider adding font_awesome_flutter for better brand icons
                    icon: const Icon(Icons.link), // Placeholder - replace with LinkedIn icon
                    label: const Text('LinkedIn'),
                    onPressed: () => _launchUrl('https://www.linkedin.com/in/nevil-ingutu-06a01424b'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),

                  // --- GitHub Button ---
                  OutlinedButton.icon(
                    icon: const Icon(Icons.code), // Placeholder - replace with GitHub icon
                    label: const Text('GitHub'),
                    onPressed: () => _launchUrl('https://github.com/nevil-ing/'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),

                  // --- Phone (Optional - Consider Privacy) ---
                  // OutlinedButton.icon(
                  //   icon: const Icon(Icons.phone_outlined),
                  //   label: const Text('+254 113 017 928'),
                  //   onPressed: () => _launchUrl('tel:+254113017928'),
                  //   style: OutlinedButton.styleFrom(
                  //    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}