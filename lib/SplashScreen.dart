import 'package:flutter/material.dart';
import 'dart:async';

import 'Operations.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var title = "Title";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Text(
            "Sample",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          //goRoute
          context,
          MaterialPageRoute(
            builder: (context) => Operations(title: "Landing"),
          ));
    });
  }
}
