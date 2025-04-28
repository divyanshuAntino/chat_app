import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/shared/extension/common_extension.dart';

class SendMessage extends StatelessWidget {
  final String createdAt;
  final String message;
  const SendMessage({
    super.key,
    required this.createdAt,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          createdAt.toSmartString(),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              color: constant.primary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Center(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
