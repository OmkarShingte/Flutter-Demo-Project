import 'dart:convert';
import 'package:first/splash_screen.dart';
import 'package:flutter/material.dart';
import 'Operations.dart';
import 'models/Data.dart';
import 'package:http/http.dart' as http;
import 'network_call.dart';


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
        home: const DataList()
        // home: const NetworkCall()
        // home: const Operations(title: 'Flutter Home Page'),
        // home: const SplashScreen(),
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
    super.initState();
    // fetchData();
    dataArray = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseClass>(
      future: dataArray,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data!.results == null
                ? 0
                : snapshot.data!.results!.length,
            itemBuilder: (context, index) {
              var item = snapshot.data!.results![index];
              var location =
                  "${item.location!.city!}, ${item.location!.state!}, ${item.location!.country!}";
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.cyan,
                          backgroundImage: NetworkImage(
                              snapshot.data!.results![index].picture!.medium!),
                        ),
                      ),
                      // ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${item.name!.first!} ${item.name!.last!}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(item.dob!.age!.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(location),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(item.email!.toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        } else {
          return Text('${snapshot.error}');
        }
        // return const CircularProgressIndicator();
      },
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
          title: const Center(child: Text("Data List"))),
      body: Container(
        color: Colors.blue.shade50,
        child: const DataListItem(),
      ),
    );
  }
}
