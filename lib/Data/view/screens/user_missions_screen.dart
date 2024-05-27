import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/custom_components/task_card.dart';

import '../Components/custom_components/mission_card.dart';

class UserMissionsScreen extends StatelessWidget {
  const UserMissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
            body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:40, bottom: 50),

            // TODO: wrap the Column widget inside a scrollable list widget List.build
            /* List<E> items = <E>[...];

          ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                // access element from list using index
                // you can create and return a widget of your choice
                return <Widget>;
              }
          )*/


            child: Column(
              children: [
                const Text(
                  'User Missions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Image.asset('assets/images/virtual_reality.png'),

                //const SizedBox(height: 50),
                //const SocialButton(iconPath: 'assets/svgs/g_logo.svg', label: 'Continue with Google'),
                //const SizedBox(height: 20),
                //const SocialButton(
                //iconPath: 'assets/svgs/f_logo.svg',
                //label: 'Continue with Facebook',
                //horizontalPadding: 90,
                //),
                //const SizedBox(height: 15),
                /*const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),*/
                const SizedBox(height: 20, width: 200),
                // TODO: instead of passing the parameters directly, make a mission_data_set + task_data_set to pass as a parameter and extract the values from them
                const MissionCard(
                  missionTitle: "Mission Create Ad Banner",
                  completedTasks: "12/13 Tasks",
                  taskProgress: "93%",
                  missionUserList: ["user1", "user2"],
                  priorityLevel: 0,
                ),
                const MissionCard(
                  missionTitle: "Mission Complete Portfolio",
                  completedTasks: "6/10 Tasks",
                  taskProgress: "60%",
                  missionUserList: ["user2"],
                  priorityLevel: 1,
                ),
                const MissionCard(
                  missionTitle: "Mission Complete Portfolio",
                  completedTasks: "6/10 Tasks",
                  taskProgress: "60%",
                  missionUserList: ["user2"],
                  priorityLevel: 1,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

