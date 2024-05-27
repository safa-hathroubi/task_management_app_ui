import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/custom_components/arrow_button.dart';
import 'package:task_management/Data/view/Components/custom_components/task_card.dart';

import '../Components/custom_components/mission_card.dart';

class UserTasksScreen extends StatelessWidget {
  const UserTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top:30),

            // TODO: wrap the Column widget inside a scrollable list widget List.build

            child: Column(
              children: [
                Text(
                  'User Tasks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20, width: 200),
                // TODO: instead of passing the parameters directly, make a mission_data_set + task_data_set to pass as a parameter and extract the values from them
                TaskCard(
                  taskName: "Task 1",
                  taskDescription: "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "93%",
                  priorityLevel: 0,
                ),
                TaskCard(
                  taskName: "Task 2",
                  taskDescription: "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "23%",
                  priorityLevel: 1,
                ),
                TaskCard(
                  taskName: "Task 3",
                  taskDescription: "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "53%",
                  priorityLevel: 1,
                ),TaskCard(
                  taskName: "Task 4",
                  taskDescription: "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "73%",
                  priorityLevel: 1,
                ),TaskCard(
                  taskName: "Task 5",
                  taskDescription: "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "73%",
                  priorityLevel: 1,
                ),TaskCard(
                  taskName: "Task 6",
                  taskDescription: "test",
                  taskProgress: "73%",
                  priorityLevel: 1,
                ),TaskCard(
                  taskName: "Task 7",
                  taskDescription: "Description:  teeeeeeeeeeeeeeest",
                  taskProgress: "73%",
                  priorityLevel: 1,
                ),



                /*const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50), //apply padding horizontal or vertical only
                  child: Text(
                    'Don\'t have an account?\nContact admin for inquiries',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

