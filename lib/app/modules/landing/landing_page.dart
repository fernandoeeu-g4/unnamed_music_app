import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LandingPage extends StatefulWidget {
  final String title;
  const LandingPage({Key key, this.title = "Landing"}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final userBox = Hive.box('user');
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // print(userBox.get('isLogged', defaultValue: false));
      if (!initialized) {
        if (!userBox.get('isLogged', defaultValue: false)) {
          Navigator.pushReplacementNamed(context, '/signin');
        } else {
          Navigator.pushReplacementNamed(context, '/home');
        }
        setState(() {
          initialized = true;
        });
      }
    });
    return Scaffold();
  }
}
