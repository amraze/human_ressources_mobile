class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final double monthlyrating;
  final double overallrating;
  final List<List<List<String>>> tasksInfo;
  final List<String> membersList;
  //final List projects;
  //final List tasks;
  final dynamic tasksperformance;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    this.monthlyrating = 0.0,
    this.overallrating = 0.0,
    required this.tasksInfo,
    required this.membersList,
    //this.projects
    //this.tasks;
    this.tasksperformance,
  });
}
