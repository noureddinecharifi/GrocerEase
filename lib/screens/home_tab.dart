import 'package:flutter/material.dart';

import '../models/fruits_data.dart';
import '../widgets/category_container.dart';
import '../widgets/fruits_container.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  List<String> categories = ['Fruits', 'Fastfood', 'Vegetables', 'Juices'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.2, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FruitCard(fruit: fruits[index]),
                );
              }),
        )
      ],
    );
  }
}
