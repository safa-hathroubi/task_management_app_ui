class Comment {
  final int commentID;
  DateTime? date;
  String content;
  int? officerID;
  int? taskID;

  Comment({ required this.commentID,
    this.date,
    required this.content,
    required officerID,
    required taskID

  });
}