import 'package:flutter/material.dart';
import 'package:grocer_ease/models/fruits_data.dart';
import 'package:grocer_ease/provider/fruit_provider.dart';
import 'package:grocer_ease/utils/constants.dart';
import 'package:provider/provider.dart';

class FruitsDetails extends StatefulWidget {
  const FruitsDetails({super.key, required this.fruit});

  final Fruit fruit;

  @override
  State<FruitsDetails> createState() => _FruitsDetailsState();
}

class _FruitsDetailsState extends State<FruitsDetails> {
  int _counter = 0;

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
  void initState() {
    super.initState();
    setState(() {
      _counter = widget.fruit.count;
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
            height: MediaQuery.sizeOf(context).height * 0.85,
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
                      height: 300,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fresh ${widget.fruit.name}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'Available in Stock',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
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
                          Text('$_counter kg'),
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
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product description',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            widget.fruit.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Product reviews',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(me),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Noureddine charifi"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 56,
                          ),
                          const Text("18 mars, 2024")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.fruit.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Product reviews',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    width: 120,
                    child: Text(
                      '${totalPrice.toStringAsFixed(2)}MAD/KG',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )),
                const SizedBox(
                  width: 120,
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
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
