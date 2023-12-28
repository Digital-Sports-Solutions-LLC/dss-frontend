import 'package:dss/models/match.dart';
import 'package:flutter/material.dart';
import 'package:dss/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dss/widgets/app_bar.dart';
import 'package:dss/widgets/match_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Match> matchesList = [];
  bool isLoading = true;
  void fetchData() async {
    try {
      final response = await http.get(Uri.parse("${api}match/api/"));
      final jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        Match match = Match(
          matchID: element['match_ID'],
          event: element['court_event']['event']['name'],
          court: element['court_event']['courtNumber'],
          type: element['match_type']['title'],
          status: element['status'],
          startDate: element['court_event']['event']['startDate'],
          team1: element['team1']['teamAcronym'],        
          team2: element['team2']['teamAcronym'],
        );
        matchesList.add(match);
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: const CustomAppBar(title: "DSS"),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: matchesList.map((e) {
                return MatchContainer(
                  matchID: e.matchID,
                  event: e.event,
                  court: e.court,
                  type: e.type,
                  status: e.status,
                  startDate: e.startDate,
                  team1: e.team1,
                  team2: e.team2,
                  onTap: () {
                    print(e.matchID.toString());
                  },
                );
              }).toList(),
            ),
    );
  }
}
