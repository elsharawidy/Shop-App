import 'package:flutter/cupertino.dart';
import '../providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  OrderItem(
      {@required this.amount,
      @required this.date,
      @required this.id,
      @required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> orderItems, double totalPrice) {
    _orders.insert(
      0,
      OrderItem(
        date: DateTime.now(),
        id: DateTime.now().toString(),
        products: orderItems,
        amount: totalPrice,
      ),
    );
    notifyListeners();
  }
}
