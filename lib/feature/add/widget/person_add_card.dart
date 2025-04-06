import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonAddCart extends StatefulWidget {
  final String? name;
  final String? tagLine;
  final bool? isOnline;
  final String? userId;

  final String? imagepath;
  const PersonAddCart(
      {super.key,
      this.name,
      this.tagLine,
      this.isOnline,
      this.imagepath,
      this.userId});

  @override
  State<PersonAddCart> createState() => _PersonAddCartState();
}

class _PersonAddCartState extends State<PersonAddCart> {
  // ChatServices chatServices = ChatServices();
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
                backgroundImage: AssetImage(widget.imagepath ??
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
                      ),
                    )
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
                  widget.name ?? "",
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
          GestureDetector(
            onTap: () async {},
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Icon(Icons.message_outlined)],
            ),
          )
        ],
      ),
    );
  }
}
