import 'package:task_management/Data/Models/task.dart';

class Mission {
  final int missionID;
  final String title;
  int priorityLevel; //if 0 then it's urgent
  Status status;
  bool approved;
  late List<Task> tasks;
  int? userID;


  Mission({ required this.missionID,
  required this.title,
  required this.status,
  required this.priorityLevel,
    this.approved = false,
    required this.userID,
    List<Task>? tasks,
  }) : tasks = tasks ?? const [];  //bch etasks ikounou initializés elista fer8a
}

enum Status {
  todo,
  inProgress,
  waitingApproval,
  completed,
}