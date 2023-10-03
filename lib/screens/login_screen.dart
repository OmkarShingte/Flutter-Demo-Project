import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNumber = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  bool selected = false;

  @override
  void dispose() {
    mobileNumber.dispose();
    password.dispose();
    super.dispose();
  }

  void validateLogin() {
    if (_formKey.currentState!.validate() &
        _formKey1.currentState!.validate()) {
      // If the form is valid, display a snack-bar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40.0, top: 40),
                  child: Center(child: Image.asset('assets/images/logo.png')),
                ),
/*              const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),*/
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Form(
                      key: _formKey1,
                      child: TextFormField(
                        controller: mobileNumber,
                        decoration: const InputDecoration(
                            hintText: "Enter mobile number",
                            counterStyle: TextStyle(color: Colors.black),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.zero
                                /*borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))*/
                                )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mobile number';
                          } else if (value.length < 10) {
                            return 'Please enter 10 digit mobile number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                    ),
                  ),
                ),
                const Center(
                    child: Text(
                  "Select your country code and enter mobile number",
                  style: TextStyle(color: Colors.grey),
                )),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 5),
                            // add padding to adjust icon
                            child: Icon(
                              Icons.remove_red_eye,
                              size: 24,
                            )),
                        suffixIconColor: Colors.blue,
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 5),
                            // add padding to adjust icon
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                              size: 24,
                            )),
                        hintText: "Password",
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 8) {
                          return 'Please enter valid text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.lightBlue),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: () {
                        validateLogin();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)))),
                        minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(40)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough),
                        ),
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.confirmation_num_sharp),
                    tooltip: "kkkk"),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Center(
                    child: Container(
                      width: 250.0,
                      height: 250.0,
                      color: Colors.red,
                      child: AnimatedAlign(
                        alignment: selected
                            ? Alignment.topRight
                            : Alignment.bottomLeft,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child: const FlutterLogo(size: 50.0),
                      ),
                    ),
                  ),
                )
/*
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(6),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade500),
                          // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              fontSize: 30, color: Colors.white))),
                      child: const Text(
                        "Login or Signup",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                )
*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv4zC7NwaSFUy+xeAszAd6d2QFiouMsh5qf9OPZkGlUiWCQWNehVDIJbPMpK5w09W7VkNzCliy7hvn+TkkCMca+awHLC9yWIzzjO0gyr3SVBK3wA76748nGQeJJGWJeZfcRRr5JinMJ/JPRKnrNirhXtVJJqH3rZA5vOHqEbZ2uX2nVhUGP0+xmwd48qqxnhdaNoUtz/X5iCp4CNY4PEZhsTMXL9Ixe2aRTT3/X3+LMOxgC0djLC2UUTLBqvhqRZI7Z2TuFfDxr0TkMvZJ7ynYy5LPgjtslX2CqHzwRimwSPFwRpO+me4fZKEABtUhl3Yyp1+Az6r2l7GakJcEilVAU4B0/g8AxWRkULMbxhrWVsM270/8YaG4lhUWqgRV0S758QR7HWQZ4M6o9BErUB2+9x6zLHDOWKAfMbIuJ2Y5VaD2uPkdCYeG8nS9dv85/lKNfseFv9quOnqIRTyav8m5BAi/q+fB43yPuEOexQLwDLlYKzWmV3sGs8jKLFazO60= mobantica@mobantica
