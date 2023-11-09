import 'package:first/bre_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Text(
          "Brew Crew",
        ),
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            onPressed: () {
             authService.signOut();
            },
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
