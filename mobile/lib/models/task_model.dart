class Task {
  final int id;
  final String title;
  final String description;
  final String bannerColor;
  final bool isChecked;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isChecked = false,
    required this.bannerColor,
  });
}
