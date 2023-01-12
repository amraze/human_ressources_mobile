import '../model/task.dart';
import 'package:mobile_project/utils/task_preference';

Task task = TaskPreferences.myTask;

class Taskapi {
  static get http => null;

  static Future getTasks() async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/tasks'));
  }

  static Future getTasksbyid(int userId) async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/tasks/' +
        userId.toString())); // task ID
  }
}
