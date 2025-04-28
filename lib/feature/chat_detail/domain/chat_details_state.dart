import 'package:chatapp/shared/field_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChatDetailsState extends Equatable {
  final FieldState<TextEditingController> typeFiled;
  const ChatDetailsState({
    required this.typeFiled,
  });
  factory ChatDetailsState.init() {
    return ChatDetailsState(
      typeFiled: FieldState.initial(
        value: TextEditingController(
          text: '',
        ),
      ),
    );
  }
  ChatDetailsState copyWith({
    FieldState<TextEditingController>? typeFiled,
  }) {
    return ChatDetailsState(
      typeFiled: typeFiled ?? this.typeFiled,
    );
  }

  @override
  List<Object?> get props => [
        typeFiled,
      ];
}
