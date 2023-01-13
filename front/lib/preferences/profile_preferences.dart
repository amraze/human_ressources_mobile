import '../model/profile.dart';

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
      tasksInfo: [
        // [
        //   ["ToDo 1", "01/02/2022", "02/02/2022", "This is task ToDo1"],
        //   ["ToDo 2", "01/03/2022", "02/03/2022", "This is task ToDo2"]
        // ],
        // [
        //   [
        //     "In Progress 1",
        //     "01/02/2022",
        //     "02/02/2022",
        //     "This is task In Progress1"
        //   ],
        //   [
        //     "In Progress 2",
        //     "01/03/2022",
        //     "02/03/2022",
        //     "This is task In Progress2"
        //   ]
        // ],
        // [
        //   [
        //     "To Review 1",
        //     "01/02/2022",
        //     "02/02/2022",
        //     "This is task To Review 1"
        //   ],
        //   [
        //     "To Review 2",
        //     "01/03/2022",
        //     "02/03/2022",
        //     "This is task To Review 2"
        //   ]
        // ],
        // [
        //   [
        //     "Completed 1",
        //     "01/02/2022",
        //     "02/02/2022",
        //     "This is task Completed 1"
        //   ],
        //   [
        //     "Completed 2",
        //     "01/03/2022",
        //     "02/03/2022",
        //     "This is task Completed 2"
        //   ]
        // ]
      ]);
}
