import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/profile.dart';
import 'profile_preferences.dart';

Profile profile = ProfilePreferences.myProfile;

class ProfileApi {
  static Future getProfiles() async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/users'));
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

// void getUsersfromApi() async {
//   try {
//     var res = await ProfileApi.getProfiles();
//     var x = json.decode(res.body);
//     List a = x.toList();
//     profile = Profile.fromJson(a[0]);
//   } catch (exc) {
//     print(exc);
//   }
// }
