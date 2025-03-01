import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/core/providers/providers.dart';
import 'package:prueba/features/point_sale/presentation/providers/shopping_car_provider.dart';

import '../../../../../../core/components/custom_data_table_widget.dart';
import '../../../../../inventory/presentation/providers/providers.dart';

class SearchProducsWidget extends ConsumerWidget {
  SearchProducsWidget({super.key});

  final List<HeaderElement> columns = [
    HeaderElement(text: 'Nombre'),
    HeaderElement(text: 'Precio'),
    HeaderElement(text: 'Existencias'),
  ];

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final search = ref.watch(searchProvider);

    searchController.addListener(
      () {
        ref.read(searchProvider.notifier).changeText(searchController.text);
      },
    );

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
              focusNode: searchFocusNode,
              controller: searchController,
              onSubmitted: (value) {
                ref.read(shoppingCarProvider.notifier).addProduct(value);
                searchController.clear();
                searchFocusNode.requestFocus();
              },
              autofocus: true,
              decoration: InputDecoration(
                label: Text('Buscar'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Por nombre o código',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: products.when(
                data: (data) {
                  final filterData = data.where((product) {
                    final matchesSearch = search.isEmpty ||
                        product.name!
                            .toLowerCase()
                            .contains(search.toLowerCase());
                    return matchesSearch;
                  }).toList();
                  return CustomDataTable(
                    textAlign: TextAlign.center,
                    headerTextAlign: TextAlign.center,
                    typeSelection: TypeSelection.single,
                    onRowSelected: (rowSelected) {
                      print('Row selected: ${rowSelected.cells.map(
                        (e) {
                          return e.text;
                        },
                      ).toList()}');
                    },
                    headers: columns,
                    rows: filterData.map((product) {
                      return RowElement(cells: [
                        DataCellElement(text: product.name.toString()),
                        DataCellElement(text: product.price.toString()),
                        DataCellElement(text: product.stock.toString()),
                      ]);
                    }).toList(),
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(error.toString()),
                  );
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
        ],
      ),
    );
  }
}
