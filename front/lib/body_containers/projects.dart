import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'project_members.dart';

// List of Projectss username is leader in
List<String> projectsList = [
  "Project 1",
  "Project 2",
  "Project 3",
  "Project 4",
  "Project 5",
];

// username which is a project leader
String username = "";

String projectImageURL =
    'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200';
Widget buildProjectsPage(BuildContext context) {
  return Container(
      child: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
          child: ListView.builder(
            itemCount: projectsList.length,
            itemBuilder: (context, index) {
              final name = projectsList[index];

              return buildProjectCard(context, name, projectImageURL);
            },
          )));
}

Widget buildProjectCard(
        BuildContext context, String projectName, String imageURL) =>
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
                //
                //
                //
                //
                //
                //
                // buildProjectMembersPage
                Navigator.pushNamed(context, 'members');
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
                      projectName,
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
