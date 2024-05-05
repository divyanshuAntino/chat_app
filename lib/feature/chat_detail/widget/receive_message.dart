import 'package:flutter/material.dart';

class ReceiveMessage extends StatelessWidget {
  const ReceiveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 200, minHeight: 50),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: const Center(
            child: Text(
              "The moonlight weaves its silver thread,Upon the dreams of those who've fled.Through darkest night and brightest day,Hope's gentle glow will light the way.",
              style: TextStyle(fontSize: 16),
              maxLines: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text("12:23pm"),
      ],
    );
  }
}
