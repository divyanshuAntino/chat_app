import 'package:equatable/equatable.dart';

class FieldState<T> extends Equatable {
  final T value;
  final bool isActive;
  final String error;

  const FieldState({
    required this.value,
    this.isActive = false,
    required this.error,
  });

  const FieldState.initial({required T value, bool? isActive})
      : this(
          value: value,
          isActive: isActive ?? true,
          error: '',
        );

  FieldState<T> copyWith({
    T? value,
    bool? isActive,
    String? error,
  }) {
    return FieldState(
      value: value ?? this.value,
      isActive: isActive ?? this.isActive,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        value,
        error,
      ];
}
