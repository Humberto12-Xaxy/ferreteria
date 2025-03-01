import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/core/components/widgets.dart';
import 'package:prueba/features/point_sale/presentation/providers/shopping_car_provider.dart';

class ShoppingCarWidget extends ConsumerStatefulWidget {
  const ShoppingCarWidget({super.key});

  @override
  ShoppingCarWidgetState createState() => ShoppingCarWidgetState();
}

class ShoppingCarWidgetState extends ConsumerState<ShoppingCarWidget> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final products = ref.read(shoppingCarProvider);
    _controllers = List.generate(products.length, (index) {
      return TextEditingController(text: products[index].quantity.toString());
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(shoppingCarProvider);

    if (_controllers.length != products.length) {
      _initializeControllers();
    }

    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(30),
            child: Text(
              'Carrito de compras',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].product.name!),
                  subtitle: Text(
                    products[index].product.price.toString(),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          ref.read(shoppingCarProvider.notifier).changeQuantity(
                              products[index].product,
                              products[index].quantity + 1);
                          _controllers[index].text =
                              (products[index].quantity + 1).toString();
                        },
                      ),
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: TextField(
                          controller: _controllers[index],
                          onTap: () {
                            _controllers[index].selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: _controllers[index].text.length);
                          },
                          onChanged: (value) {
                            final quantity = _controllers[index].text;
                            if (quantity.isEmpty) return;
                            ref
                                .read(shoppingCarProvider.notifier)
                                .changeQuantity(products[index].product,
                                    int.parse(quantity));
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          ref.read(shoppingCarProvider.notifier).changeQuantity(
                              products[index].product,
                              products[index].quantity - 1);
                          setState(() {
                            _controllers[index].text =
                                (products[index].quantity - 1).toString();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          ref
                              .read(shoppingCarProvider.notifier)
                              .deleteProduct(products[index].product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 10,
                  ),
                  child: Text(
                    'Total: ${ref.read(shoppingCarProvider.notifier).total}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 50,
                child: CustomButton(
                    text: 'Cobrar',
                    onPressed: () {},
                    icon: Icons.shopping_cart_checkout_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
