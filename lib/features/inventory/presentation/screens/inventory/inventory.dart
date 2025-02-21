import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/config/router/app_router.dart';
import 'package:prueba/core/core.dart';

import 'widgets/table_products_widget.dart';

class Inventory extends ConsumerWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NavBarWidget(
              buttons: [
                CustomButton(
                  text: 'Punto de venta',
                  onPressed: () {
                    ref.read(appRouterProvider).pop();
                  },
                  icon: Icons.store,
                  marginLeft: 10,
                ),
                CustomButton(
                  text: 'Reportes',
                  onPressed: () {},
                  icon: Icons.insert_chart,
                  marginLeft: 10,
                )
              ],
            ),
          ),
          Expanded(flex: 10, child: TableProductsWidget()),
        ],
      ),
    );
  }
}
