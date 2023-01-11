import 'dart:async';
import 'package:http/http.dart' as http;

class ProfileApi {
  static Future getProfiles() async {
    return await http.get(Uri.parse('https://supcomje.tn/mobile/api/users'));
  }
}
