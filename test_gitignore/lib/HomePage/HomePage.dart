import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wassim_test/HomePage/model/user.dart';
import 'package:wassim_test/HomePage/utils/user_preferences.dart';
import 'package:wassim_test/HomePage/widget/appbar_widget.dart';
import 'package:wassim_test/HomePage/widget/button_widget.dart';
import 'package:wassim_test/HomePage/widget/numbers_widget.dart';
import 'package:wassim_test/HomePage/widget/profile_widget.dart';
import 'package:wassim_test/NavigationBar.dart';
import 'package:wassim_test/Performance/Performace.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            Center(child: buildUpgradeButton()),
            const SizedBox(height: 24),
            const NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Color.fromARGB(255, 185, 185, 185)),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Check Performance',
        onClicked: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PerPage()));
        },
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
