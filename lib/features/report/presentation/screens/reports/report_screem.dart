import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba/features/report/presentation/screens/reports/widgets/card_widget.dart';
import 'package:prueba/features/report/presentation/screens/reports/widgets/date_picker_widget.dart';
import 'package:prueba/features/report/presentation/screens/reports/widgets/title_datatable_report_widget.dart';

import '../../../../../core/core.dart';

class ReportScreem extends ConsumerWidget {
  ReportScreem({super.key});

  final List<HeaderElement> headers = [
    HeaderElement(text: 'Id'),
    HeaderElement(text: 'Producto'),
    HeaderElement(text: 'Cantidad'),
    HeaderElement(text: 'Subtotal'),
  ];

  final List<RowElement> rows = List.generate(
    10,
    (index) => RowElement(cells: [
      DataCellElement(text: index.toString()),
      DataCellElement(text: 'Producto $index'),
      DataCellElement(text: index.toString()),
      DataCellElement(text: (index * index).toString()),
    ]),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: NavBarWidget(
              buttons: [
                CustomButton(
                  icon: Icons.store,
                  text: 'Punto de venta',
                  onPressed: () {
                    context.push('/');
                  },
                  marginLeft: 10.0,
                ),
                CustomButton(
                  icon: Icons.inventory_outlined,
                  text: 'Inventario',
                  onPressed: () {
                    context.push('/inventory');
                  },
                  marginLeft: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Text(
                                'Reporte de ventas',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DatePickerWidget(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CardWidget(
                                    title: 'Total totales', value: '\$250,000'),
                              ),
                              Expanded(
                                flex: 1,
                                child: CardWidget(
                                    title: 'Total totales', value: '\$250,000'),
                              ),
                              Expanded(
                                flex: 1,
                                child: CardWidget(
                                    title: 'Total totales', value: '\$250,000'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 15, left: 15, right: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TitleDatatableReportWidget(),
                        ),
                        Expanded(
                          flex: 6,
                          child: CustomDataTable(
                              headers: headers,
                              rows: rows,
                              typeSelection: TypeSelection.single),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
