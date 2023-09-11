import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "Login Screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                    child: Image.network(
                        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter mobile number",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero)),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 15),
                          // add padding to adjust icon
                          child: Icon(
                            Icons.wifi_password,
                            size: 24,
                          )),
                      suffixIconColor: Colors.blue,
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 15),
                          // add padding to adjust icon
                          child: Icon(
                            Icons.password,
                            color: Colors.green,
                            size: 24,
                          )),
                      hintText: "Enter Password",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero)),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
