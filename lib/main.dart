import 'package:first/counter_model.dart';
import 'package:first/splash_screen.dart';
import 'package:first/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_list.dart';
import 'models/Data.dart';
import 'network_call.dart';
import 'operations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterModel(),
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
      home: const CounterWithProviderScreen(),
      // home: const LoginScreen()
      // home: const DataList()
      // home: const NetworkCall()
      // home: const Operations(title: 'Flutter Home Page'),
      // home: const SplashScreen(),
    );
  }
}

class CounterWithProviderScreen extends StatefulWidget {
  const CounterWithProviderScreen({super.key});

  @override
  State<CounterWithProviderScreen> createState() =>
      _CounterWithProviderScreenState();
}

class _CounterWithProviderScreenState extends State<CounterWithProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Counter with provider"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("You have pushed button this many times"),
              Text(
                "${value.count}",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final counter = context.read<CounterModel>();
            counter.increment();
          },
          tooltip: "Increment",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
