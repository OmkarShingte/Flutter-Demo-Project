import 'package:first/provider/counter_provider.dart';
import 'package:first/provider/network_call_provider.dart';
import 'package:first/splash_screen.dart';
import 'package:first/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider_screen.dart';
import 'data_list_screen.dart';
import 'models/data_model.dart';
import 'network_call_screen.dart';
import 'network_call_provider_screen.dart';
import 'operations_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NetworkCallModel(),
    child: const MyApp(),
  ));
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
      // home: const CounterWithProviderScreen(),
      // home: const LoginScreen()
      // home: const DataList()
      home: const NetworkCallProvider()
      // home: const NetworkCall()
      // home: const Operations(title: 'Flutter Home Page'),
      // home: const SplashScreen(),
    );
  }
}
