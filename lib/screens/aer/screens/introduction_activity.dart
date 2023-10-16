import 'package:first/screens/aer/screens/signIn_activity.dart';
import 'package:first/screens/aer/screens/sign_up_activity.dart';
import 'package:flutter/material.dart';
import '../common/internet_connectivity.dart';
import 'no_internet_activity.dart';

class IntroductionActivity extends StatelessWidget {
  const IntroductionActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Expanded(
            child: ViewFlipperWidget(), // Create a ViewFlipperWidget
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpActivity(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEE4B2B), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sans-serif-medium',
                        // textAllCaps: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Login(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEE4B2B), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sans-serif-medium',
                        // textAllCaps: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void Login(BuildContext context) async {
    bool isConnected = await InternetConnectivity.isConnected();
    if (!isConnected) {
      Navigator.pushReplacement(
          //goRoute
          context,
          MaterialPageRoute(
            builder: (context) => const NoInternetActivity(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInActivity(),
          ));
    }
  }
}

class ViewFlipperWidget extends StatefulWidget {
  const ViewFlipperWidget({super.key});

  @override
  _ViewFlipperWidgetState createState() => _ViewFlipperWidgetState();
}

class _ViewFlipperWidgetState extends State<ViewFlipperWidget> {
  int _currentIndex = 0;
  final List<String> imageList = [
    'assets/images/aer/images/img_logo.png',
    // Replace with your image assets
    'assets/images/aer/images/img_noconnection.png',
    // Replace with your image assets
    // 'assets/image_2.png', // Replace with your image assets
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Stack(
        children: [
          PageView.builder(
            itemCount: imageList.length,
            controller: PageController(viewportFraction: 1.0),
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                imageList[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
        ],
      ),
    );
  }
}
