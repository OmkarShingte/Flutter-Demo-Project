import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../db_service/db_handler.dart';
import '../model/db_model.dart';

class DbProvider extends ChangeNotifier {
  bool _isImportant = false;

  bool get isImportant => _isImportant;

  set isImportant(bool value) {
    _isImportant = value;
    notifyListeners();
  }

  late int _number;

  int get number => _number;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  late String _title;

  String get title => _title;

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  late String _description;

  String get description => _description;

  set description(String value) {
    _description = value;
    notifyListeners();
  }

  var numberController = TextEditingController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var k = DbModel(
      isImportant: false,
      number: 1,
      title: "1",
      description: "1",
      createdTime: DateTime.now());

  Future<void> addRecord(
      {required bool isImportant,
      required String number,
      required String title,
      required String description}) async {
    DbHandler db = DbHandler();
    db.database;
    await db.createNotes(
        isImportant: isImportant,
        number: int.parse(number),
        title: title,
        description: description,);
  }

  var _res;

  get res => _res;

  set res(value) {
    _res = value;
    notifyListeners();
  }

  Future<void> getRecord() async {
    DbHandler db = DbHandler();
    db.database;
    _res = await db.getNotes();
    print("result > $_res");
    notifyListeners();
    // return _res;
  }
}
