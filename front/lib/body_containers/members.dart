import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_utils/profile_api.dart';
import '../api_utils/project_api.dart';
import '../model/profile.dart';
import '../body_containers/tasks.dart';

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
        itemCount: viewedProject.members.length,
        itemBuilder: (context, index) {
          final name =
              '${viewedProject.members[index].firstName} ${viewedProject.members[index].secondName}';
          final memberimagePath = viewedProject.members[index].imagePath;

          return buildMemberCard(context, name, memberimagePath, index);
        },
      ),
    );
  }

  Widget buildMemberCard(BuildContext context, String memberName,
          String imageURL, int cardIndex) =>
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
                  try {
                    var selectedMemberId = viewedProject.members[cardIndex].id;
                    var res = await ProfileApi.getProfileById(selectedMemberId);
                    var decodedBody = json.decode(res.body);
                    selectedMember = Profile.fromJson(decodedBody);
                    TasksState.updateViewedMember();
                    Navigator.pushNamed(context, '/tasks');
                  } catch (exc) {
                    print(exc);
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
