import 'package:prueba/features/home/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../features/inventory/presentation/screens/inventory/inventory.dart';

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
  ]);
}
