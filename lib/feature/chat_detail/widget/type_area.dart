import 'package:chatapp/feature/chat_detail/domain/chat_detail_cubit.dart';
import 'package:chatapp/feature/chat_detail/domain/chat_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeArea extends StatefulWidget {
  final Function(String) onSend;
  const TypeArea({super.key, required this.onSend});

  @override
  State<TypeArea> createState() => _TypeAreaState();
}

class _TypeAreaState extends State<TypeArea> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatDetailCubit, ChatDetailsState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  controller: state.typeFiled.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Message",
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    widget.onSend(
                      state.typeFiled.value.text,
                    );
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.send)))
            ],
          ),
        );
      },
    );
  }
}
