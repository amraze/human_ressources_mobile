import 'package:flutter/material.dart';
import '/./performance_utils/PerCardMicro.dart';
import '/./performance_utils/TapBar.dart';
import '/./performance_utils/Rating.dart';
import '/./utils/user_preferences.dart';

var user = UserPreferences.myUser;

class InfoCard extends StatelessWidget {
  final double performance;
  //final List tasks;

  const InfoCard(
      {required this.performance,
      //required this.tasks,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic usertaskper;
    dynamic infotitle;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10),
              child: SliderFb3(
                divisions: 100,
                max: 100,
                min: 0,
                initialValue: performance,
              )),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            margin: const EdgeInsets.only(top: 20, bottom: 0.0),
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
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 71, 164, 218),
                    Color.fromARGB(255, 77, 176, 233),
                    Color.fromARGB(255, 22, 105, 153),
                    Color.fromARGB(255, 2, 55, 85),
                  ],
                  begin: FractionalOffset.bottomLeft,
                  end: Alignment.topRight,
                )),
            // ignore: prefer_const_constructors
            child: Container(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          'TASK PERFORMANCE',
                          style: optionStyle,
                        ),
                      ),
                    ),
                    /*MicroCard(
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
                    ),*/
                    for (var key in user.tasksperformance.keys) ...[
                      MicroCard(
                        taskPer: user.tasksperformance[key],
                        subInfoTitle: key,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
