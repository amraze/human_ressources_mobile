import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/profile.dart';
import '../preferences/profile_preferences.dart';

// Instance of the Profile class defining the current logged user.
Profile loggedProfile = ProfilePreferences.myProfile;

// Instance of the Profile class defining the selected member from the list of members.
Profile selectedMember = ProfilePreferences.myProfile;

class ProfileApi {

  // Fetches profile data by id from the database using api url.
  static Future getProfileById(int profileId) async {
    return await http.get(Uri.parse(
        'https://supcomje.tn/mobile/api/users/' + profileId.toString()));
  }

  // Sends the authentification request using email and password.
  static Future postLogin(String email, String password) async {
    return await http.post(Uri.parse('https://supcomje.tn/mobile/api/login'),
        headers: {
          'accept': 'application/json',
        },
        body: {'email': email, 'password': password},
        encoding: Encoding.getByName("json"));
  }
}
