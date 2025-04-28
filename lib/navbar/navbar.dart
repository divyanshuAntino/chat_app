import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/add/screen/add.dart';
import 'package:chatapp/feature/call/screen/call.dart';
import 'package:chatapp/feature/home/screen/home.dart';
import 'package:chatapp/feature/setting/screen/setting.dart';
import 'package:chatapp/feature/status/screen/status.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(Icons.home_outlined, color: constant.primary),
          SvgPicture.asset(
            "assets/svg/status.svg",
            color: constant.primary,
          ),
          Icon(Icons.add, color: constant.primary),
          Icon(Icons.call, color: constant.primary),
          Icon(Icons.settings, color: constant.primary),
        ],
        inactiveIcons: [
          const Icon(Icons.home_outlined, color: Colors.black),
          SvgPicture.asset(
            "assets/svg/status.svg",
            color: Colors.black,
          ),
          const Icon(Icons.add, color: Colors.black),
          const Icon(Icons.call_outlined, color: Colors.black),
          const Icon(Icons.settings_outlined, color: Colors.black),
        ],
        color: Colors.white,
        height: 80,
        circleWidth: 50,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: constant.primary,
        elevation: 5,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: const [
          HomePage(),
          StatusScreen(),
          AddScreen(),
          CallScreen(),
          SettinScreen(),
        ],
      ),
    );
  }
}
