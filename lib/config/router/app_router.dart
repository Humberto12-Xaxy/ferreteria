import 'package:prueba/features/point_sale/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../features/inventory/presentation/screens/inventory/inventory_screen.dart';
import '../../features/report/presentation/screens/reports/report_screem.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => const Inventory(),
    ),
    GoRoute(path: '/reports', builder: (context, state) => ReportScreem()),
  ]);
}
