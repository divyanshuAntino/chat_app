import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TypeArea extends StatefulWidget {
  final Function(TextEditingController)? onSend;
  const TypeArea({super.key, this.onSend});

  @override
  State<TypeArea> createState() => _TypeAreaState();
}

class _TypeAreaState extends State<TypeArea> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              controller: controller,
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
                widget.onSend!(controller);
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 10), child: Icon(Icons.send)))
        ],
      ),
    );
  }
}
