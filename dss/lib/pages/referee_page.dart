import 'package:dss/pages/shot_clock_page.dart';
import 'package:dss/widgets/match_container.dart';
import 'package:flutter/material.dart';
import 'package:dss/widgets/app_bar.dart';

class RefereePage extends StatelessWidget {
  final MatchContainer match; // Pass the Match object to the RefereePage

  const RefereePage({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: match.event),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Court: ${match.court.toString()}'),
            const SizedBox(height: 20),
            const Text('Shot Clockers'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShotClockPage(number: 1, team: match.team1, match_id: match.matchID)),
                    );
                  },  
                  child: Text(match.team1),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShotClockPage(number: 2, team: match.team2, match_id: match.matchID)),
                    );
                  },
                  child: Text(match.team2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Referees'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GameClockPage()),
                // );
              },
              child: const Text('Game Clock'),
            ),
            const SizedBox(height: 20),
            const Text('Other'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PracticePage()),
                // );
              },
              child: Text('Practice Page'),
            ),
          ],
        ),
      ),
    );
  }
}
