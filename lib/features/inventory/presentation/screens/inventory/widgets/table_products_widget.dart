import 'package:flutter/material.dart';

import '../../../../../../core/components/widgets.dart';

class TableProductsWidget extends StatelessWidget {
  TableProductsWidget({super.key});

  final List<HeaderElement> columns = [
    HeaderElement(text: 'Nombre'),
    HeaderElement(text: 'Precio'),
    HeaderElement(text: 'Cantidad'),
  ];

  final List<RowElement> rows = List.generate(
    50,
    (int index) => RowElement(
      cells: [
        DataCellElement(text: 'Nombre $index'),
        DataCellElement(text: 'precio $index'),
        DataCellElement(text: 'cantidad $index'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                  ),
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar producto',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Inventario bajo',
                  onPressed: () {},
                  icon: Icons.inventory_2,
                  width: 200,
                  height: 30,
                  marginLeft: 20,
                ),
                CustomButton(
                  text: 'Añadir productos',
                  onPressed: () {},
                  icon: Icons.add,
                  marginLeft: 20,
                  marginRight: 30,
                  width: 300,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: CustomDataTable(
                  headers: columns,
                  rows: rows,
                  typeSelection: TypeSelection.single),
            ),
          )
        ],
      ),
    );
  }
}
