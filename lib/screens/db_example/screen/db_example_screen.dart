import 'package:first/screens/db_example/db_service/db_handler.dart';
import 'package:first/screens/db_example/model/db_model.dart';
import 'package:first/screens/db_example/provider/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DbExampleScreen extends StatefulWidget {
  const DbExampleScreen({super.key});

  @override
  State<DbExampleScreen> createState() => _DbExampleScreenState();
}

class _DbExampleScreenState extends State<DbExampleScreen> {
  DbProvider db = DbProvider();

  @override
  void initState() {
    // db.getRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DB Example")),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("is Important"),
                    Switch(
                      value: provider.isImportant,
                      onChanged: (value) {
                        provider.isImportant = !provider.isImportant;
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Number"),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: provider.numberController,
                          decoration: InputDecoration(hintText: "Enter number"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Title"),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: provider.titleController,
                          decoration: InputDecoration(hintText: "Enter number"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Description"),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: provider.descriptionController,
                          decoration: InputDecoration(hintText: "Enter number"),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // provider.addRecord(
                      //     isImportant: provider.isImportant,
                      //     number: provider.numberController.text,
                      //     title: provider.titleController.text,
                      //     description: provider.descriptionController.text);

                      provider.getRecord();
                    },
                    child: Text("Create DB")),
                provider.res == null
                    ? Center(child: Text("No data found"))
                    : Flexible(
                        child: Container(
                          child: ListView.builder(
                            itemCount: provider.res.length,
                            itemBuilder: (context, index) {
                              final item = provider.res[index];
                              return Row(
                                children: [
                                  Text("${item[DbFields.id]}"),
                                  Text("  ${item[DbFields.isImportant]}"),
                                  Text("  ${item[DbFields.number]}"),
                                  Text("  ${item[DbFields.title]}"),
                                  Text("  ${item[DbFields.description]}"),
                                  Text("  ${DateFormat('dd/MM/yy').format(DateTime.parse(item[DbFields.time]))}"),
                                ],
                              );
                            },
                          ),
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
