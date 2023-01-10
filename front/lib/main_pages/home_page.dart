import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/body_containers/project_members.dart';
import '/body_containers/projects.dart';
import '../body_containers/profile.dart';
import '../body_containers/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  static const circleAvatar = CircleAvatar(
    radius: 80,
    backgroundImage: AssetImage('assets/images/nasski.png'),
  );
  List<List<List<String>>> tasksInfo = [
    [
      ["ToDo 1", "01/02/2022", "02/02/2022", "This is task ToDo1"],
      ["ToDo 2", "01/03/2022", "02/03/2022", "This is task ToDo2"]
    ],
    [
      [
        "In Progress 1",
        "01/02/2022",
        "02/02/2022",
        "This is task In Progress1"
      ],
      ["In Progress 2", "01/03/2022", "02/03/2022", "This is task In Progress2"]
    ],
    [
      ["To Review 1", "01/02/2022", "02/02/2022", "This is task To Review 1"],
      ["To Review 2", "01/03/2022", "02/03/2022", "This is task To Review 2"]
    ],
    [
      ["Completed 1", "01/02/2022", "02/02/2022", "This is task Completed 1"],
      ["Completed 2", "01/03/2022", "02/03/2022", "This is task Completed 2"]
    ]
  ];

  // User name
  String username = "";

  // List of Projects username is a leader in
  List<String> Projects = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      // Profile
      //buildTaskForm(context),
      //buildProfilePage(context),

      Tasks(tasksInfo: tasksInfo),

      // Current Project tasks
      buildProjectMembersPage(context),

      // Projects
      buildProjectsPage(context),
    ];

    void _onItemTapped(int index) {
      index == 3
          ? _drawerKey.currentState?.openDrawer()
          : setState(() {
              _selectedIndex = index;
              //updateRouting(context);
            });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _drawerKey,
      bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: const Color.fromRGBO(55, 52, 71, 1),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: Colors.yellow)),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes_outlined),
                label: 'Current Project',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.today),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Drawer',
              ),
            ],
            currentIndex: _selectedIndex,
            elevation: 0.0,
            selectedItemColor: const Color.fromRGBO(39, 195, 237, 1),
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          )),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(34, 36, 49, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: circleAvatar,
            ),
            const DrawerHeader(
              child: Text(
                'Mohamed Naski',
                style: optionStyle,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              title: const Text(
                "My Profile",
                style: optionStyle,
              ),
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.insights,
                color: Colors.white,
              ),
              title: const Text(
                "Performance",
                style: optionStyle,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/performance");
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                style: optionStyle,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/login_screen");
              },
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
