import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/model/profile.dart';
import 'package:mobile_project/model/project.dart';
import 'package:mobile_project/utils/profile_api.dart';
import 'package:mobile_project/utils/project_api.dart';
import 'dart:convert';

var projectList =
    profile.projects.map((model) => Project.fromJson(model)).toList();

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
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            final name = projectList[index].name;
            final imagePath = projectList[index].projectImagePath;
            return buildProjectCard(context, name, imagePath);
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
                onTap: () async {
                  if (profile.isLeader) {
                    var selectedProjectId = projectList[0].leaderid;
                    var res =
                        await Projectapi.getProjectbyid(selectedProjectId);
                    var decodedBody = json.decode(res.body);
                    var memberList = decodedBody["users"]
                        .map((model) => Profile.fromJson(model))
                        .toList();
                    project.members = memberList;
                    Navigator.pushNamed(context, 'members');
                  }
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
