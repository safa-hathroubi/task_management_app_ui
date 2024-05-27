import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class MissionCard extends StatelessWidget {
  final String missionTitle;
  final String completedTasks;
  final String taskProgress;
  final List<String> missionUserList;
  final int priorityLevel;

  const MissionCard({
    Key? key,
    required this.missionTitle,
    required this.completedTasks,
    required this.taskProgress,
    required this.missionUserList,
    required this.priorityLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor; // Define a variable to hold the color

  // Set the color based on priorityLevel
  if (priorityLevel == 0) {
    cardColor = FigmaPalette.red;
  } else {
    cardColor = FigmaPalette.green; // Default color if priorityLevel is not 0
  }
    return InkWell(
      child: SizedBox(
        width: 330,
        height: 184,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          color: cardColor,
          shadowColor: FigmaPalette.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/profilepicture005.png'),
                    Image.asset('assets/images/profilepicture006.png'),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text(completedTasks,
                      style: const TextStyle(fontWeight: FontWeight.normal, color: RosyPalette.white, fontSize: 16),
                    ),
                    Text(taskProgress,
                      style: const TextStyle(fontWeight: FontWeight.normal, color: RosyPalette.white, fontSize: 16),
                    ),
                  ],
                ),
                Text(missionTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, color: RosyPalette.white, fontSize: 20),
                ),

              ],
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed("/test");
      },
    );

  }
}
