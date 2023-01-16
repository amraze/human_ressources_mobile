import 'dart:async';
import 'package:http/http.dart' as http;
import '../model/project.dart';
import '../preferences/project_preferences.dart';

Project viewedProject = ProjectPreferences.myProject;

class Projectapi {
  // Fetches project data by the leader id from the database using api url.
  static Future getProjectbyid(int id) async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/projects/' +
        id.toString())); // leader ID
  }
}
