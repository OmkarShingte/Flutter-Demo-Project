import 'package:first/provider/operations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationsProvider extends StatefulWidget {
  const OperationsProvider({super.key, required this.title});

  final String title;

  @override
  State<OperationsProvider> createState() => _OperationsProviderState();
}

class _OperationsProviderState extends State<OperationsProvider> {
  var n1Con = TextEditingController();
  var n2Con = TextEditingController();
  var result = 0;
  var n2 = 0;
  var n1 = 0;
  var title = "";

  _OperationsProviderState();

  @override
  Widget build(BuildContext context) {
    return Consumer<OperationsModel>(
      builder: (context, value, child) {
        final operationModel = context.read<OperationsModel>();
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: Center(
              child: Text(widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24))),
        ),
        body: Container(
          color: Colors.grey.shade200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: n1Con,
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: n2Con,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              n1 = int.parse(n1Con.text.toString());
                              n2 = int.parse(n2Con.text.toString());
                              operationModel.add(n1, n2);
                            },
                            child: const Text("Add")),
                        ElevatedButton(
                            onPressed: () {
                              n1 = int.parse(n1Con.text.toString());
                              n2 = int.parse(n2Con.text.toString());
                              operationModel.sub(n1, n2);
                            },
                            child: const Text("Sub")),
                        ElevatedButton(
                            onPressed: () {
                              n1 = int.parse(n1Con.text.toString());
                              n2 = int.parse(n2Con.text.toString());
                              operationModel.multiply(n1, n2);
                            },
                            child: const Text("Mul")),
                        ElevatedButton(
                            onPressed: () {
                              n1 = int.parse(n1Con.text.toString());
                              n2 = int.parse(n2Con.text.toString());
                              operationModel.divide(n1, n2);
                            },
                            child: const Text("Div")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
                    child: Text(
                      "Result : $result",
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
      },
    );
  }
}
