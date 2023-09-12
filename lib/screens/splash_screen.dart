import 'package:flutter/material.dart';
import 'dart:async';
import '../screens/operations_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
        child: const Center(
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
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          //goRoute
          context,
          MaterialPageRoute(
            builder: (context) => const Operations(title: "Landing"),
          ));
    });
  }
}
