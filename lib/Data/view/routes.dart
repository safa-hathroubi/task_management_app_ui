import 'package:flutter/material.dart';
import 'package:task_management/Data/view/screens/chat_screen.dart';
import 'package:task_management/Data/view/screens/login_screen.dart';
import 'package:task_management/Data/view/screens/user_dashboard_screen.dart';
import 'package:task_management/Data/view/screens/test.dart';
import 'package:task_management/Data/view/screens/user_task_details.dart';
export 'package:task_management/Data/view/routes.dart';


final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => const LoginScreen(),
  '/userdashboard': (BuildContext context) => const UserDashboardScreen(),
  '/test': (BuildContext context) => const UserMissionDetails(),
  '/taskdetails': (BuildContext context) => const UserTaskDetails(),
  '/chatscreen': (BuildContext context) => const MyChatApp(),

};



