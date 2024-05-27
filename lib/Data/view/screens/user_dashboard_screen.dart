import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/custom_components/task_card.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';
import 'package:task_management/Data/view/screens/user_chats_list.dart';
import 'package:task_management/Data/view/screens/user_missions_screen.dart';
import 'package:task_management/Data/view/screens/user_tasks_screen.dart';

import '../Components/custom_components/mission_card.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({Key? key}) : super(key: key);

  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const UserMissionsScreen(),
    const UserChatsList(),
    const UserTasksScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: FigmaPalette.grey,
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },

        tooltip: 'Chat',
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        color: FigmaPalette.transparentGrey2,
        surfaceTintColor: FigmaPalette.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: const Icon(Icons.home, color: Colors.amber),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: const Icon(Icons.task, color: Colors.black45),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: _screens[_currentIndex],
        ),
      ),
      /*body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
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
                const SizedBox(height: 20, width: 200),
                const MissionCard(
                  missionTitle: "Mission Create Ad Banner",
                  completedTasks: "12/13 Tasks",
                  taskProgress: "93%",
                  missionUserList: ["user1", "user2"],
                  priorityLevel: 0,
                ),
                const TaskCard(
                  taskName: "Task 1",
                  taskDescription:
                  "Description:  Example this text means nothing, it’s just to simulate a brief description of the task.",
                  taskProgress: "93%",
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
      ),*/
    );
  }
}
