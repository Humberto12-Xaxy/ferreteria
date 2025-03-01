import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_down_button_provider.g.dart';

final List<String> TYPE_UNITY = ['Pieza', 'Kg'];

@riverpod
class SelectText extends _$SelectText {
  @override
  String build() {
    return TYPE_UNITY.first;
  }

  void changeText(String text) {
    state = text;
  }
}
