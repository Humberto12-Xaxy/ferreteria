import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/features/inventory/presentation/providers/select_down_button_provider.dart';

class CustomDropDownButtonWidget extends ConsumerWidget {
  const CustomDropDownButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String valueDropDown = ref.watch(selectTextProvider);

    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Unidad de venta',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              value: valueDropDown,
              borderRadius: BorderRadius.circular(20),
              items: TYPE_UNITY.map<DropdownMenuItem<String>>(
                (String unityType) {
                  return DropdownMenuItem(
                    value: unityType,
                    child: Text(
                      unityType,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                ref.read(selectTextProvider.notifier).changeText(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
