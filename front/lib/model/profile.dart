class Profile {
  final id;
  final imagePath;
  final email;
  final about;
  final age;
  final overallrating;
  final isLeader;
  final projects;
  var tasksInfo;
  final firstName;
  final secondName;

  Profile(
      {this.id,
      this.email,
      this.firstName,
      this.secondName,
      this.imagePath,
      this.about,
      this.age,
      this.overallrating,
      this.isLeader,
      this.projects,
      this.tasksInfo});
  Profile.fromJson(Map json)
      : id = json['id'],
        firstName = json['first_name'],
        secondName = json['last_name'],
        email = json['email'],
        about = json['bio'],
        age = json['age'],
        imagePath =
            'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200',
        overallrating = json['overall_performance'],
        isLeader = json['position'] == 1,
        projects = json['projects'],
        tasksInfo = json['tasks'];

  Map toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': secondName,
      'image': imagePath,
      'email': email,
      'age': age,
      'bio': about,
      'overallrating': overallrating,
      'position': isLeader ? 1 : 0,
      'projects': projects,
      'tasks': tasksInfo,
    };
  }
}
