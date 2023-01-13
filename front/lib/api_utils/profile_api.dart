import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/profile.dart';
import '../preferences/profile_preferences.dart';

Profile loggedProfile = ProfilePreferences.myProfile;
Profile selectedMember = ProfilePreferences.myProfile;

class ProfileApi {
  static Future getProfiles() async {

    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/users'));
  }

  static Future getProfileById(int profileId) async {
    return await http.get(Uri.parse(
        'https://supcomje.tn/mobile/api/users/' + profileId.toString()));
  }

  static Future postLogin(String email, String password) async {
    return await http.post(Uri.parse('https://supcomje.tn/mobile/api/login'),
        headers: {
          'accept': 'application/json',
        },
        body: {'email': email, 'password': password},
        encoding: Encoding.getByName("json"));
  }
}
