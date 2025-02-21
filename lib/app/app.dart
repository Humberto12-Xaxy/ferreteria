import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/config/router/app_router.dart';

import '../core/core.dart';

class PointSaleApp extends ConsumerWidget {
  const PointSaleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
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
      routerConfig: appRouter,
    );
    
  }
}
