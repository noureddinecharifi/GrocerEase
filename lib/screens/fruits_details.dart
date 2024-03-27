import 'package:flutter/material.dart';
import 'package:grocer_ease/models/fruits_data.dart';
import 'package:grocer_ease/provider/fruit_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/row_containers.dart';

class FruitsDetails extends StatefulWidget {
  const FruitsDetails({super.key, required this.fruit});

  final Fruit fruit;

  @override
  State<FruitsDetails> createState() => _FruitsDetailsState();
}

class _FruitsDetailsState extends State<FruitsDetails> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _counter = widget.fruit.count;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _counter * widget.fruit.pricePerKilogram;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.90,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 400,
                      height: 370,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey.shade50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Center(
                              child: Image.asset(
                            widget.fruit.image,
                            width: 200,
                            height: 200,
                          )),
                        ],
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fresh ${widget.fruit.name}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.local_fire_department_rounded,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        '${widget.fruit.calories} Kcal',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '${widget.fruit.rating}',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10,),
                                        Row(
                                        children: [
                                          const Icon(
                                            Icons.monetization_on,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '${widget.fruit.pricePerKilogram} Dh/kg',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: Text(
                                widget.fruit.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const RowContainers(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        onPressed: _incrementCounter,
                        icon: const Icon(Icons.add)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$_counter kg',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        onPressed: _decrementCounter,
                        icon: const Icon(Icons.remove))
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    final cart =
                        Provider.of<CartProvider>(context, listen: false);
            
                    widget.fruit.setCount(_counter);
                    cart.addItem(widget.fruit);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.fruit.name} added to cart!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Order for ${totalPrice.toStringAsFixed(2)}Dh',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
