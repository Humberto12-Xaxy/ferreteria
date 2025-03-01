import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/date_picker_provider.dart';

Future<void> _showDatePicker(
    BuildContext context, WidgetRef ref, DateTime date) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    currentDate: date,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (pickedDate != null) {
    ref.read(datePickerProvider.notifier).changeDate(pickedDate);
  }
}

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(datePickerProvider);
    return Container(
      margin: const EdgeInsets.only(left: 60),
      // height: 30,
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: date.toString().split(' ')[0],
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        readOnly: true,
        onTap: () => _showDatePicker(context, ref, date),
      ),
    );
  }
}
