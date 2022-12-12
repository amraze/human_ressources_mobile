import 'package:flutter/material.dart';
import '/body_containers/profile/utils/user_preferences.dart';
import 'tap_bar.dart';
import 'package:mobile_project/body_containers/profile/widgets/appbar_widget.dart';

class Performance extends StatefulWidget {
  const Performance({super.key});

  @override
  // ignore: library_private_types_in_public_api
  PerformanceState createState() => PerformanceState();
}

class PerformanceState extends State<Performance> {
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
