import 'package:flutter/material.dart';

class MatchContainer extends StatelessWidget {
  final int matchID;
  final String event;
  final int court;
  final String type;
  final String status;
  final String startDate;
  final String team1;
  final String team2;
  final int team1Score;
  final int team2Score;
  final String time;
  final VoidCallback onTap;

  MatchContainer({
    Key? key,
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
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 140, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$team1 vs $team2 - $status',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Court: $court'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Text('$event - $startDate'),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: double.infinity,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: onTap,
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}