import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocer_ease/models/fruits_data.dart';
import 'package:grocer_ease/provider/fruit_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return cart.items.isEmpty
        ? const Center(child: Text('Your cart is empty.'))
        : Slidable(
            startActionPane: ActionPane(
                motion: ScrollMotion(
                  key: ValueKey(fruits),
                ),
                children: const []),
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final fruit = cart.items[index];
                return ListTile(
                  title: Text(fruit.name),
                  subtitle: Text(
                      'Price: \$${fruit.pricePerKilogram* fruit.count}'), // Use pricePerKilogram
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => cart.removeItem(fruit),
                  ),
                );
              },
            ),
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
