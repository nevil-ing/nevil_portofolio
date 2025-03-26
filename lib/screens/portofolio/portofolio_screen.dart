import 'package:flutter/material.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        int crossAxisCount = isMobile ? 1 : (constraints.maxWidth < 1200 ? 2 : 3); // Responsive grid

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 50,
          ),
          // color: Colors.black.withOpacity(0.3), // Optional overlay
          constraints: const BoxConstraints(minHeight: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Portfolio',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 30),
              // Replace with a GridView or Wrap for actual projects
              GridView.builder(
                shrinkWrap: true, // Important inside a Column/ScrollView
                physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2, // Adjust as needed
                ),
                itemCount: 6, // Number of projects
                itemBuilder: (context, index) => _buildProjectCard(context, index),
              )
            ],
          ),
        );
      },
    );
  }

  // Placeholder for a project card - Replace with your actual project display
  Widget _buildProjectCard(BuildContext context, int index) {
    return Card(
      color: Colors.grey[850]?.withOpacity(0.7), // Semi-transparent card
      elevation: 4,
      child: InkWell(
        onTap: () {
          // Handle project tap - maybe show details dialog or navigate
          print('Tapped project ${index + 1}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder Image
              Expanded(
                child: Container(
                  color: Colors.blueGrey[700],
                  alignment: Alignment.center,
                  child: Icon(Icons.image, size: 40, color: Colors.grey[400]),
                  // Replace with: Image.asset('assets/projects/project_$index.jpg', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Project ${index + 1}',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                'Brief description of project ${index + 1}...',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}