import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                    child: Text(
                  '\$${widget.order.amount.toStringAsFixed(2)}',
                  style: TextStyle(fontFamily: 'Lato', fontSize: 15),
                )),
              ),
            ),
            title: Text(
              'Number Of Items : ${widget.order.products.length}',
              style: TextStyle(fontFamily: 'Lato', fontSize: 17),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy   hh:mm').format(widget.order.date),
              style: TextStyle(fontFamily: 'Lato', fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              color: Colors.blue[200],
              height: min((widget.order.products.length * 20.0 + 10), 100),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            Text(
                              '${prod.quantity}x \$${prod.price}',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
