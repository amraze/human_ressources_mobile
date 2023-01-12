import '../model/task.dart';
import '../utils/task_preference.dart';

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
