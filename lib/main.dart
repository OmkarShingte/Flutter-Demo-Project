import 'package:first/provider/counter_provider.dart';
import 'package:first/provider/network_call_provider.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent.shade100,title: const Center(child: Text("Homepage", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
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
            SizedBox(
              width: 250,
              child: ElevatedButton(
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
                  style: customButtonStyle(),
                  child: Text(
                    "Counter with provider",
                    style: customTextStyle(),
                  )),
            ),
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
          ],
        ),
      ),
    );
  }

  ButtonStyle customButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
    );
  }

  customTextStyle() {
    return const TextStyle(color: Colors.black, fontSize: 16);
  }
}
