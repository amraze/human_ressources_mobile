import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/model/profile.dart';
import 'package:mobile_project/model/project.dart';
import '/./utils/user_preferences.dart';
import '/./utils/general_info_preferences.dart';
import '/./utils/project_preferences.dart';
import 'package:mobile_project/main_pages/home_page.dart';
import 'package:mobile_project/utils/profile_api.dart';
import 'dart:convert';

// username which is a project leader
String username = "";
var generalInfo = GeneralInfoPreferences.myGeneralInfo;
var user = UserPreferences.myUser;
var projectPreferences = ProjectPreferences.myProject;
var projectImagePath =
    'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200';
var projectlist = json.decode(profile.projects);
var finalprojects =
    projectlist.toList().map((model) => Project.fromJson(model)).toList();

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(finalprojects);
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
        child: ListView.builder(
          itemCount: finalprojects.length,
          itemBuilder: (context, index) {
            final name = finalprojects[index].name;
            return buildProjectCard(context, name, projectImagePath);
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
