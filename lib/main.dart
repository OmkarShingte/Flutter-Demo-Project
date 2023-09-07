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
        home: DataList()
        // home: NetworkCall()
        // home: const Operations(title: 'Flutter Home Page'),
        // home: SplashScreen(),
        );
  }
}

class DataListItem extends StatefulWidget{
  @override
  State<DataListItem> createState() => _DataListItemState();
}

class _DataListItemState extends State<DataListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          title: Center(child: Text("Data List"))),
      body: Container(
        color: Colors.blue.shade50,
        child: DataListItem(),
      ),
    );
  }
}