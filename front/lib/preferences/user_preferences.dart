import '../model/users.dart';

class UserPreferences {
  static var myUser = User(
      age: 22,
      imagePath:
          'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200',
      name: 'Mohamed Naski',
      email: 'Mohamed.naski@supcom.tn',
      about:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
      monthlyrating: 69.0,
      overallrating: 89.0,
      tasksperformance: {
        "The first task ": "50",
        "The second task": "78",
        "The third task": "45",
        "The final task": "96",
        "The first task4 ": "50",
        "The second task5": "78",
        "The third tasks": "45",
        "The final taskd": "96",
        "The first tasgk ": "50",
        "The second taskgds": "78",
        "The third taskagd": "45",
        "The final tasagdsk": "96",
        "The second tassk55": "78",
        "The third tassks": "45",
        "The final taskdd": "96",
        "The first tasgdk ": "50",
        "The second tadskgds": "78",
        "The third tadskagd": "45",
        "The final tasagddsk": "96",
      },
      tasksInfo: [
        [
          ["ToDo 1", "01/02/2022", "02/02/2022", "This is task ToDo1"],
          ["ToDo 2", "01/03/2022", "02/03/2022", "This is task ToDo2"]
        ],
        [
          [
            "In Progress 1",
            "01/02/2022",
            "02/02/2022",
            "This is task In Progress1"
          ],
          [
            "In Progress 2",
            "01/03/2022",
            "02/03/2022",
            "This is task In Progress2"
          ]
        ],
        [
          [
            "To Review 1",
            "01/02/2022",
            "02/02/2022",
            "This is task To Review 1"
          ],
          [
            "To Review 2",
            "01/03/2022",
            "02/03/2022",
            "This is task To Review 2"
          ]
        ],
        [
          [
            "Completed 1",
            "01/02/2022",
            "02/02/2022",
            "This is task Completed 1"
          ],
          [
            "Completed 2",
            "01/03/2022",
            "02/03/2022",
            "This is task Completed 2"
          ]
        ]
      ]);
}
