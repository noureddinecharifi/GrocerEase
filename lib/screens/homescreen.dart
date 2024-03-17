import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grocer_ease/widgets/category_container.dart';

import '../models/fruits_data.dart';
import '../widgets/fruits_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['Fruits', 'Fastfood', 'Vegetables', 'Juices'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          style: GnavStyle.oldSchool,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          gap: 6,
          activeColor: Colors.white,
          color: Colors.white60,
          tabs: [
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
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily\nGrocery Food",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 30),
                  ),
                  Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: Colors.grey.shade200, width: 2)),
                    child: const Center(
                      child: Icon(Icons.circle_outlined),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          text: categories[index],
                          isSelected: index == selectedIndex,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Fruits",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 20),
                  ),
                  const Text("See all"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: fruits.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FruitCard(fruit: fruits[index]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
