import 'package:flutter/material.dart';
import 'package:grocer_ease/screens/fruits_details.dart';

import '../models/fruits_data.dart';

class FruitCard extends StatelessWidget {
  final Fruit fruit;

  const FruitCard({
    super.key,
    required this.fruit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FruitsDetails(
              fruit: fruit,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.shade50,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    fruit.image,
                    width: 85,
                    height: 85,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fruit.name,
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4.0),
                          Text(
                            '${fruit.calories} Kcal',
                          ),
                          Text(
                            '${fruit.pricePerKilogram.toStringAsFixed(2)}MAD/Kg',
                          ),
                        ],
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).colorScheme.primary),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
