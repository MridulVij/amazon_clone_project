import 'package:amazon_clone/views/account/account.dart';
import 'package:amazon_clone/views/home/screens/home_screens.dart';
import 'package:flutter/material.dart';

import '../views/cart/cart.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavbarWidth = 42.0;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    DashBoardUI(),
    AccountUI(),
    CartUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.amber,
        backgroundColor: Colors.white,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavbarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0 ? Colors.amber : Colors.blue,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.home_filled),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavbarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0 ? Colors.amber : Colors.blue,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.home_filled),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavbarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0 ? Colors.amber : Colors.blue,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.home_filled),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavbarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0 ? Colors.amber : Colors.blue,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.home_filled),
              ),
              label: '')
        ],
      ),
    );
  }
}
