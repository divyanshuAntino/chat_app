import 'package:chatapp/feature/chat_detail/domain/chat_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailCubit extends Cubit<ChatDetailsState> {
  ChatDetailCubit() : super(ChatDetailsState.init());

  void clearTypingField() {
    emit(
      state.copyWith(
        typeFiled: state.typeFiled.copyWith(
          value: TextEditingController(
            text: '',
          ),
        ),
      ),
    );
  }
}
