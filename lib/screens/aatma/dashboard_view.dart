import 'package:first/screens/aatma/widgets/extension_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'lessons_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color selectedColor = Colors.white;
  Color unselectedColor = Colors.blue;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              color: Colors.red,
              // color: AppColors.lightBlue,
              child: NavigationBar(
                backgroundColor: Colors.lightBlue,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                selectedIndex: _selectedIndex,
                destinations: <Widget>[
                  GestureDetector(
                      onTap: () => _onItemTapped(0),
                      child: CustomBottomNavigation(
                        selectedIndex: _selectedIndex,
                        index: 0,
                        icon: Icons.access_alarm_rounded,
                        title: "Home",
                      )),
                  GestureDetector(
                      onTap: () => _onItemTapped(1),
                      child: CustomBottomNavigation(
                        selectedIndex: _selectedIndex,
                        index: 1,
                        icon: Icons.access_alarm_rounded,
                        title: "Courses",
                      )),
                  GestureDetector(
                      onTap: () => _onItemTapped(2),
                      child: CustomBottomNavigation(
                        selectedIndex: _selectedIndex,
                        index: 2,
                        icon: Icons.access_alarm_rounded,
                        title: "My Activities",
                      )),
                ],
              ),
            ),
          ),
        ),
        // appBar: AppBar(
        //   title: Text("Dashboard"),
        // ),
        body: <Widget>[
          Container(
            height: 100,
            color: Colors.red,
          ),
          Lessons(),
          Container(
            height: 100,
            color: Colors.green,
          ),
        ][_selectedIndex]);
  }
}
