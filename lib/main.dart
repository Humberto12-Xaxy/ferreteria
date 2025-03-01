import 'package:flutter/material.dart';
import 'package:prueba/app/app.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  await WindowManager.instance.ensureInitialized();
  // await WindowManager.instance.setFullScreen(true);

  runApp(ProviderScope(child: PointSaleApp()));
}
