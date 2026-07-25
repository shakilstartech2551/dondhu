class PostModel {
  final String text;
  final String? imagePath;
  final String userName;
  final DateTime createdAt;

  PostModel({
    required this.text,
    this.imagePath,
    required this.userName,
    required this.createdAt,
  });
}