import 'package:first/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first/provider/counter_provider.dart';

class CounterWithProviderScreen extends StatefulWidget {
  const CounterWithProviderScreen({super.key});

//  multi provider
//  get it - DI
//  locator
//   singleton class
//  media query
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
              ),
              CustomButton()
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
