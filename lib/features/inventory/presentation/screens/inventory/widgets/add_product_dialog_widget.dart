import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prueba/features/inventory/presentation/providers/providers.dart';
import 'package:prueba/features/inventory/presentation/screens/inventory/widgets/custom_drop_down_button_widget.dart';
import 'package:prueba/features/inventory/presentation/screens/inventory/widgets/custom_textfield_widget.dart';

import '../../../../../../core/components/widgets.dart';
import '../../../../domain/domain.dart';

Future<void> showAddProductDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AddProductDialogWidget();
      });
}

class AddProductDialogWidget extends ConsumerStatefulWidget {
  const AddProductDialogWidget({super.key});

  @override
  AddProductDialogWidgetState createState() => AddProductDialogWidgetState();
}

class AddProductDialogWidgetState
    extends ConsumerState<AddProductDialogWidget> {
  TextEditingController barCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController purchaseController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String textSelected = ref.watch(selectTextProvider);

    return Dialog(
      child: Container(
        width: 450,
        height: 800,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Agregar producto',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextfieldWidget(
                      text: 'Código de barras',
                      controller: barCodeController,
                      fontSize: 14,
                      width: 200,
                      regex: r'^\d+$',
                      height: 40,
                      borderRadius: 5),
                  CustomTextfieldWidget(
                      text: 'Nombre',
                      controller: nameController,
                      fontSize: 14,
                      width: 200,
                      height: 40,
                      regex: r'^.*$',
                      borderRadius: 5),
                  CustomTextfieldWidget(
                      text: 'Costo',
                      controller: purchaseController,
                      isNumeric: true,
                      fontSize: 14,
                      width: 200,
                      height: 40,
                      regex: r'^\d+\.?\d*$',
                      borderRadius: 5),
                  CustomTextfieldWidget(
                      text: 'Precio',
                      controller: priceController,
                      isNumeric: true,
                      fontSize: 14,
                      width: 200,
                      height: 40,
                      regex: r'^\d+\.?\d*$',
                      borderRadius: 5),
                  CustomTextfieldWidget(
                      text: 'Cantidad',
                      regex: r'^\d+$',
                      controller: quantityController,
                      fontSize: 14,
                      width: 200,
                      height: 40,
                      borderRadius: 5),
                  CustomDropDownButtonWidget(),
                  CustomButton(
                    icon: Icons.save,
                    width: double.infinity,
                    height: 50,
                    text: 'Guardar producto',
                    onPressed: () {
                      final NumberFormat formatter =
                          NumberFormat("###.00#", "en_US");

                      String formatPrice =
                          formatter.format(double.parse(priceController.text));
                      String formatPurchase = formatter
                          .format(double.parse(purchaseController.text));

                      final product = ProductEntity(
                        barCode: barCodeController.text,
                        name: nameController.text,
                        price: double.parse(formatPrice),
                        stock: int.parse(quantityController.text),
                        purchase: double.parse(formatPurchase),
                        typeSale: textSelected,
                      );
                      ref
                          .read(productsProvider.notifier)
                          .createProduct(product);

                      barCodeController.text = '';
                      nameController.text = '';
                      priceController.text = '';
                      quantityController.text = '';
                      purchaseController.text = '';
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
