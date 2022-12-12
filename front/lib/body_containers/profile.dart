import 'package:flutter/material.dart';
import '../model/user.dart';
import '/./utils/user_preferences.dart';
import '/./widgets/button_widget.dart';
import '/./widgets/numbers_widget.dart';
import '/./widgets/profile_widget.dart';
//import 'package:wassim_test/NavigationBar.dart';

Widget buildProfilePage() {
  const user = UserPreferences.myUser;

  return Container(
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
        const SizedBox(
          height: 30,
        ),
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
      onClicked: () {},
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
