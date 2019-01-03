import 'package:flutter/material.dart';
import 'package:world_cup/result.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController team1_textController = TextEditingController(),
      team2_textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/world_cup.png'),
      ),
    );

    final team1_field = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: team1_textController,
      decoration: InputDecoration(
        hintText: 'Team #1',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final team2_field = TextFormField(
      autofocus: false,
      controller: team2_textController,
      decoration: InputDecoration(
        hintText: 'Team #2',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultScreen(
                _generateWinningTeam()),
                settings: RouteSettings(
                  name: 'result_page',
                  isInitialRoute: false
                ),
              )
            );
          },
          color: Colors.lightBlueAccent,
          child: Text('Predict Winner', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            team1_field,
            SizedBox(height: 8.0),
            Center(child: Text('vs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.green),)),
            SizedBox(height: 8.0),
            team2_field,
            SizedBox(height: 24.0),
            loginButton
          ],
        ),
      ),
    );
  }

  String _generateWinningTeam() {
    int team1_code = team1_textController.text.hashCode;
    int team2_code = team2_textController.text.hashCode;
    if (team1_code > team2_code) {
      return team1_textController.text;
    } return team2_textController.text;
  }
}