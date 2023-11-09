import 'package:first/bre_crew/screens/authanticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authanticate extends StatefulWidget {
  const Authanticate({super.key});

  @override
  State<Authanticate> createState() => _AuthanticateState();
}

class _AuthanticateState extends State<Authanticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
