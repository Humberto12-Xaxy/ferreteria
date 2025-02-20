import 'package:flutter/material.dart';

import '../core/core.dart';
import '../features/presentation/screens/screens.dart';

class PointSaleApp extends StatelessWidget {
  const PointSaleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          // actionsPadding: EdgeInsets.only(right: 30),
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
          iconTheme: IconThemeData(color: Colors.white, size: 40),
        ),
      ),
      home: Home(),
    );
  }
}
