import 'dart:async';
import 'package:first/screens/aer/common/internet_connectivity.dart';
import 'package:flutter/material.dart';
import 'introduction_activity.dart';
import 'no_internet_activity.dart';

class AerApp extends StatefulWidget {
  const AerApp({super.key});

  @override
  State<AerApp> createState() => _AerAppState();
}

class _AerAppState extends State<AerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('assets/images/aer/images/img_logo.png'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    internetCheck();
  }

  void internetCheck() async {
    bool isConnected = await InternetConnectivity.isConnected();
    Timer(const Duration(seconds: 2), () {
      if (!isConnected) {
        Navigator.pushReplacement(
            //goRoute
            context,
            MaterialPageRoute(
              builder: (context) => const NoInternetActivity(),
            ));
      } else {
        Navigator.pushReplacement(
            //goRoute
            context,
            MaterialPageRoute(
              builder: (context) => const IntroductionActivity(),
            ));
      }
    });
  }
}
