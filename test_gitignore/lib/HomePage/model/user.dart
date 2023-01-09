class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final String rating;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    this.rating = '0',
  });
}
