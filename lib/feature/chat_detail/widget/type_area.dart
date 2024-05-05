import 'package:flutter/material.dart';

class TypeArea extends StatefulWidget {
  const TypeArea({super.key});

  @override
  State<TypeArea> createState() => _TypeAreaState();
}

class _TypeAreaState extends State<TypeArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black)),
      child: const Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Message",
                  suffix: Icon(Icons.send)),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.send))
        ],
      ),
    );
  }
}
