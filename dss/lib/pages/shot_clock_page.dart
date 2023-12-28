import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dss/widgets/app_bar.dart';
import 'package:dss/widgets/match_container.dart';

class ShotClockPage extends StatefulWidget {
  final String team;

  const ShotClockPage({Key? key, required this.team}) : super(key: key);

  @override
  _ShotClockPageState createState() => _ShotClockPageState();
}

class _ShotClockPageState extends State<ShotClockPage> {
  bool _isMax = true; // Value needs to be grabbed from the server
  bool _isPaused = true; // Value needs to be grabbed from the server
  DateTime _endTime = DateTime.now().toUtc().add(
      const Duration(seconds: 15)); // Value needs to be grabbed from the server

  Duration _difference = const Duration();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _difference = _endTime.difference(DateTime.now().toUtc());
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (!_isPaused && _difference.inSeconds > 0) {
        setState(() {
          final currentTime = DateTime.now().toUtc();
          if (_endTime.isAfter(currentTime)) {
            // Calculate the difference between end time and current time
            _difference = _endTime.difference(currentTime);
          }
        });
      } else {
        _endTime = DateTime.now().toUtc().add(_difference);
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _endTime =
          DateTime.now().toUtc().add(Duration(seconds: _isMax ? 15 : 10));
      _difference = _endTime.difference(DateTime.now().toUtc());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${widget.team}: Shot Clock'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement undo logic
              },
              child: const Text('UNDO'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isPaused = !_isPaused;
                });
              },
              child: _isPaused ? const Text('RESUME') : const Text('PAUSE'),
            ),
            ElevatedButton(
              onPressed: _resetTimer,
              child: const Text('RESET'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('10'),
                Switch(
                  value: _isMax,
                  onChanged: (value) {
                    setState(() {
                      _isMax = value;
                    });
                  },
                ),
                const Text('15'),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _difference.inSeconds.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
