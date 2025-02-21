import 'package:flutter/material.dart';

import '../../../../../../core/components/custom_data_table_widget.dart';

class SearchProducsWidget extends StatelessWidget {
  SearchProducsWidget({super.key});

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
      margin: EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Buscar'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Por nombre o código',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: CustomDataTable(
                  typeSelection: TypeSelection.single,
                  onRowSelected: (rowSelected) {
                    print('Row selected: ${rowSelected.cells.map(
                      (e) {
                        return e.text;
                      },
                    ).toList()}');
                  },
                  headers: [
                    HeaderElement(
                      text: 'Header 1',
                    ),
                    HeaderElement(text: 'Header 2'),
                    HeaderElement(text: 'Header 3')
                  ],
                  rows: rows)),
        ],
      ),
    );
  }
}
