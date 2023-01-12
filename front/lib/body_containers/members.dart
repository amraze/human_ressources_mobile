import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/profile.dart';
import '../utils/profile_api.dart';
import '../utils/project_api.dart';
import '../utils/task_api.dart';

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
        itemCount: project.members.length,
        itemBuilder: (context, index) {
          final name = project.members[index].name;
          final memberimagePath = project.members[index].imagePath;

          return buildMemberCard(context, name, memberimagePath);
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
                onTap: () async {
                  var selectedMemberId = project.members[0].id;
                  var res = await ProfileApi.getProfileById(selectedMemberId);
                  var decodedBody = json.decode(res.body);
                  currentMember = Profile.fromJson(decodedBody);
                  print(decodedBody);
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
