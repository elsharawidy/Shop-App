import 'package:flutter/material.dart';
import '/screens/edit_product_screen.dart';
import '/providers/orders.dart';
import '/screens/user_products_screen.dart';

import '/screens/OrdersScreen.dart';
import '/screens/cart_screen.dart';
import '/providers/cart.dart';
import 'package:provider/provider.dart';

import '/screens/products_overview_screen.dart';
import '/screens/product_detail_screen.dart';
import '/providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          // home: ,
          routes: {
            '/': (ctx) => ProductsOverviewScreen(),
            '/product-detail': (ctx) => ProductDetailScreen(),
            '/cart-screen': (ctx) => CartScreen(),
            '/orders-screen': (ctx) => OrdersScreen(),
            '/user-products-screen': (ctx) => UserProductsScreen(),
            '/edit-product-screen': (ctx) => EditProductScreen(),
          }),
    );
  }
}
