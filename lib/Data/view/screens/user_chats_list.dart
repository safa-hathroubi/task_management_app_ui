import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/custom_components/arrow_button.dart';
import 'package:task_management/Data/view/Components/custom_components/task_card.dart';

import '../Components/custom_components/mission_card.dart';

class UserChatsList extends StatelessWidget {
  const UserChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top:30, bottom: 50),

            // TODO: wrap the Column widget inside a scrollable list widget List.build

            child: Column(
              children: [
                Text(
                  'Direct Messages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20, width: 200),
                ArrowButton(gotoRoute: "chatscreen", missionTitle: "Mission Create Ad Banner", priorityLevel: 0),
                ArrowButton(gotoRoute: "chatscreen", missionTitle: "Mission Complete Portfolio", priorityLevel: 1),
                ArrowButton(gotoRoute: "chatscreen", missionTitle: "Mission Complete Portfolio", priorityLevel: 1),
                ArrowButton(gotoRoute: "chatscreen", missionTitle: "Mission Complete Portfolio", priorityLevel: 1),
                //Spacer(), //add empty space to bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}

