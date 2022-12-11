import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectMembersArguments {
  final String projectTitle;
  ProjectMembersArguments(this.projectTitle);
}

class ProjectMembers extends StatefulWidget {
  const ProjectMembers({super.key});

  @override
  State<ProjectMembers> createState() => projectMembersState();
}

class projectMembersState extends State<ProjectMembers> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProjectMembersArguments;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(40.0), // here the desired height
            child: AppBar(
              backgroundColor: const Color(0xff353445),
              title: Text(args.projectTitle,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 255, 255, 255))),
              centerTitle: true,
            )),
        body: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(40, 40, 35, 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildMemberCard("Member 1",
                  'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200'),
              const SizedBox(
                height: 20,
              ),
              buildMemberCard("Member 2",
                  'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200'),
              const SizedBox(
                height: 20,
              ),
              buildMemberCard("Member 3",
                  'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200'),
            ],
          ),
        ));
  }
}

Widget buildMemberCard(String name, String imagUrl) {
  return Card(
    child: ListTile(
      title: Text(name),
      leading: CircleAvatar(backgroundImage: NetworkImage(imagUrl)),
      trailing: ElevatedButton(
        onPressed: () {
          //Navigator.pushNamed(context as BuildContext, '/profile');
        },
        child: Container(
          color: const Color(0xff1b1d2a),
          child: const Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    ),
  );
}

Widget buildMemberCardd(
        BuildContext context, String memberName, String imageURL) =>
    Card(
        color: const Color.fromARGB(255, 31, 31, 42),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {},
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
        ));
