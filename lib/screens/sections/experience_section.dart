import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  // Structure to hold experience data
  final List<Map<String, dynamic>> experiences = const [
    {
      'title': 'Backend Developer Intern',
      'company': 'Siciliamia',
      'period': 'January 2025 - Current (remote)',
      'details': [
        'Developing and maintaining backend services using Express.js and Firebase.',
        'Building secure RESTful APIs and optimizing database performance.',
        'Integrating authentication and real-time features using Firebase Authentication and Firestore.' // Corrected 'firestore'
      ]
    },
    {
      'title': 'Intern',
      'company': 'Coelib',
      'period': 'September 2024 – November 2024',
      'details': [
        'Migrated Egerton University App from Java and XML to Kotlin Jetpack Compose, improving user interface responsiveness by 30%.',
        'Developed a Flask backend to scrape and dynamically display news from the university website, storing data in SQLite.',
        'Implemented Firebase Cloud Messaging (FCM) to deliver real-time notifications, achieving a 95% engagement rate with campus updates.'
      ]
    },
    {
      'title': 'Full Stack Developer',
      'company': 'Rehnafarms',
      'period': 'August 2023 – Current (remote)',
      'details': [
        'Developed and maintained the RehnaFarms website using React and Next.js, achieving a 40% increase in page load speed.',
        // Add other points if available, otherwise keep concise
      ]
    },
    {
      'title': 'Freelance Mobile and Web Developer',
      'company': 'Self-Employed', // Or 'Freelance'
      'period': 'January 2022 – Current',
      'details': [
        'Built mobile applications using Flutter and Kotlin, prioritizing performance and user experience.',
        'Developed secure and scalable web applications using HTML, CSS, and JavaScript.'
      ]
    },
    {
      'title': 'Google Developer Student Clubs (GDSC) Lead',
      'company': 'GDSC Rift Valley Institute of Science and Technology', // Be more specific if possible
      'period': 'July 2023 – June 2024',
      'details': [
        'Organized technical workshops and hackathons, mentoring 50+ students in Flutter, Firebase, and modern web development practices.',
        'Established partnerships with industry professionals, enhancing student career readiness and technical expertise.'
      ]
    },
  ];

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
          color: Colors.black.withOpacity(0.1), // Subtle background difference
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Work Experience',
                style: textTheme.headlineSmall?.copyWith(color: hintColor),
              ),
              const SizedBox(height: 30),
              // Create a column of experience entries
              ListView.separated(
                shrinkWrap: true, // Important inside Column/ScrollView
                physics: const NeverScrollableScrollPhysics(), // Disable list scrolling
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final exp = experiences[index];
                  return _buildExperienceItem(context, exp);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 40, // Space between items
                  thickness: 0.5,
                  // color: Colors.grey[700], // Already set in theme
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget for a single experience entry
  Widget _buildExperienceItem(BuildContext context, Map<String, dynamic> experience) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${experience['title']} at ${experience['company']}',
          style: textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w600), // Adjusted size
        ),
        const SizedBox(height: 5),
        Text(
          experience['period'],
          style: textTheme.bodySmall?.copyWith(color: Colors.white60, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 15),
        // Bullet points for details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (experience['details'] as List<String>).map((detail) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 5), // Adjust alignment
                  child: Icon(Icons.arrow_right, size: 16, color: Theme.of(context).hintColor),
                ),
                Expanded(child: Text(detail, style: textTheme.bodyMedium?.copyWith(height: 1.5))),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }
}