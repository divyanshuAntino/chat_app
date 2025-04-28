import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chatapp/shared/extension/common_extension.dart';

class PersonCart extends StatefulWidget {
  final bool? isOnline;
  final String? userName;
  final String? lastMessage;
  final int? messageCount;
  final String? path;
  final String? lastMessageTime;
  const PersonCart({
    super.key,
    this.isOnline,
    this.userName,
    this.lastMessage,
    this.path,
    this.messageCount,
    this.lastMessageTime,
  });

  @override
  State<PersonCart> createState() => _PersonCartState();
}

class _PersonCartState extends State<PersonCart> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width * 0.95,
      height: mediaQueryData.size.height * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
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
                backgroundImage: NetworkImage(widget.path ?? ""),
                radius: 26,
              ),
              widget.isOnline ?? false
                  ? Positioned(
                      top: mediaQueryData.size.height * 0.046,
                      left: mediaQueryData.size.width * 0.105,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ))
                  : const SizedBox()
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: mediaQueryData.size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  widget.lastMessage ?? "",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  maxLines: 1,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(widget.lastMessageTime?.toSmartString() ?? ""),
              widget.messageCount != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: constant.primary, shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        widget.messageCount.toString(),
                        style: const TextStyle(color: Colors.white),
                      )),
                    )
                  : const SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
