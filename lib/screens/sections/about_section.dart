import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hintColor = Theme.of(context).hintColor;

    // Skill list - easier to manage
    const List<Map<String, dynamic>> technicalSkills = [
      {'category': 'Languages', 'skills': [ 'Python', 'C' 'JavaScript', 'Dart', 'SQL']},
      {'category': 'Mobile', 'skills': ['Flutter', 'Kotlin Jetpack Compose']},
      {'category': 'Web', 'skills': ['React', 'TypeScript', 'HTML', 'CSS','Next.js']}, // Added Next.js
      {'category': 'Backend', 'skills': ['Flask', 'FastAPI', 'Firebase', 'AWS', 'Express.js']},
      {'category': 'Databases', 'skills': ['SQLite', 'Postgres']},
      {'category': 'Tools', 'skills': ['Git', 'GitHub', 'VS Code', 'Android Studio', 'PyCharm', 'Postman', 'Docker']},
      {'category': 'Other', 'skills': ['API Design', 'Firebase Cloud Messaging', ]},
    ];

    const List<String> coreCompetencies = [
      'Technical Troubleshooting & Issue Resolution',
      'Application Development & Optimization',
      'Cross-Platform Mobile Development',
      'Agile Collaboration & Team Leadership',
      'API Design & Integration',
      'Real-Time Notification Systems',
    ];


    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700; // Adjust breakpoint if needed

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 60, // Increased vertical padding
          ),
          constraints: const BoxConstraints(minWidth: double.infinity), // Take full width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Summary ---
              Text(
                'About Me',
                style: textTheme.headlineSmall?.copyWith(color: hintColor),
              ),
              const SizedBox(height: 25),
              Text(
                'Detail-oriented and innovative software developer with expertise in mobile and web development. Proficient in troubleshooting, resolving complex technical issues, and optimizing performance. Experienced in delivering impactful solutions using Kotlin, Flutter, and Python. Passionate about leveraging technology to empower users and enhance accessibility. Skilled collaborator with a track record of delivering results in cross-functional team environments.',
                style: textTheme.bodyMedium?.copyWith(fontSize: 18, height: 1.6),
              ),
              const SizedBox(height: 40),

              // --- Core Competencies ---
              Text(
                'Core Competencies',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10.0, // Horizontal space between items
                runSpacing: 10.0, // Vertical space between lines
                children: coreCompetencies.map((competency) => Chip(
                  backgroundColor: Colors.blueGrey[700]?.withOpacity(0.5),
                  label: Text(competency, style: textTheme.bodySmall?.copyWith(color: Colors.white)),
                )).toList(),
              ),
              const SizedBox(height: 40),


              // --- Technical Skills ---
              Text(
                'Technical Skills',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              // Display skills using Wrap and Chips for better visuals
              Wrap(
                spacing: 15.0, // Horizontal spacing between categories
                runSpacing: 20.0, // Vertical spacing between categories
                children: technicalSkills.map((categoryData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Important for Column in Wrap
                    children: [
                      Text(
                        categoryData['category'],
                        style: textTheme.titleMedium?.copyWith(color: hintColor, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0, // spacing between skill chips
                        runSpacing: 8.0,
                        children: (categoryData['skills'] as List<String>).map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                            labelStyle: textTheme.bodySmall?.copyWith(color: Colors.white),
                            side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),

              // --- Education ---
              Text(
                'Education & Certifications',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              _buildEducationItem(
                context: context,
                degree: 'Diploma in Information Communication Technology (ICT)',
                institution: 'Rift Valley Institute of Science and Technology – Nakuru',
                date: 'December 2024',
              ),
              const SizedBox(height: 10),
              _buildEducationItem( // Using the same helper for certifications
                context: context,
                degree: 'Google Developer Student Clubs Lead',
                institution: 'Google Developers', // Or appropriate issuer
                date: '2023 - 2024',
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget for consistent education/certification display
  Widget _buildEducationItem({
    required BuildContext context,
    required String degree,
    required String institution,
    required String date,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(degree, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(institution, style: textTheme.bodyMedium),
        const SizedBox(height: 2),
        Text(date, style: textTheme.bodySmall?.copyWith(color: Colors.white60)),
      ],
    );
  }
}