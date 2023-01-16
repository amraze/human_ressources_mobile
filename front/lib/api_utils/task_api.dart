import 'package:http/http.dart' as http;
import '../model/task.dart';
import '../preferences/task_preference.dart';
import 'dart:async';
import 'dart:convert';

Task task = TaskPreferences.myTask;

class Taskapi {
  static Future getTasksbyid(int userId) async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/tasks/' +
        userId.toString())); // task ID
  }

  static Future updateTaskStatus(taskId, status) async {
    return await http.patch(
      Uri.parse('https://supcomje.tn/mobile/api/tasks/${taskId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'status': status}),
    );
  }

  static Future postTask(Task task) async {
    return await http.post(
      Uri.parse('https://supcomje.tn/mobile/api/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': task.user_id,
        'project_id': task.project_id,
        'name': task.name,
        'description': task.description,
        'status': task.status,
        'start_date': task.start_date,
        'end_date': task.start_date,
        'deadline': task.deadline
      }),
    );
  }
}
