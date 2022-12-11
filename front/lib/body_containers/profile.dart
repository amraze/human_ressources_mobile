import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildProfilePage() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(140),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage("assets/images/hedi.jpg"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Hedi Sayadi",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 18,
        ),
        const Text("hedi.sayadi@supcom.com"),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.github),
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              label: const Text(
                "GitHub",
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              label: const Text(
                "LinkedIn",
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              label: const Text(
                "Twitter",
              ),
            ),
            const SizedBox(
              width: 18,
            ),
          ],
        ),
      ],
    ),
  );
}
