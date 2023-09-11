import 'package:first/provider/network_call_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkCallProvider extends StatefulWidget {
  const NetworkCallProvider({super.key});

  @override
  State<NetworkCallProvider> createState() => _NetworkCallProvider();
}

class _NetworkCallProvider extends State<NetworkCallProvider> {
  late NetworkCallModel networkCallModel;
  @override
  void initState() {
    super.initState();
    networkCallModel = NetworkCallModel();
    networkCallModel = Provider.of<NetworkCallModel>(context, listen: false);
    networkCallModel.getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Center(
            child: Text(
              "widget.title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
      ),
      body: Consumer<NetworkCallModel>(
        builder: (context, value, child) {
          if (value.album == null) {
            return const Center(child: Text("No data found"));
          } else {
            return Center(
              child: Text("${value.album!.title} ${value.album!.title}"),
            );
          }
        },
      ),
    );
  }
}
