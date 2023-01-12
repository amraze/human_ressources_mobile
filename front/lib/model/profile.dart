class Profile {
  final id;
  final imagePath;
  final name;
  final email;
  final about;
  final age;
  final overallrating;
  final isLeader;
  final projects;
  final tasksInfo;

  Profile(
      {this.id,
      this.email,
      this.name,
      this.imagePath,
      this.about,
      this.age,
      this.overallrating,
      this.isLeader,
      this.projects,
      this.tasksInfo});
  Profile.fromJson(Map json)
      : id = json['id'],
        name = json['first_name'],
        email = json['email'],
        about = json['bio'],
        age = json['age'],
        imagePath = json['image'],
        overallrating = json['overall_performance'],
        isLeader = json['position'] == 1,
        projects = json['projects'],
        tasksInfo = json['tasks'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'image': imagePath,
      'email': email,
      'age': age,
      'bio': about,
      'overallrating': overallrating,
      'position': isLeader,
      'projects': projects,
      'tasks': tasksInfo,
    };
  }
}
