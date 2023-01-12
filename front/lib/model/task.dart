class Task {
  final id;
  final user_id;
  final project_id;
  final name;
  final description;
  final grade;
  final start_date;
  final end_date;
  final deadline;
  final status;

  Task({
    this.id,
    this.user_id,
    this.project_id,
    this.name,
    this.description,
    this.grade,
    this.start_date,
    this.end_date,
    this.deadline,
    this.status,
  });
  Task.fromJson(Map json)
      : id = json['id'],
        user_id = json['user_id'],
        project_id = json['project_id'],
        name = json['name'],
        description = json['description'],
        grade = json['grade'],
        start_date = json['start_date'],
        end_date = json['end_date'] == 1,
        deadline = json['deadline'],
        status = json['status'];

  Map toJson() {
    return {
      'user_id': user_id,
      'project_id': project_id,
      'name': name,
      'description': description,
      'grade': grade,
      'start_date': start_date,
      'end_date': end_date,
      'deadline': deadline,
      'status': status,
    };
  }
}
