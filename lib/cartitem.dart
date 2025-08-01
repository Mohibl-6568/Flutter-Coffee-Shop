import 'itemtemplate.dart';

class Cartitem {
  final MenuItem item;
  final String size; // Size of the item, e.g., 'S', 'M
  int quantity;
  double price;

  Cartitem({
    required this.item,
    required this.size,
    required this.quantity,
    required this.price,
  });
}

final List<Cartitem> cart = [];
