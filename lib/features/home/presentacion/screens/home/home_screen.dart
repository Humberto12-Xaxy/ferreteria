import 'package:flutter/material.dart';
import 'package:prueba/core/components/custom_data_table.dart';

import '../../../../../core/components/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<DataColumn> columns = [
    DataColumn(label: Text('Nombre')),
    DataColumn(label: Text('Precio')),
    DataColumn(label: Text('Cantidad')),
    DataColumn(label: Text('Acciones')),
  ];

  final List<DataRow> rows = List.generate(
    50,
    (int index) => DataRow(
      cells: [
        DataCell(Text('Producto $index')),
        DataCell(Text('\$${index * 100}')),
        DataCell(Text('$index')),
        DataCell(IconButton(icon: Icon(Icons.add), onPressed: () {})),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tres Hermanas'),
      //   leading: Icon(Icons.construction),
      //   actions: [
      //     CustomButton(
      //       text: 'Inventario',
      //       icon: Icons.description,
      //       onPressed: () {},
      //       padding: 8.0,
      //     ),
      //     CustomButton(
      //       text: 'Reportes',
      //       icon: Icons.description,
      //       onPressed: () {},
      //       padding: 8.0,
      //     ),
      //     CustomButton(
      //       text: 'Corte de caja',
      //       icon: Icons.assured_workload,
      //       onPressed: () {},
      //       padding: 150.0,
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.green,
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                      )),
                ],
              )),
        ],
      ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     Expanded(
      //       flex: 2,
      //       child: Container(
      //         margin: EdgeInsets.only(right: 10, top: 10),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.shade500,
      //               spreadRadius: 3,
      //               blurRadius: 2,
      //               offset: Offset(0, 3),
      //             ),
      //           ],
      //           borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
      //         ),
      //         child: Column(
      //           children: [
      //             Container(
      //               margin: EdgeInsets.all(30),
      //               child: TextField(
      //                 focusNode: FocusNode(),
      //                 decoration: InputDecoration(
      //                   label: Text('Buscar'),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   hintText: 'Por nombre o código',
      //                   hintStyle: TextStyle(color: Colors.grey),
      //                   prefixIcon: Icon(Icons.search),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //                 flex: 1,
      //                 child: CustomDataTable(
      //                     typeSelection: TypeSelection.single,
      //                     onRowSelected: (rowSelected) {
      //                       // print('Row selected: $rowSelected');
      //                     },
      //                     // headerBackgroundColor: Colors.white,
      //                     // textAlign: TextAlign.center,
      //                     // headerTextAlign: TextAlign.start,
      //                     headers: [
      //                       HeaderElement(
      //                           text: 'Header 1',
      //                           textStyle: TextStyle(color: Colors.white)),
      //                       HeaderElement(text: 'Header 2'),
      //                       HeaderElement(text: 'Header 3')
      //                     ],
      //                     rows: [
      //                       RowElement(cells: [
      //                         DataCellElement(text: '111'),
      //                         DataCellElement(text: '222'),
      //                         DataCellElement(text: '333')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                       RowElement(cells: [
      //                         DataCellElement(text: 'Cell 1'),
      //                         DataCellElement(text: 'Cell 2'),
      //                         DataCellElement(text: 'Cell 3')
      //                       ]),
      //                     ])),
      //             // Container(
      //             //   padding: EdgeInsets.symmetric(horizontal: 20),
      //             //   width: double.infinity,
      //             //   child:
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         margin: EdgeInsets.only(left: 10, top: 10),
      //         decoration: BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.shade500,
      //               spreadRadius: 3,
      //               blurRadius: 2,
      //               offset: Offset(0, 3),
      //             ),
      //           ],
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      //         ),
      //         child: Column(
      //           children: [
      //             Container(
      //               alignment: Alignment.center,
      //               width: double.infinity,
      //               height: 50,
      //               margin: EdgeInsets.all(30),
      //               decoration: BoxDecoration(
      //                 color: Theme.of(context).colorScheme.primary,
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               child: Text(
      //                 'Carrito de compras',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: ListView.builder(
      //                 itemCount: 10,
      //                 itemBuilder: (context, index) {
      //                   return ListTile(
      //                     title: Text('Producto $index'),
      //                     subtitle: Text('Precio: \$${index * 100}'),
      //                     trailing: Row(
      //                       mainAxisSize: MainAxisSize.min,
      //                       children: [
      //                         IconButton(
      //                           icon: Icon(Icons.add),
      //                           onPressed: () {},
      //                         ),
      //                         Text('1'),
      //                         IconButton(
      //                           icon: Icon(Icons.remove),
      //                           onPressed: () {},
      //                         ),
      //                         IconButton(
      //                           icon: Icon(Icons.delete),
      //                           onPressed: () {},
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.all(20),
      //               width: double.infinity,
      //               height: 50,
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor:
      //                       Theme.of(context).colorScheme.secondary,
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Icon(
      //                       Icons.shopping_cart_checkout_outlined,
      //                       size: 25,
      //                       color: Colors.white,
      //                     ),
      //                     Text(
      //                       'Procesar pago',
      //                       style: TextStyle(color: Colors.white, fontSize: 20),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
