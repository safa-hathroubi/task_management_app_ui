class Report {
  final int reportID;
  DateTime? date;
  String content;
  int? officerID;
  int? missionID;

  Report({ required this.reportID,
    this.date,
    required this.content,
    required officerID,
    required missionID

  });
}