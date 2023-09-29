import 'package:first/provider/counter_provider.dart';
import 'package:first/provider/looking_for_provider.dart';
import 'package:first/provider/network_call_provider.dart';
import 'package:first/screens/future_builder_example.dart';
import 'package:first/screens/listtile_app.dart';
import 'package:first/screens/looking_for_screen.dart';
import 'package:first/screens/page_one.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/item.dart';
import 'screens/counter_provider_screen.dart';
import 'screens/data_list_screen.dart';
import 'screens/network_call_screen.dart';
import 'screens/network_call_provider_screen.dart';
import 'screens/operations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // var data = Item("", counterProviderFunction(context));
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: currentPageIndex == 0,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                selected: currentPageIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                selected: currentPageIndex == 2,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber[800],
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: 'School',
            ),
          ],
        ),
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent.shade100,
            title: Text(
              "Homepage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
        body: <Widget>[
          homeScreen(context),
          Container(
            height: 50,
            color: Colors.red,
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
        ][currentPageIndex]);
  }

  LayoutBuilder homeScreen(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                  create: (context) => NetworkCallModel(),
                                  child: const NetworkCallProvider()),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text(
                        "Network Call",
                        style: customTextStyle(),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        counterProviderFunction(context);
                      },
                      style: customButtonStyle(),
                      child: Text(
                        "Counter with provider",
                        style: customTextStyle(),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text("Login screen NM", style: customTextStyle())),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataList(),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text("Data List", style: customTextStyle())),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SplashScreen(),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text("Splash Screen", style: customTextStyle())),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Operations(title: 'Flutter Home Page'),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text("Operations", style: customTextStyle())),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NetworkCall(),
                            ));
                      },
                      style: customButtonStyle(),
                      child: Text(
                        "Simple Network call",
                        style: customTextStyle(),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            //goRoute
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                      create: (context) => LookingForProvider(),
                                      child: const LookingForScreen(),
                                    )));
                      },
                      style: customButtonStyle(),
                      child: Text(
                        "Looking for Numbers",
                        style: customTextStyle(),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageOne(),
                          ));
                    },
                    style: customButtonStyle(),
                    child: Text(
                      "Page one",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListTileApp(),
                          ));
                    },
                    style: customButtonStyle(),
                    child: Text(
                      "ListTile Animation",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FutureBuilderExample(),)),
                    child: Text(
                      " Future Builder Example",
                      style: customTextStyle(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void counterProviderFunction(BuildContext context) {
    Navigator.push(
        //goRoute
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => CounterModel(),
              child: const CounterWithProviderScreen()),
        ));
  }

  static const List<Widget> homeOptions = <Widget>[];

  ButtonStyle customButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
    );
  }

  customTextStyle() {
    return const TextStyle(color: Colors.black, fontSize: 16);
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}
