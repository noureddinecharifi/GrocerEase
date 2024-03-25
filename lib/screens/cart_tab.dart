import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:grocer_ease/models/fruits_data.dart';
import 'package:grocer_ease/provider/fruit_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/food_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return cart.items.isEmpty
        ? const Center(child: Text('Your cart is empty.'))
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final fruit = cart.items[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 65,
                              height: 100,
                              child: SlidableAction(
                                borderRadius: BorderRadius.circular(12),
                                autoClose: true,
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                onPressed: (BuildContext context) =>
                                    cart.removeItem(fruit),
                              ),
                            ),
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FoodTile(
                            imagePath: fruit.image,
                            headline: fruit.name,
                            title: fruit.calories.toStringAsFixed(2),
                            subtitle:
                                'MAD ${(fruit.pricePerKilogram * fruit.count).toStringAsFixed(2)}/kg',
                            counter: fruit.count.toString(),
                            decrement: () => cart.decrementQuantity(fruit),
                            increment: () => cart.incrementQuantity(fruit),
                          )),
                    );
                  },
                ),
              ),
              Text(
                'Total: MAD ${cart.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          );

    // bottomNavigationBar: cart.items.isEmpty
    //     ? null
    //     : Container(
    //         padding: const EdgeInsets.all(16.0), // Add padding
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               'Total: \$' + cart.totalPrice.toStringAsFixed(2),
    //               style: const TextStyle(
    //                   fontSize: 18.0, fontWeight: FontWeight.bold),
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // Handle checkout or order placement logic here
    //                 // (e.g., navigate to a checkout screen)
    //                 ScaffoldMessenger.of(context).showSnackBar(
    //                   const SnackBar(
    //                     content: Text('Checkout initiated!'),
    //                     duration: Duration(seconds: 2),
    //                   ),
    //                 );
    //               },
    //               child: const Text('Checkout'),
    //             ),
    //           ],
    //         ),
    //       );,
  }
}
