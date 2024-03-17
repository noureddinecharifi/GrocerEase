import 'package:flutter/foundation.dart';

import '../models/fruits_data.dart';

class CartProvider with ChangeNotifier {
  final List<Fruit> _items = [];
  List<Fruit> get items => _items; // Return unmodifiable list

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0.0, (sum, fruit) => sum + fruit.pricePerKilogram);

  bool isFruitInItems(Fruit fruit, List<Fruit> listFruit) {
    for (Fruit f in listFruit) {
      if (f.id == fruit.id) {
        return true;
      }
    }
    return false;
  }

  void addItem(Fruit fruit) {
    if (isFruitInItems(fruit, _items)) {
      fruit.setCount(fruit.count);
    } else {
      _items.add(fruit);
    }

    notifyListeners();
  }

  void removeItem(Fruit fruit) {
    fruit.setCount(0);
    _items.remove(fruit);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
