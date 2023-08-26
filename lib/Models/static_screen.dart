import 'package:sqflite/sqflite.dart';

class StaticScreen {
  StaticScreen({
    required this.heading,
    required this.desc,
    required this.label,
    required this.data,
    required this.columnName,
  });

  final String heading;
  final String desc;
  final String label;
  final String columnName;
  String data;

  void setData(String data) {
    this.data = data;
  }
}

class StaticScreenCollection {
  List<StaticScreen> collection;

  StaticScreenCollection({required this.collection});

  StaticScreen getByIndex(index) {
    return collection[index];
  }

  int length() {
    return collection.length;
  }

  Map<String, String> toMap() {
    var res = <String, String>{};
    for (var element in collection) {
      res[element.columnName] = element.data;
    }
    return res;
  }

  Future<void> save(Database db) async {
    var res = toMap();
    await db.insert("daily", res);
  }
}
