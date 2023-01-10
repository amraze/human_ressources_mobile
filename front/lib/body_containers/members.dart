import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Members extends StatelessWidget {
  final List<String> membersList;
  final String memberImageURL;

  const Members(
      {required this.membersList, required this.memberImageURL, Key? key})
      : super(key: key);
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
