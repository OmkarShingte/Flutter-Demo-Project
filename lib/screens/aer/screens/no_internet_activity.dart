import 'package:flutter/material.dart';

class NoInternetActivity extends StatelessWidget{
  const NoInternetActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/aer/images/img_noconnection.png', // Replace with your image asset
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'No Internet Connection',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              'You are not connected to the internet.\nMake sure Wi-Fi is on, Airplane Mode is off\nand try again.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 38.0),
            ElevatedButton(
              onPressed: () {
                // Handle retry button click
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEE4B2B), // Change the button background color
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

