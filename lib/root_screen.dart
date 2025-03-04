import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';
import 'package:liquor_brooze_user/view/AccountScreen/account_screen.dart';
import 'package:liquor_brooze_user/view/CategoryScreen/category_screen.dart';
import 'package:liquor_brooze_user/view/HomeScreen/home_screen.dart';
import 'package:liquor_brooze_user/viewmodel/root_screen_provider.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rootScreenProvider = Provider.of<RootScreenProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.lightTextColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/app_logo/app_logo.png',
              height: 70,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Text(
              'Liquor Brooze',
              style: TextStyle(
                color: AppColor.darkTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserat',
              ),
            ),
          ],
        ),
      ),
      body: [
        HomeScreen(),
        CategoryScreen(),
        AccountScreen(),
        Container(color: Colors.green),
      ][rootScreenProvider.currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: rootScreenProvider.currentScreenIndex,
        onTap: (index) {
          rootScreenProvider.setScreenIndex(index);
        },
        backgroundColor: AppColor.primaryColor, // Dark background
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
        selectedItemColor: AppColor.lightTextColor, // Active tab color
        unselectedItemColor: AppColor.darkTextColor, // Inactive tab color
        showUnselectedLabels: true, // Show labels for inactive tabs
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            activeIcon: Icon(Icons.grid_view, color: Colors.white),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.white),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
