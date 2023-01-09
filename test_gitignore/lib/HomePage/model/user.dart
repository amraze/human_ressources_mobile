class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final dynamic monthlyrating;
  final dynamic overallrating;
  //final List projects;
  //final List tasks;
  final dynamic tasksperformance;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    this.monthlyrating,
    this.overallrating,
    //this.projects
    //this.tasks;
    this.tasksperformance,
  });
}
