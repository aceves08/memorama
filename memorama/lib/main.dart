import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memorama/app/app.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS || Platform.isAndroid || Platform.isIOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } else {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfiWeb;
  }
  runApp(const App());
}
