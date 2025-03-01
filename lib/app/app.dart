import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/config.dart';

class PointSaleApp extends ConsumerWidget {
  const PointSaleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
          iconTheme: IconThemeData(color: Colors.white, size: 40),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
