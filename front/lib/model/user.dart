class User {
  String imagePath;
  String projectImagePath;

  String name;
  String email;
  String about;
  int age;
  double monthlyrating;
  double overallrating;
  List<List<List<String>>> tasksInfo;
  List<String> membersList;
  //final List tasks;
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
    required this.projectImagePath,
    required this.membersList,

    //this.tasks;
    this.tasksperformance,
  });
}
