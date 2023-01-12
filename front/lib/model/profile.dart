class Profile {
  final id;
  final imagePath;
  final name;
  final email;
  final about;
  final age;
  final overallrating;
  final isLeader;

  Profile({
    this.id,
    this.email,
    this.name,
    this.imagePath,
    this.about,
    this.age,
    this.overallrating,
    this.isLeader,
  });
  Profile.fromJson(Map json)
      : id = json['id'],
        name = json['first_name'],
        email = json['email'],
        about = json['bio'],
        age = json['age'],
        imagePath = json['image'],
        overallrating = json['overall_performance'],
        isLeader = json['position'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'img': imagePath,
      'email': email,
      'age': age,
      'bio': about,
      'overallrating': overallrating,
      'position': isLeader,
    };
  }
}
