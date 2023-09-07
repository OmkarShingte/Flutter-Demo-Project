import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var n1Con = TextEditingController();
  var n2Con = TextEditingController();
  var result = 0;
  var n2 = 0;
  var n1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue.shade100,
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
                              result = n1+n2;
                            });
                          },
                          child: Text("Add")),
                      ElevatedButton(onPressed: () {
                        n1 = int.parse(n1Con.text.toString());
                        n2 = int.parse(n2Con.text.toString());
                        setState(() {
                          result = n1-n2;
                        });
                      }, child: Text("Sub")),
                      ElevatedButton(onPressed: () {
                        n1 = int.parse(n1Con.text.toString());
                        n2 = int.parse(n2Con.text.toString());
                        setState(() {
                          result = n1*n2;
                        });
                      }, child: Text("Mul")),
                      ElevatedButton(onPressed: () {
                        n1 = int.parse(n1Con.text.toString());
                        n2 = int.parse(n2Con.text.toString());
                        setState(() {
                          result = n1~/n2;
                        });
                      }, child: Text("Div")),
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
