import 'package:flutter/material.dart';
import 'package:mobile_project/utils/profile_preferences.dart';
import '/body_containers/members.dart';
import '/./utils/general_info_preferences.dart';
import '/body_containers/projects.dart';
import '../body_containers/profile_page.dart';
import '../model/profile.dart';
import 'dart:convert';
import '../body_containers/tasks.dart';
import '../model/profile_api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Profile profile = ProfilePreferences.myProfile;
// username which is a project leader
String username = "";
var generalInfo = GeneralInfoPreferences.myGeneralInfo;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getUsersfromApi() async {
    final response =
        await http.get(Uri.parse('https://supcomje.tn/mobile/api/users'));
    setState(() {
      var x = json.decode(response.body);
      List a = x.toList();
      profile = Profile.fromJson(a[0]);
    });
  }

  ///////////////////////////////
  @override
  void initState() {
    super.initState();
    getUsersfromApi();
  }

  ////////////////////////////////

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const circleAvatar = CircleAvatar(
    radius: 80,
    backgroundImage: AssetImage('assets/images/nasski.png'),
  );

  // User name
  String username = "";
  bool roleIsLeader = true;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      // Profile
      buildProfilePage(context),
      // Current Project
      generalInfo.isRoleLeader ? const Members() : const Tasks(),
      // Projects
      const Projects(),
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
