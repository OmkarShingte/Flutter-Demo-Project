import 'package:first/bre_crew/model/user.dart';
import 'package:first/bre_crew/screens/authanticate/authanticate.dart';
import 'package:first/bre_crew/screens/homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid>(context);
    print("object $user");

    // home/auth
    return user == null ? Authanticate() : Home();
  }
}
