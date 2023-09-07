import 'package:flutter/material.dart';

class Operations extends StatefulWidget {
  const Operations({super.key, required this.title});

  final String title;

  @override
  State<Operations> createState() => _OperationsState(title);
}

class _OperationsState extends State<Operations> {
  var n1Con = TextEditingController();
  var n2Con = TextEditingController();
  var result = 0;
  var n2 = 0;
  var n1 = 0;
  var title = "";

  _OperationsState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Center(
            child: Text(widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
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
                            setState(() {
                              result = n1 + n2;
                            });
                          },
                          child: Text("Add")),
                      ElevatedButton(
                          onPressed: () {
                            n1 = int.parse(n1Con.text.toString());
                            n2 = int.parse(n2Con.text.toString());
                            setState(() {
                              result = n1 - n2;
                            });
                          },
                          child: Text("Sub")),
                      ElevatedButton(
                          onPressed: () {
                            n1 = int.parse(n1Con.text.toString());
                            n2 = int.parse(n2Con.text.toString());
                            setState(() {
                              result = n1 * n2;
                            });
                          },
                          child: Text("Mul")),
                      ElevatedButton(
                          onPressed: () {
                            n1 = int.parse(n1Con.text.toString());
                            n2 = int.parse(n2Con.text.toString());
                            setState(() {
                              result = n1 ~/ n2;
                            });
                          },
                          child: Text("Div")),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(21),
                  child: Text(
                    "Result : $result",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
