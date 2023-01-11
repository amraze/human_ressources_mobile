import 'dart:async';
import 'package:http/http.dart' as http;
import '../model/profile.dart';
import 'profile_preferences.dart';

Profile profile = ProfilePreferences.myProfile;

class ProfileApi {
  static Future getProfiles() async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/users'));
  }

  static Future login(String email, String password) async {
    http.post(Uri.parse('https://supcomje.tn/mobile/api/users'), headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: {
      'email': email,
      'password': password
    }).then((response) {
      return response;
    });
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
