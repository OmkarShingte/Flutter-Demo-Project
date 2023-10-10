import 'package:first/screens/aer/provider/signin_provider.dart';
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
                        trackOutlineColor: MaterialStateProperty.all(Colors.grey),
                        activeColor: Color(0xFFEE4B2B),
                        // activeTrackColor: Colors.grey,
                        value: _provider.mobileLogin, // Set the initial switch value here
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
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFEE4B2B))),
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
                          style: TextStyle(color: Colors.white),
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
                          // Handle New User Registration text click
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
    if(_provider.mobileLogin){
      var login = _provider.emailLogin(context);
      if (await login) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));
      }
    }else{
      var login = _provider.sendOtp(context);

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
