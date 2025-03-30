import 'package:flutter/material.dart';
 import 'package:url_launcher/url_launcher.dart';

import '../../models/project.dart';



class PortfolioSection extends StatelessWidget {
   PortfolioSection({super.key});

  // Define your actual projects here
  final List<Project> projects = [
    Project(
        title: 'Egerton University App',
        description: 'Mobile application for Egerton University students.',
        points: [
          'Migrated from Java/XML to Kotlin Jetpack Compose.',
          'Integrated Flask backend for dynamic news content.',
          'Implemented FCM for real-time campus notifications.'
        ],
       imageUrl: 'assets/projects/egerton_app.png', // Add image path if you have one
      projectUrl: 'https://github.com/your_repo' // Add link if available
    ),
    Project(
      title: 'Clawdius - Line Tracking Robot',
      description: 'A line-tracking robot with a robotic arm for object manipulation using infrared sensors and a custom-designed robotic arm, all controlled by a Raspberry Pi Pico.',
      points: [
        'Line tracking implemented with infrared sensors.',
        'Features custom-designed robotic arm for object handling.',
        'Utilizes Raspberry Pi Pico for control logic.',
        'Incorporates multithreading/multitasking for efficient operation.'
      ],
      tags: ['Python', 'MicroPython', 'Robotics', 'Line Tracking', 'Raspberry Pi Pico', 'Hardware'], // Added tags
      projectUrl: 'https://github.com/nevil-ing/clawdius',
      // imageUrl: 'assets/projects/clawdius.jpg', // <<-- Add an image asset if you have one
    ),
     Project(
        title: 'Study Blitz – Student Virtual Assistant',
        description: 'AI-powered study tool submitted to Gemini API competition.',
        points: [
          'Built with Flutter and Gemini API.',
          'Features quiz generation, topic summaries, and chatbot functionality.'
        ],
       imageUrl: 'assets/projects/study_blitz.png',
       projectUrl: 'https://github.com/your_repo/study_blitz'
    ),
     Project(
        title: 'Rehnafarms Website',
        description: 'Company website for Rehnafarms.',
        points: [
          'Developed using React and Next.js.',
          'Implemented responsive layouts and SEO strategies.',
          'Improved organic traffic by 20% and page load speed by 40%.'
        ],
      imageUrl: 'assets/projects/rehnafarms.png',
       projectUrl: 'https://rehnafarms.org' // Example link
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hintColor = Theme.of(context).hintColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        int crossAxisCount =
        isMobile ? 1 : (constraints.maxWidth < 1200 ? 2 : 3);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 60,
          ),
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Portfolio',
                style: textTheme.headlineSmall?.copyWith(color: hintColor),
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 25, // Increased spacing
                  mainAxisSpacing: 25,  // Increased spacing
                  childAspectRatio: isMobile ? 0.9 : 1.1, // Adjust aspect ratio
                ),
                itemCount: projects.length, // Use actual project count
                itemBuilder: (context, index) =>
                    _buildProjectCard(context, projects[index]), // Pass project data
              )
            ],
          ),
        );
      },
    );
  }

  // Updated project card builder
  Widget _buildProjectCard(BuildContext context, Project project) {
    final textTheme = Theme.of(context).textTheme;
    final cardColor = Colors.grey[850]?.withOpacity(0.7);

    return Card(
      color: cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // Optional: Launch projectUrl if available
          // if (project.projectUrl != null) {
          //   _launchUrl(project.projectUrl!);
          // }
          print('Tapped project ${project.title}');
        },
        borderRadius: BorderRadius.circular(10),
        hoverColor: Colors.white.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional: Project Image
              // if (project.imageUrl != null)
              //   AspectRatio(
              //      aspectRatio: 16 / 9,
              //      child: Image.asset(project.imageUrl!, fit: BoxFit.cover)),
              // else
              //   AspectRatio( aspectRatio: 16 / 9, child: Container(color: Colors.blueGrey[700])), // Placeholder
              // const SizedBox(height: 15),

              // --- Project Title ---
              Text(
                project.title,
                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // --- Brief Description ---
              Expanded( // Allow description to take space and wrap
                child: Text(
                  project.description,
                  style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                  maxLines: 2, // Limit description lines on card
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),

              // --- Key Points (Show 1-2 points concisely) ---
              if (project.points.isNotEmpty)
                Text(
                  '• ${project.points[0]}', // Show first point
                  style: textTheme.bodySmall?.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (project.points.length > 1)
                Text(
                  '• ${project.points[1]}', // Show second point if exists
                  style: textTheme.bodySmall?.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

              // Optional: Link Icon if URL exists
              // if (project.projectUrl != null)
              //   Align(
              //     alignment: Alignment.bottomRight,
              //     child: Icon(Icons.open_in_new, size: 18, color: Theme.of(context).hintColor),
              //   )
            ],
          ),
        ),
      ),
    );
  }

// Helper to launch URLs (Add this if using projectUrl)
// Future<void> _launchUrl(String urlString) async {
//   final Uri url = Uri.parse(urlString);
//   if (!await launchUrl(url)) {
//     print('Could not launch $urlString');
//   }
// }
}