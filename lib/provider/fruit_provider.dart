
import 'package:flutter/foundation.dart';
import '../models/fruits_data.dart';


class CartProvider with ChangeNotifier {
  final List<Fruit> _items = [];

  List<Fruit> get items => _items;

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0.0, (sum, fruit) => sum + fruit.pricePerKilogram * fruit.count);

  void addItem(Fruit fruit) {
    if (_isFruitInItems(fruit)) {
      _updateItemQuantity(fruit, fruit.count + 1);
    } else {
      _items.add(fruit);
    }
    notifyListeners();
  }

  void removeItem(Fruit fruit) {
    _items.remove(fruit);
    notifyListeners();
  }

  void incrementQuantity(Fruit fruit) {
    _updateItemQuantity(fruit, fruit.count + 1);
    notifyListeners();
  }

  void decrementQuantity(Fruit fruit) {
    if (fruit.count > 1) {
      _updateItemQuantity(fruit, fruit.count - 1);
      notifyListeners();
    }
  }

  bool _isFruitInItems(Fruit fruit) {
    return _items.any((item) => item.id == fruit.id);
  }

  void _updateItemQuantity(Fruit fruit, int quantity) {
    final index = _items.indexWhere((item) => item.id == fruit.id);
    if (index != -1) {
      _items[index].setCount(quantity);
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
