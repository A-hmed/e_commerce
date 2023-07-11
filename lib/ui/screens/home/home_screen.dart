import 'package:e_commerce/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:e_commerce/ui/screens/home/tabs/home/home_tab.dart';
import 'package:e_commerce/ui/screens/home/tabs/profile_tab.dart';
import 'package:e_commerce/ui/screens/home/tabs/wish_list/wish_list_tab.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../cart_screen/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  static  String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    WishListTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/app_bar_logo.png",
          color: AppColors.primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Image.asset(
              "assets/images/ic_cart.png",
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "",
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
              backgroundColor: AppColors.primaryColor),
        ],
      ),
    );
  }
}
