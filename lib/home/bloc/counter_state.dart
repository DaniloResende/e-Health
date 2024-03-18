// ignore_for_file: public_member_api_docs, sort_constructors_first
class CounterState {
  final int value;
  CounterState({
    required this.value,
  });

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
