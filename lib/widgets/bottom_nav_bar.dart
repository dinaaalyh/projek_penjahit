import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:feather_icons/feather_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onTap,
      backgroundColor: Colors.transparent,
      color: Color.fromARGB(255, 1, 128, 139),
      height: 60,
      items: [
        Icon(
          Icons.home,
          size: 25,
          color: Colors.black,
        ),
        Icon(
          Icons.explore,
          size: 25,
          color: Colors.black,
        ),
        Icon(
          Icons.list,
          size: 25,
          color: Colors.black,
        ),
        Icon(
          Icons.person,
          size: 25,
          color: Colors.black,
        ),
      ],
      index: currentIndex,
    );
  }
}
