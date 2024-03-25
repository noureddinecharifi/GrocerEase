import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.imagePath,
    required this.headline,
    required this.title,
    required this.subtitle,
    required this.increment,
    required this.decrement,
    required this.counter,
  });

  final String counter;
  final VoidCallback decrement;
  final String headline;
  final String imagePath;
  final VoidCallback increment;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 80,
                    height: 50,
                    child: Center(
                      child: Image.asset(
                        width: 50,
                        height: 50,
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(headline),
                    Text(title),
                    Text(subtitle),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: increment,
                    icon: const Icon(
                      Icons.add,
                      size: 15,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    width: 30,
                    child: Center(
                        child: Text(
                      counter,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background),
                    )),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: decrement,
                      icon: const Icon(
                        Icons.remove,
                        size: 15,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
