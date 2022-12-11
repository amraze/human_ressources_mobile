import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/body_containers/project_members.dart';
import '/body_containers/projects.dart';
import '/body_containers/profile/profile.dart';

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

  final List<Widget> _widgetOptions = <Widget>[
    // Profile
    buildProfilePage(),
    // Tasks
    buildProjectMembersPage(),
    // Projects
    buildProjectsPage(),
  ];

  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
            _selectedIndex = index;
            //updateRouting();
          });
  }

  static const circleAvatar = CircleAvatar(
    radius: 80,
    backgroundImage: AssetImage('assets/images/nasski.png'),
  );

  @override
  Widget build(BuildContext context) {
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
            /*AppDropdownInput(
              hintText: "Porfile",
              options: const ["Stat", "Setting"],
              //value: profile
              //onChanged" (String value) {setState((){ profile = value;});}
              //getLabel: (String value) => value,
            ), */
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
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(40.0), // here the desired height
      //     child: AppBar(
      //       backgroundColor: const Color(0xff353445),
      //       title: Text('Projects',
      //           style: GoogleFonts.poppins(
      //               fontSize: 20,
      //               fontWeight: FontWeight.w500,
      //               color: const Color.fromARGB(255, 255, 255, 255))),
      //       centerTitle: true,
      //     )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
