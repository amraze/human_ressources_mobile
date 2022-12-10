import 'package:flutter/material.dart';

// ignore: camel_case_types
class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static final List<Widget> _widgetOptions = <Widget>[
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    ),
    const Text(
      'Index 1: Tasks',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Calander',
      style: optionStyle,
    ),
  ];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
            _selectedIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 52, 71, 1),
      key: _drawerKey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
              child: const CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage('assets/images/employee-retention-rate.jpg'),
              ),
            ),
            const DrawerHeader(
              child: Text(
                'Drawer Header',
                style: optionStyle,
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
              title: const Text(
                'Profile',
                style: optionStyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Projects',
                style: optionStyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Setting',
                style: optionStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
                label: 'Tasks',
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
    );
  }

  static appconaitner(Text text) {}
}
