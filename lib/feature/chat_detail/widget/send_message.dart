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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          createdAt.toSmartString(),
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: constant.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
