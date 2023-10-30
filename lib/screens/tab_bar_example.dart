import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            unselectedLabelColor: Colors.red,
            labelColor: Colors.yellow,
            dividerColor: Colors.black,
            tabs: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.green),
                child: Column(
                  children: [Icon(Icons.cloud_outlined)],
                ),
              ),
              Tab(
                icon: Icon(Icons.cloud_outlined),
                child: Text("data"),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
