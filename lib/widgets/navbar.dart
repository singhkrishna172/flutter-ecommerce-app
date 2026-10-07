import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mark2/pages/favorite.dart';
import 'package:mark2/pages/home.dart';
import 'package:mark2/pages/order.dart';
import 'package:mark2/pages/profile.dart';

class BottomGNavBar extends StatefulWidget {
  const BottomGNavBar({super.key});

  @override
  State<BottomGNavBar> createState() => _BottomGNavBarState();
}

class _BottomGNavBarState extends State<BottomGNavBar> {
  int _sellectedIndex = 0; //Tells the current index

  void index(int index) {
    //to make interactable button
    setState(() {
      _sellectedIndex = index;
    });
  }

  List<Widget> swidgetOption = [
    HomePage(),
    Favorite(),
    Order(),
    Profile(),
  ]; //navigate to different pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: swidgetOption[_sellectedIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: GNav(
            tabActiveBorder: Border.all(color: Colors.black),
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 5),
            gap: 8,
            selectedIndex: _sellectedIndex,
            onTabChange: index,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Order',
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Pofile',
                textStyle: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
