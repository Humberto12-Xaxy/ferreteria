import 'package:flutter/material.dart';

import '../../../../../core/components/widgets.dart';
import 'widgets/shopping_car_widget.dart';
import 'widgets/search_producs_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: NavBarWidget(
              buttons: [
                CustomButton(
                  icon: Icons.inventory_outlined,
                  text: 'Inventario',
                  onPressed: () {},
                  marginLeft: 10.0,
                ),
                CustomButton(
                  icon: Icons.insert_chart,
                  text: 'Reportes',
                  onPressed: () {},
                  marginLeft: 10.0,
                ),
                CustomButton(
                  icon: Icons.assured_workload,
                  text: 'Corte de caja',
                  onPressed: () {},
                  marginLeft: 10.0,
                  width: 350,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SearchProducsWidget(),
                  ),
                  Expanded(
                    flex: 2,
                    child: ShoppingCarWidget(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
