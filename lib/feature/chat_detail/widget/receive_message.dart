import 'package:chatapp/shared/extension/common_extension.dart';
import 'package:flutter/material.dart';

class ReceiveMessage extends StatelessWidget {
  final String createdAt;
  final String message;
  const ReceiveMessage({
    super.key,
    required this.createdAt,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Text(
              message,
              style: TextStyle(fontSize: 16),
              maxLines: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          createdAt.toSmartString(),
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
