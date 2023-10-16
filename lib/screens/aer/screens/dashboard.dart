import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Text("Text",style: TextStyle(color: Colors.white),),
      // ),
        bottomNavigationBar:  Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              color: Colors.teal.withOpacity(0.1),
            ),
          ),
        ),
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      // appBar: AppBar(title: Text(""), backgroundColor: Color(0xFFEE4B2B),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color(0xFFEE4B2B),
              child: Column(
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      // IconButton(
                      //   icon: Icon(Icons.menu),
                      //   onPressed: () {
                      //     // Handle menu icon click
                      //   },
                      // ),
                    ],
                  ),
                  const Text(
                    'AER-IAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'sans-serif-medium',
                    ),
                  ),
                  Image.asset(
                    'assets/images/aer/images/img_logo.png',
                    // Replace with your image asset
                    width: 90.0,
                    height: 90.0,
                  ),
                  const Text(
                    'Anulom Technologies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'sans-serif-medium',
                    ),
                  ),
                ],
              ),
            ),
            Transform.rotate(
              angle: 45 * 3.1415927 / 180,
              child: Image.asset(
                'assets/images/aer/images/img_logo.png',
                // Replace with your image asset
                width: 20.0,
                height: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardView(
                  icon: 'assets/images/aer/images/ic_add_lead.png',
                  // Replace with your image asset
                  text: 'Add lead',
                  subText: 'Add new lead',
                  onPressed: () {
                    // FlutterExitApp.exitApp();
                    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    // Handle "Add lead" click
                  },
                ),
                CardView(
                  icon: 'assets/images/aer/images/ic_mylead.png',
                  // Replace with your image asset
                  text: 'My Lead',
                  subText: 'Check your lead',
                  onPressed: () {
                    // Handle "My Lead" click
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: false,
                  child: CardView(
                    icon: 'assets/images/aer/images/ic_adduser.png',
                    // Replace with your image asset
                    text: 'Quick Start',
                    subText: 'Quick Start Registration',
                    onPressed: () {
                      // Handle "Quick Start" click
                    },
                  ),
                ),
                CardView(
                  icon: 'assets/images/aer/images/ic_payment1.png',
                  // Replace with your image asset
                  text: 'Incentive',
                  subText: 'Incentive Status',
                  onPressed: () {
                    // Handle "Incentive" click
                  },
                ),
              ],
            ),
            Visibility(
              visible: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardView(
                    icon: 'assets/images/aer/images/ic_onboard.png',
                    // Replace with your image asset
                    text: 'Onboard ASP',
                    subText: 'Add Onboard ASP',
                    onPressed: () {
                      // Handle "Onboard ASP" click
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final String icon;
  final String text;
  final String subText;
  final Function onPressed;

  const CardView({
    super.key,
    required this.icon,
    required this.text,
    required this.subText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Card(
        // clickable: true,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    alignment: Alignment.center,
                    color: Colors.white,
                    icon,
                    width: 64.0,
                    height: 64.0,
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  // marginTop: 10.0,
                ),
              ),
              Container(
                width: 70.0,
                height: 1.0,
                color: const Color(0xFFEE4B2B),
                margin: const EdgeInsets.all(10.0),
              ),
              Text(
                subText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
