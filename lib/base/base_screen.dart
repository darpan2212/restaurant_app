import 'package:flutter/material.dart';
import 'package:restaurant_verve/config/theme.dart';

class BaseScreen extends StatefulWidget {
  final AppBar appBar;
  final Widget child;
  final bool isBottomNavigation;

  BaseScreen({this.appBar, this.child, this.isBottomNavigation = true});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.appBar ?? null,
        body: widget.child ?? Container(),
        bottomNavigationBar:
            widget.isBottomNavigation ? _getBottomNavigation() : null,
      ),
    );
  }

  int currentBottomIndex = 5;
  Widget _getBottomNavigation() {
    switch (currentBottomIndex.toString()) {
      case 'Home':
        setState(() {
          currentBottomIndex = 0;
        });
        break;
      case 'Khata':
        setState(() {
          currentBottomIndex = 1;
        });
        break;
      case 'Search':
        setState(() {
          currentBottomIndex = 2;
        });
        break;
      case 'My Orders':
        setState(() {
          currentBottomIndex = 3;
        });
        break;
      case 'Carts':
        setState(() {
          currentBottomIndex = 4;
        });
        break;
    }
    return BottomNavigationBar(
      /*showSelectedLabels: true,
      showUnselectedLabels: true,*/
      onTap: (index) {
        switch (index) {
          case 0:
            if (currentBottomIndex != 0) {}
            break;

          case 2:
            if (currentBottomIndex != 2) {}
            break;

          case 3:
            break;
        }
      },
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.darkGray,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              'Home',
              style: TextStyle(
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_balance_wallet,
            color: AppColors.darkGray,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              'Khata',
              style: TextStyle(
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: AppColors.darkGray,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              'Search',
              style: TextStyle(
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book,
            color: AppColors.darkGray,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              'My Orders',
              style: TextStyle(
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: AppColors.darkGray,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              'Cart',
              style: TextStyle(
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
