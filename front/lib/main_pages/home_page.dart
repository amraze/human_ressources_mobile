import 'package:flutter/material.dart';

import '../api_utils/profile_api.dart';
import '/body_containers/projects.dart';
import '../body_containers/profile_page.dart';
import '../body_containers/tasks.dart';
import '../model/profile.dart';
import 'dart:convert';
import '../main_pages/login_screen.dart';

var isOnCurrentPage = false;

// Home Page main class
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Call of  get profile by id from api method.
  void getProfilefromApi(int id) async {
    try {
      var res = await ProfileApi.getProfileById(id);
      setState(() {
        var x = json.decode(res.body);
        loggedProfile = Profile.fromJson(x);
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    // Get the logged in profile first time loading the home page.
    // We use logged id from the login screen class.
    getProfilefromApi(loggedId);
  }

  // The index of the navigation bar it takes values from 0 to 3.
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // Constant text style for the options of the drawer.
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  // Constant avatar image.
  static const circleAvatar = CircleAvatar(
    radius: 80,
    backgroundImage: AssetImage('assets/images/naski.png'),
  );

  @override
  Widget build(BuildContext context) {

    // The body list of the class home page.
    // According to the navigation bar index (selected_index) the body takes one widget from this list.
    final List<Widget> _widgetOptions = <Widget>[
      
      // Profile widget
      buildProfilePage(context),
      
      // Current Project widget
      loggedProfile.isLeader ? Projects() : const Tasks(),
      
      // Projects widget
      const Projects(),
    ];

    // Change the index according to the tap on the navigation bar
    void _onItemTapped(int index) {
      index == 3
          ? _drawerKey.currentState?.openDrawer()
          : setState(() {
              _selectedIndex = index;
              isOnCurrentPage = index == 1;
              if (isOnCurrentPage && !loggedProfile.isLeader) {
                TasksState.updateViewedMember();
                Navigator.pushNamed(context, '/tasks');
              }
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

          // NAVIGATION BAR
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

      // SIDE DRAWER.
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(34, 36, 49, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: ListView(
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

      // BODY.
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
