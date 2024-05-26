import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonAddCart extends StatefulWidget {
  final String? Name;
  final String? tagLine;
  final bool? isOnline;

  final String? Imagepath;
  const PersonAddCart({
    super.key,
    this.Name,
    this.tagLine,
    this.isOnline,
    this.Imagepath,
  });

  @override
  State<PersonAddCart> createState() => _PersonAddCartState();
}

class _PersonAddCartState extends State<PersonAddCart> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width * 0.95,
      height: mediaQueryData.size.height * 0.09,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.Imagepath ??
                    "https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png"),
                radius: 26,
              ),
              widget.isOnline ?? false
                  ? Positioned(
                      top: mediaQueryData.size.height * 0.046,
                      left: mediaQueryData.size.width * 0.12,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ))
                  : const SizedBox()
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: mediaQueryData.size.width * 0.57,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.Name ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  widget.tagLine ?? "",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  maxLines: 1,
                )
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Icon(Icons.message_outlined)],
          )
        ],
      ),
    );
  }
}
