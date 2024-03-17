import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grocer_ease/screens/cart_tab.dart';
import 'package:grocer_ease/screens/home_tab.dart';
import 'package:provider/provider.dart';

import '../provider/fruit_provider.dart';

class HomeScreen extends StatefulWidget {
  final int initialTabIndex;

  const HomeScreen({super.key, required this.initialTabIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  // this is a function
  Widget getTabView(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return const HomeTabView();
      case 2:
        return const CartScreen();
      default:
        return const SizedBox();
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedTab = widget.initialTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.sizeOf(context).width * 0.63,
              top: 5,
              child: Badge(
      
                label: Text(cart.items.length.toString()),
              ),
            ),
            GNav(
              onTabChange: (activeIndex) {
                setState(() {
                  selectedTab = activeIndex;
                });
              },
              style: GnavStyle.oldSchool,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              gap: 6,
              activeColor: Colors.white,
              color: Colors.white60,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.storefront,
                  text: 'Order',
                ),
                GButton(
                  icon: Icons.shopping_basket_outlined,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'More',
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
            child: getTabView(selectedTab)),
      ),
    );
  }
}
