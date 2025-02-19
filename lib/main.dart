import 'package:flutter/material.dart';

import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:punto_de_venta/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await WindowManager.instance.ensureInitialized();
  // await WindowManager.instance.setFullScreen(true);

  runApp(ProviderScope(child: PointSaleApp()));
}