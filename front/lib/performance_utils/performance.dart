import 'package:flutter/material.dart';
import '/./utils/user_preferences.dart';
import '/./widgets/appbar_widget.dart';
import 'TapBar.dart';

class PerPage extends StatefulWidget {
  const PerPage({super.key});

  @override
  _PerPageState createState() => _PerPageState();
}

class _PerPageState extends State<PerPage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(55, 52, 71, 1),
        appBar: buildAppBar(context),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF353445),
                  Color(0xFF1b1d2a),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: const TabBarAndTabViews(),
        ));
  }
}
