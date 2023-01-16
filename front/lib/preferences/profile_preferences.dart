import '../model/profile.dart';

//Initializing Profile class utility.
class ProfilePreferences {
  static var myProfile = Profile(
      id: 1,
      firstName: 'Mohamed',
      secondName: 'Naski',
      email: 'mohamed.naski@supcom.tn',
      about: 'Hi ! ',
      age: 22,
      imagePath: 'id',
      overallrating: '100',
      isLeader: false,
      projects: [],
      tasksInfo: []);
}
