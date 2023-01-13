import 'package:flutter/material.dart';
import '../api_utils/profile_api.dart';
import '/./widgets/button_widget.dart';
import '/./widgets/numbers_widget.dart';
import '/./widgets/profile_widget.dart';

const circleAvatar = CircleAvatar(
  radius: 80,
  backgroundImage: AssetImage('assets/images/nasski.png'),
);

Widget buildProfilePage(BuildContext context) {
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
        circleAvatar,
        // ProfileWidget(
        //   imagePath: loggedProfile.imagePath,
        //   onClicked: () async {},
        // ),
        const SizedBox(height: 24),
        buildName(),
        const SizedBox(height: 24),
        Center(child: buildUpgradeButton(context)),
        const SizedBox(height: 24),
        NumbersWidget(age: loggedProfile.age),
        const SizedBox(height: 48),
        buildAbout(),
      ],
    ),
  );
}

Widget buildName() => Column(
      children: [
        Text(
          loggedProfile.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          loggedProfile.email,
          style: const TextStyle(color: Color.fromARGB(255, 185, 185, 185)),
        )
      ],
    );

Widget buildUpgradeButton(BuildContext context) => ButtonWidget(
      text: 'Check Performance',
      onClicked: () {
        Navigator.pushNamed(context, "/performance");
      },
    );

Widget buildAbout() => Container(
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
            loggedProfile.about,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
