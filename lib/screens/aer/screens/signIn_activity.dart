import 'package:first/screens/aer/provider/signin_provider.dart';
import 'package:first/screens/aer/screens/sign_up_activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class SignInActivity extends StatefulWidget {
  const SignInActivity({super.key});

  @override
  State<SignInActivity> createState() => _SignInActivityState();
}

class _SignInActivityState extends State<SignInActivity> {
  SignInProvider _provider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => SignInProvider(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Already',
                          style: customTestStyle(),
                        ),
                        Text(
                          ' have an',
                          style: customTestStyle(),
                        ),
                        Text(
                          ' Account?',
                          style: customTestStyle(),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/aer/images/img_signin.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Mobile',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xFFEE4B2B),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Switch(
                        // trackColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor:
                            MaterialStateProperty.all(Colors.grey),
                        activeColor: const Color(0xFFEE4B2B),
                        // activeTrackColor: Colors.grey,
                        value: _provider.mobileLogin,
                        // Set the initial switch value here
                        onChanged: (bool value) {
                          setState(() {
                            _provider.mobileLogin = !_provider.mobileLogin;
                          });
                        },
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Email',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFEE4B2B),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 14.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: Column(
                          children: [
                            Visibility(
                              visible: !_provider.mobileLogin,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFEE4B2B))),
                                  hintText: 'Enter Mobile Number',
                                  labelText: 'Mobile Number',
                                  alignLabelWithHint: true,
                                  counterText: '',
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                              ),
                            ),
                            Visibility(
                              visible: _provider.mobileLogin,
                              child: TextFormField(
                                controller: _provider.emailIdController,
                                decoration: const InputDecoration(
                                  labelText: 'Email ID',
                                  hintText: 'Email ID',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Visibility(
                              visible: _provider.mobileLogin,
                              child: TextFormField(
                                controller: _provider.passwordController,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  counterText: '',
                                  suffixIcon: Icon(Icons.visibility),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          emailLogin(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEE4B2B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                        ),
                        child: Text(
                          _provider.mobileLogin ? 'LOGIN' : 'SEND OTP',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          // Handle Forgot Password text click
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFEE4B2B),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpActivity(),
                              ));
                        },
                        child: const Text(
                          'New user? Register Now',
                          style: TextStyle(
                            color: Color(0xFFEE4B2B),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'By logging in, you agree to the terms and conditions',
                        style: TextStyle(
                          color: Color(0xFFEE4B2B),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  Future<void> emailLogin(BuildContext context) async {
    if (_provider.mobileLogin) {
      // var status = await _provider.emailLogin();
      // if (status != 0) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ));
      // }
    } else {
      // if (_provider.mobileController.text.length != 10) {//{"status": 0, "msg": "Invalid User"}
      //   if (_provider.sendOtp() == 1) {
      TextEditingController otpController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text("OTP")),
          content: TextFormField(
            controller: otpController,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEE4B2B))),
              hintText: 'Enter OTP',
              labelText: 'OTP',
              alignLabelWithHint: true,
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // emailLogin(context);
                  // if (_provider.login?.otp == otpController.text) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ));
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEE4B2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                ),
                child: const Text(
                  "Verify OTP",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
      // }
      // }
    }
  }

  TextStyle customTestStyle() {
    return const TextStyle(
      color: Color(0xFFEE4B2B),
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    );
  }
}
