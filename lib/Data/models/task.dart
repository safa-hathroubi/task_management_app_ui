class Task {
  final int taskID;
  final String taskName;
  final int progress;
  final int missionID;
  final String taskDescription;
  int? userID;


  Task({ required this.taskID,
    required this.taskName,
    required this.missionID,
    this.progress = 0,
    required this.taskDescription,
    required this.userID

  });
}