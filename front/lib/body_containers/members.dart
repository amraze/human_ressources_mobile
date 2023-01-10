import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/body_containers/projects.dart';
import '/./utils/project_preferences.dart';

var projectPreferences = ProjectPreferences.myProject;

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
      child: ListView.builder(
        itemCount: projectPreferences.membersList.length,
        itemBuilder: (context, index) {
          final name = projectPreferences.membersList[index];

          return buildMemberCard(context, name, user.imagePath);
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
                  Navigator.pushNamed(
                    context,
                    '/tasks',
                  );
                  Navigator.pushNamed(context, '/tasks');
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
}
