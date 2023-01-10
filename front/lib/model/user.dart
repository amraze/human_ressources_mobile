class User {
  String imagePath;

  String name;
  String email;
  String about;
  int age;
  double monthlyrating;
  double overallrating;
  List<List<List<String>>> tasksInfo;

  dynamic tasksperformance;

  User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.age,
    this.monthlyrating = 0.0,
    this.overallrating = 0.0,
    required this.tasksInfo,
    this.tasksperformance,
  });
}
