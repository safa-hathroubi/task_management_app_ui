import 'package:flutter/material.dart';
import 'package:task_management/Data/view/routes.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

import 'Data/view/screens/login_screen.dart';
import 'Data/view/screens/user_dashboard_screen.dart';


void main() {
  /*final Map<String, WidgetBuilder> routes = {
    '/login': (BuildContext context) => const LoginScreen(),
    '/userdashboard': (BuildContext context) => const UserDashboardScreen(),
  };*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: FigmaPalette.white,
      ),
      initialRoute: '/login',// Set the initial route
      routes: routes, // Use the routes from routes.dart
    );
  }
}
