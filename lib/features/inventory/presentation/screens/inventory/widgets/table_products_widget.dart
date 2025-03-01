import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/features/inventory/presentation/providers/providers.dart';
import '../../../../../../core/components/widgets.dart';
import '../../../../../../core/providers/providers.dart';
import 'add_product_dialog_widget.dart';

// final searchProvider = StateProvider<String>((ref) => '');

class TableProductsWidget extends ConsumerWidget {
  TableProductsWidget({super.key});

  final List<HeaderElement> columns = [
    HeaderElement(text: 'ID'),
    HeaderElement(text: 'Código'),
    HeaderElement(text: 'Nombre'),
    HeaderElement(text: 'Precio'),
    HeaderElement(text: 'Costo'),
    HeaderElement(text: 'Existencias'),
  ];

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final currentFilter = ref.watch(productsCurrentFilterProvider);
    final searchQuery = ref.watch(searchProvider);

    searchController.addListener(() {
      ref.read(searchProvider.notifier).changeText(searchController.text);
    });

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
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar producto',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SegmentedButton(
                  segments: [
                    ButtonSegment(
                      value: FilterType.all,
                      icon: Text(
                        'Todos los productos',
                        style: TextStyle(
                          color: currentFilter == FilterType.all
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    ButtonSegment(
                        value: FilterType.filtered,
                        icon: Text(
                          'Inventario bajo',
                          style: TextStyle(
                            color: currentFilter == FilterType.filtered
                                ? Colors.white
                                : Colors.black,
                          ),
                        )),
                  ],
                  selected: <FilterType>{currentFilter},
                  onSelectionChanged: (value) {
                    ref
                        .read(productsCurrentFilterProvider.notifier)
                        .setCurrentFilter(value.first);
                  },
                ),
                CustomButton(
                  text: 'Añadir productos',
                  onPressed: () {
                    showAddProductDialog(context);
                  },
                  icon: Icons.add,
                  marginLeft: 20,
                  marginRight: 30,
                  width: 200,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: products.when(
                data: (data) {
                  final filteredData = data.where((product) {
                    final matchesSearch = searchQuery.isEmpty ||
                        product.name!
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase());
                    final matchesFilter = currentFilter == FilterType.all ||
                        (currentFilter == FilterType.filtered &&
                            product.stock! < 10);
                    return matchesSearch && matchesFilter;
                  }).toList();

                  return CustomDataTable(
                    headers: columns,
                    rows: filteredData.map((product) {
                      return RowElement(cells: [
                        DataCellElement(text: product.id.toString()),
                        DataCellElement(text: product.barCode.toString()),
                        DataCellElement(text: product.name.toString()),
                        DataCellElement(text: product.price.toString()),
                        DataCellElement(text: product.purchase.toString()),
                        DataCellElement(text: product.stock.toString()),
                      ]);
                    }).toList(),
                    typeSelection: TypeSelection.single,
                  );
                },
                loading: () => CircularProgressIndicator(),
                error: (error, stackTrace) {
                  return Center(
                    child: Text('$error $stackTrace'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
