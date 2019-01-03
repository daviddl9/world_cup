import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final String winningTeam;
  ResultScreen(this.winningTeam);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Likely Result')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text(winningTeam, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0))),
            Divider(),
            Text(' is likely to win.', style: TextStyle(fontSize: 30.0),)
          ],
        ),
      ),
    );
  }

}