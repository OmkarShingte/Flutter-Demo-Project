import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentApp extends StatefulWidget {
  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Detail"),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 150,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Name',
                          label: Text("Name"),
                          alignLabelWithHint: true),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
