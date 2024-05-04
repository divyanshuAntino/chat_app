import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => const Color.fromRGBO(104, 148, 84, 1),
        ),
        elevation: WidgetStateProperty.all(8.0),
        minimumSize: WidgetStateProperty.all(const Size(150, 50)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Adjust the border radius
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
