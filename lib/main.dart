import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/Data.dart';
import 'package:http/http.dart' as http;

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

class DataListItem extends StatefulWidget {
  const DataListItem({super.key});

  @override
  State<DataListItem> createState() => _DataListItemState();
}

class _DataListItemState extends State<DataListItem> {
  Future<ResponseClass>? dataArray;

  Future<ResponseClass> fetchData() async {
    final response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
    if (response.statusCode == 200) {
      return ResponseClass.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // fetchData();
    dataArray = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<ResponseClass>(
        future: dataArray,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.results == null
                    ? 0
                    : snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                    ),
                    title: Text(snapshot.data!.results![index].name!.title!),
                    subtitle: Text(snapshot.data!.results![index].name!.first!),
                    isThreeLine: true,
                    trailing: Text(snapshot.data!.results![index].name!.last!),
                  );
                });
          } else {
            print("snapshot.error   ${snapshot.error} ");
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class DataList extends StatelessWidget {
  const DataList({super.key});

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
