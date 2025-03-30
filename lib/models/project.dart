class Project {
  final String title;
  final String description;
  final List<String> points;
  final List<String>? tags;
  final String? imageUrl;
  final String? projectUrl;

  const Project({
    required this.title,
    required this.description,
    required this.points,
    this.tags,
    this.imageUrl,
    this.projectUrl,
  });
}
