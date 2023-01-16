import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/main_pages/home_page.dart';
import 'package:mobile_project/model/profile.dart';
import 'package:mobile_project/model/project.dart';
import 'dart:convert';
import '../body_containers/tasks.dart';
import '../api_utils/profile_api.dart';
import '../api_utils/project_api.dart';

// leader Project list viewed in the main projects page.
var projectList =
    loggedProfile.projects.map((model) => Project.fromJson(model)).toList();

// Current Project.
var firstProjectList = [projectList[0]];

// Projects main Class.
class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),

        // Gradient background decoration.
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),

        // Building project list cards uisng a list view builder.
        child: ListView.builder(
          itemCount: isOnCurrentPage ? 1 : projectList.length,
          itemBuilder: (context, index) {
            var _projectList = isOnCurrentPage ? firstProjectList : projectList;
            final name = _projectList[index].name;
            final imagePath = _projectList[index].projectImagePath;
            return buildProjectCard(context, name, imagePath, index);
          },
        ));
  }

  // // Return a project card, taking the name and image in parameters.
  Widget buildProjectCard(BuildContext context, String projectName,
          String imageURL, cardIndex) =>
      Column(
        children: [
          Card(
              color: const Color.fromARGB(255, 31, 31, 42),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                // Navigate to members page or tasks page based on the role of the user.
                onTap: () async {
                  try {
                    // Fetching members list if user isLeader.
                    if (loggedProfile.isLeader) {
                      var selectedProjectLeaderId = projectList[cardIndex].id;
                      var res = await Projectapi.getProjectbyid(
                          selectedProjectLeaderId);
                      var decodedBody = json.decode(res.body);
                      var name = decodedBody["name"];
                      var memberList = decodedBody["users"]
                          .map((model) => Profile.fromJson(model))
                          .toList();
                      viewedProject.members = memberList;
                      Navigator.pushNamed(context, '/members');
                    }
                    // Fetching tasks list if user is member.
                    else {
                      TasksState.updateViewedMember();
                      Navigator.pushNamed(context, '/tasks');
                    }
                  } catch (exc) {
                    print(exc);
                  }
                },
                child: Column(
                  children: [
                    // Project image.
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
