import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body_containers/profile.dart';
import 'body_containers/projects.dart';
import 'body_containers/project_members.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Mohamed Naski",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "mohamed.naski@supcom.tn",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text("My Profile"),
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insights),
              title: const Text("Performance"),
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushNamed(context, '/login_screen');
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
