import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/body_containers/tasks.dart';

List<List<List<String>>> tasksInfo = [
  [
    ["ToDo 1", "01/02/2022", "02/02/2022", "This is task ToDo1"],
    ["ToDo 2", "01/03/2022", "02/03/2022", "This is task ToDo2"]
  ],
  [
    ["In Progress 1", "01/02/2022", "02/02/2022", "This is task In Progress1"],
    ["In Progress 2", "01/03/2022", "02/03/2022", "This is task In Progress2"]
  ],
  [
    ["To Review 1", "01/02/2022", "02/02/2022", "This is task To Review 1"],
    ["To Review 2", "01/03/2022", "02/03/2022", "This is task To Review 2"]
  ],
  [
    ["Completed 1", "01/02/2022", "02/02/2022", "This is task Completed 1"],
    ["Completed 2", "01/03/2022", "02/03/2022", "This is task Completed 2"]
  ]
];

List<String> membersList = [
  "Member 1",
  "Member2",
  "Member3",
  "Member4",
  "Member5"
];
String memberImageURL =
    'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200';

Widget buildProjectMembersPage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
    child: ListView.builder(
      itemCount: membersList.length,
      itemBuilder: (context, index) {
        final name = membersList[index];

        return buildMemberCard(context, name, memberImageURL);
      },
    ),
  );
}

Widget buildMemberCard(
        BuildContext context, String memberName, String imageURL) =>
    Column(
      children: [
        Card(
            color: const Color.fromARGB(255, 31, 31, 42),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: InkWell(
              onTap: () {
                const snackBar = SnackBar(
                  content: Text('Yay! A SnackBar!'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //
                //

                Navigator.pushNamed(
                  context,
                  '/otherscreen',
                  arguments: {'exampleArgument': tasksInfo},
                );
                //
                //
                //
                Navigator.pushNamed(context, 'tasks');
                //
                //
                //
                //Tasks(tasksInfo: tasksInfo);
              },
              child: Column(
                children: [
                  Ink.image(
                    image: NetworkImage(
                      imageURL,
                    ),
                    height: 100,
                    width: 350,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      memberName,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
