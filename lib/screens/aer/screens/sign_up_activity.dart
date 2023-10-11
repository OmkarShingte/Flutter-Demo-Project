import 'package:first/screens/aer/screens/signIn_activity.dart';
import 'package:flutter/material.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({super.key});

  @override
  State<SignUpActivity> createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEE4B2B),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Here’s\nyour first\nstep with \nus!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/aer/images/img_signup.png',
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Last Name',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 50.0,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: '+91',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Phone',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email ID',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'City',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Pincode',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Confirm Password',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Register button click
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEE4B2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27.0),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () {
                              // Handle "Already have an account?" text click
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInActivity(),
                                  ));
                            },
                            child: const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Visibility(
        visible: false, // Set visibility based on your needs
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
