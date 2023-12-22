class Match {
  int matchID;
  String event;
  int court;
  String type;
  String status;
  String startDate;
  String team1;
  String team2;
  int team1Score;
  int team2Score;
  String time;

  Match({
    required this.matchID,
    required this.event,
    required this.court,
    required this.type,
    required this.status,
    required this.startDate,
    required this.team1,
    required this.team2,
    required this.team1Score,
    required this.team2Score,
    required this.time,
  });

}
