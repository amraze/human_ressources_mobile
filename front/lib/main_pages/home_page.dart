import 'package:flutter/material.dart';
import '/body_containers/members.dart';
import '/./utils/user_preferences.dart';
import '/body_containers/projects.dart';
import '../body_containers/profile.dart';
import '../body_containers/tasks.dart';

const user = UserPreferences.myUser;
List<String> _projectsList = [
  "Project 1",
  "Project 2",
  "Project 3",
  "Project 4",
  "Project 5",
];
String _projectImageURL =
    'https://imageio.forbes.com/specials-images/dam/imageserve/1129869424/0x0.jpg?format=jpg&width=1200';

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

  // User name
  String username = "";
  bool roleIsLeader = true;
  // List of Projects username is a leader in

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      // Profile
      buildProfilePage(context),

      // Current Project
      roleIsLeader
          ? Members(
              membersList: user.membersList,
              memberImageURL: user.imagePath,
            )
          : Tasks(tasksInfo: user.tasksInfo),
      // Projects
      Projects(
        projectsList: _projectsList,
        projectImageURL: _projectImageURL,
      ),
    ];

    void _onItemTapped(int index) {
      index == 3
          ? _drawerKey.currentState?.openDrawer()
          : setState(() {
              _selectedIndex = index;
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
