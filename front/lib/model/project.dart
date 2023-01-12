import 'dart:convert';

class Project {
  final leaderid;
  final name;
  final description;
  final start_date;
  final end_date;
  final deadline;
  final category;
  final members;
  // ignore: prefer_typing_uninitialized_variables
  static var myProject;
  Project({
    required this.leaderid,
    required this.name,
    required this.description,
    required this.start_date,
    required this.end_date,
    required this.deadline,
    required this.category,
    required this.members,
  });
  Project.fromJson(Map json)
      : leaderid = json["leader_id"],
        name = json["name"],
        description = json["description"],
        start_date = json["start_date"],
        end_date = json["end_date"],
        deadline = json["deadline"],
        category = json["category"],
        members = json["members"];

  Map toJson() {
    return {
      'leader_id': leaderid,
      'name': name,
      'description': description,
      'start_date': start_date,
      'end_date': end_date,
      'deadline': deadline,
      'category': category,
      'members': members,
    };
  }
}
