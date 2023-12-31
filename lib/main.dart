import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/bre_crew/model/user.dart';
import 'package:first/bre_crew/screens/wrapper.dart';
import 'package:first/bre_crew/services/auth.dart';
import 'package:first/firebase_options.dart';
import 'package:first/provider/counter_provider.dart';
import 'package:first/provider/looking_for_provider.dart';
import 'package:first/provider/network_call_provider.dart';
import 'package:first/screens/aer/screens/splash.dart';
import 'package:first/screens/camera_screenshot_example.dart';
import 'package:first/screens/db_example/model/db_model.dart';
import 'package:first/screens/db_example/provider/db_provider.dart';
import 'package:first/screens/db_example/screen/db_example_screen.dart';
import 'package:first/screens/future_builder_example.dart';
import 'package:first/screens/listtile_app.dart';
import 'package:first/screens/looking_for_screen.dart';
import 'package:first/screens/page_one.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/login_screen.dart';
import 'package:first/screens/student_app.dart';
import 'package:first/screens/tab_bar_example.dart';
import 'package:first/screens/tab_swipe.dart';
import 'package:first/screens/youtube_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/counter_provider_screen.dart';
import 'screens/data_list_screen.dart';
import 'screens/network_call_screen.dart';
import 'screens/network_call_provider_screen.dart';
import 'screens/operations_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
                  // Navigator.pop(context);
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
            title: const Text(
              "Homepage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
        // AppBar(
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 16),
        //       child: GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               isReadOnly = !isReadOnly;
        //               editCancelIcon =
        //               isReadOnly ? Icon(Icons.edit) : Icon(Icons.close);
        //               if (isReadOnly) {
        //                 setData();
        //               }
        //             });
        //           },
        //           child: editCancelIcon),
        //     ),
        //   ],
        //   title:
        //   Text(AppLocalizations.of(context)!.titleSugarCanePlantationForm),
        // )
        body: <Widget>[
          homeScreen(context),
          Container(
            height: 50,
            color: Colors.red,
            child: AerApp(),
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
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StreamProvider<UserUid?>.value(
                                initialData: UserUid(uid: "uid"),
                                value: AuthService().user,
                                child: Wrapper()),
                          ));
                    },
                    child: Text(
                      "Brew Crew App",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => DbProvider(),
                                child: const DbExampleScreen()),
                          ));
                    },
                    child: Text(
                      "Db Example",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      final cameras = await availableCameras();
                      final firstCamera = cameras.first;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CameraScreenshotExample(camera: firstCamera),
                          ));
                    },
                    child: Text(
                      "Camera Screenshot Example",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabBarExample(),
                        )),
                    child: Text(
                      "Tab Bar Example",
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
                            builder: (context) => TabSwipe(),
                          ));
                    },
                    child: Text(
                      "Tab bar TabSwipe",
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
                            builder: (context) => StudentApp(),
                          ));
                    },
                    child: Text(
                      "Student App",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
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
                // Container(
                //   margin: const EdgeInsets.only(bottom: 10),
                //   width: 250,
                //   child: ElevatedButton(
                //     onPressed: () =>
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => AerApp(),
                //             )),
                //     child: Text(
                //       "AER App",
                //       style: customTextStyle(),
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FutureBuilderExample(),
                        )),
                    child: Text(
                      "Future Builder Example",
                      style: customTextStyle(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YoutubeScreen(),
                        )),
                    child: Text(
                      "Youtube Player",
                      style: customTextStyle(),
                    ),
                  ),
                ),
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
