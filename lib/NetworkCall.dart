import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/Album.dart';

class NetworkCall extends StatefulWidget {
  const NetworkCall({super.key});

  @override
  State<NetworkCall> createState() => _NetworkCall();
}

class _NetworkCall extends State<NetworkCall> {
  // Future<http.Response> fetchAlbum() {
  //   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  // }
  late Future<Album> futureAlbum;

  Future<Album> fetchAlbum() async {
    final response = await http //dio
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Center(
            child: Text("widget.title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
      ),
      body: Container(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
