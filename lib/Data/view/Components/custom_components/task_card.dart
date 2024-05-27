import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_management/Data/Models/task.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final String taskProgress;
  final int priorityLevel;

  const TaskCard({
    Key? key,
    required this.taskName,
    required this.taskDescription,
    required this.taskProgress,
    required this.priorityLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor; // Define a variable to hold the color

    // Set the color based on priorityLevel
    if (priorityLevel == 0) {
      cardColor = FigmaPalette.transparentRed;
    } else {
      cardColor = FigmaPalette.lightGrey; // Default color if priorityLevel is not 0
    }
    return InkWell(
      child: SizedBox(
          width: 350,
          height: 120,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar( // TODO: make circle color conditional to the task status (voir figma)
                        backgroundColor: FigmaPalette.red,
                        maxRadius: 5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(taskName, // TODO: check why this isn't centered yaza7i
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(taskDescription,
                      style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    // TODO: add the calendar icon before the time
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("2 hours ago", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12),
                      ), // TODO: make into a parameter and pass it at the taskCard call in the user_dashboard
                      Text(taskProgress,
                        style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
        onTap: (){
          Navigator.of(context).pushNamed("/taskdetails");
        },
    );

  }
}
