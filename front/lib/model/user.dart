class User {
  String imagePath;
  String projectImagePath;

  String name;
  String email;
  String about;
  double monthlyrating;
  double overallrating;
  List<List<List<String>>> tasksInfo;
  List<String> membersList;
  List<String> projectsList;
  //final List tasks;
  dynamic tasksperformance;

  User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    this.monthlyrating = 0.0,
    this.overallrating = 0.0,
    required this.tasksInfo,
    required this.membersList,
    required this.projectsList,
    required this.projectImagePath,
    //this.tasks;
    this.tasksperformance,
  });
}
