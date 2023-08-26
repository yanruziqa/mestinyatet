import 'package:flutter/material.dart';
import 'package:mestinyatet/Screen/home.dart';
import 'package:mestinyatet/Config/theme.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  // databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "journal.db");

  var exists = await databaseExists(path);
  // exists = false;

  if (!exists) {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data =
        await rootBundle.load(url.join("assets", "database/journal.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  }

  var db = await openDatabase(path);

  var list = await db.query('daily');
  var tes = List.from(list);

  runApp(
    MaterialApp(
      home: Home(
        db: db,
        dailyList: tes,
      ),
      themeMode: ThemeMode.system,
    ),
  );
}
