import 'package:flutter/material.dart';

class TasksArguments {
  final String projectTitle;
  TasksArguments(this.projectTitle);
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TasksArguments;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: const Color(0xff2496AC),
            title: Text(args.projectTitle),
            centerTitle: true,
          )),
    );
  }
}
