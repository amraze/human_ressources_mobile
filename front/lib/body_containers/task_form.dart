import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_members.dart';
import 'package:intl/intl.dart';
import 'tasks.dart';

TextEditingController taskNameInput = TextEditingController();
TextEditingController beginDateInput = TextEditingController();
TextEditingController deadlineInput = TextEditingController();
TextEditingController descriptionInput = TextEditingController();
final _formKey = GlobalKey<FormState>();

Widget buildTaskForm(BuildContext context, int index, TasksState TaskInstance) {
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(40, 10, 35, 35),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff353445), Color(0xff1b1d2a)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TASK NAME
                  TextFormField(
                    controller: taskNameInput,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon:
                          Icon(Icons.label_important, color: Color(0xFF11cfe7)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF11cfe7)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF11cfe7)),
                      labelText: 'Task Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the task name';
                      }
                      return null;
                    },
                  ),
                  //BEGIN DATE
                  TextFormField(
                    controller: beginDateInput,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the begin date';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon:
                          Icon(Icons.calendar_today, color: Color(0xFF11cfe7)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF11cfe7)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF11cfe7)),
                      labelText: 'Begin Date',
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2022), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2050));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy/MM/dd').format(pickedDate);
                        beginDateInput.text =
                            formattedDate; //set output date to TextField value.
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  // DEADLINE
                  TextFormField(
                    controller: deadlineInput,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon:
                          Icon(Icons.calendar_today, color: Color(0xFF11cfe7)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF11cfe7)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF11cfe7)),
                      labelText: 'Deadline',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the deadline date';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2022), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2050));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy/MM/dd').format(pickedDate);
                        deadlineInput.text =
                            formattedDate; //set output date to TextField value.
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  //DESCRIPTION
                  TextFormField(
                    controller: descriptionInput,
                    maxLines: 3,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.description, color: Color(0xFF11cfe7)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF11cfe7)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF11cfe7)),
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF353445)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInstance.addCard(index, context);
                        }
                      },
                      child: Text('OK'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
