import 'package:chatapp/responsive/app_screen_util.dart';
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
      margin: EdgeInsets.symmetric(
        horizontal: 8.widthMultiplier,
        vertical: 4.heightMultiplier,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.widthMultiplier,
        vertical: 8.heightMultiplier,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: widget.imagepath?.contains('http') ?? false
                      ? Image.network(
                          widget.imagepath ?? '',
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "assets/image/ch.jpg",
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),
                ),
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
