import 'package:flutter/material.dart';
import 'package:dss/pages/referee_page.dart';

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String monthAbbreviation = _getMonthAbbreviation(date.month);
  String dayWithSuffix = _getDayWithSuffix(date.day);
  return '$monthAbbreviation $dayWithSuffix';
}

String _getMonthAbbreviation(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}

String _getDayWithSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '$day' 'th';
  }
  switch (day % 10) {
    case 1:
      return '$day' 'st';
    case 2:
      return '$day' 'nd';
    case 3:
      return '$day' 'rd';
    default:
      return '$day' 'th';
  }
}

class MatchContainer extends StatelessWidget {
  final int matchID;
  final String event;
  final int court;
  final String type;
  final String status;
  final String startDate;
  final String team1;
  final String team2;
  final VoidCallback onTap;

  const MatchContainer({
    Key? key,
    required this.matchID,
    required this.event,
    required this.court,
    required this.type,
    required this.status,
    required this.startDate,
    required this.team1,
    required this.team2,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 140, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.red[200],
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
                    child: Text('$event - ${formatDate(startDate)}'),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: double.infinity,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Navigate to the referee page when the '+' button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RefereePage(match: this),
                    ),
                  );
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
