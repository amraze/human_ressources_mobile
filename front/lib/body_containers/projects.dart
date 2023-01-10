import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/./utils/user_preferences.dart';
import '/./utils/general_Info_preferences.dart';
import '/./utils/project_preferences.dart';

// username which is a project leader
String username = "";
var generalInfo = GeneralInfoPreferences.myGeneralInfo;
var user = UserPreferences.myUser;
var projectPreferences = ProjectPreferences.myProject;

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);
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
          itemCount: generalInfo.projectsList.length,
          itemBuilder: (context, index) {
            final name = generalInfo.projectsList[index];
            return buildProjectCard(
                context, name, projectPreferences.projectImagePath);
          },
        ));
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
}
