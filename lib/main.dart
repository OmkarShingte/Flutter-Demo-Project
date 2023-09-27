import 'package:first/provider/counter_provider.dart';
import 'package:first/provider/network_call_provider.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/counter_provider_screen.dart';
import 'screens/data_list_screen.dart';
import 'models/data_model.dart';
import 'screens/network_call_screen.dart';
import 'screens/network_call_provider_screen.dart';
import 'screens/operations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Homepage"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 0,
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
                child: Text(
                  "Network Call",
                  style: CustomTextStyle(),
                )),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (context) => CounterModel(),
                          child: const CounterWithProviderScreen()),
                    ));
              },
              child: Text(
                "Counter with provider",
                style: CustomTextStyle(),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              child: Text("Login screen NM")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataList(),
                    ));
              },
              child: Text("Data List")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ));
              },
              child: Text("Splach Screen")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Operations(title: 'Flutter Home Page'),
                    ));
              },
              child: Text("Operations")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    //goRoute
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NetworkCall(),
                    ));
              },
              child: Text("Simple Network call")),
        ],
      ),
    );
  }

  CustomTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 15);
  }
}
