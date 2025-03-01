import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_picker_provider.g.dart';

@riverpod
class DatePicker extends _$DatePicker {
  @override
  DateTime build() => DateTime.now();

  void changeDate(DateTime date) {
    state = date;
  }
}
