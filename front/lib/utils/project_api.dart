import 'dart:async';
import 'package:http/http.dart' as http;
import '../model/project.dart';
import 'project_preferences.dart';

Project project = ProjectPreferences.myProject;

class Projectapi {
  static Future getProjects() async {
    print("getProjects");
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/projects'));
  }

  static Future getProjectbyid(int id) async {
    print("getProjectbyid");

    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/projects/' +
        id.toString())); // project ID
  }
}
