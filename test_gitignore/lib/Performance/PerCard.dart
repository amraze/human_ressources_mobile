import 'package:flutter/material.dart';
import 'package:wassim_test/Performance/PerCardMicro.dart';
import 'package:wassim_test/Performance/TapBar.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      margin: const EdgeInsets.only(top: 20, bottom: 300.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const RadialGradient(
            colors: [
              Color.fromARGB(255, 71, 164, 218),
              Color.fromARGB(255, 77, 176, 233),
              Color.fromARGB(255, 22, 105, 153),
              Color.fromARGB(255, 2, 55, 85),
            ],
            focal: Alignment.topLeft,
            radius: .85,
          )),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  'TASK PERFORMANCE',
                  style: optionStyle,
                ),
              ),
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
            MicroCard(
              taskPer: '85%',
              subInfoTitle: 'The first task',
            ),
          ],
        ),
      ),
    );
  }
}
