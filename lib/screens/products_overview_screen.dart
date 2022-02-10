import 'package:flutter/material.dart';
import '../widgets/drawer_app.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum Options {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (Options value) {
                setState(() {
                  if (value == Options.Favorites) {
                    _showFavoritesOnly = true;
                  } else {
                    _showFavoritesOnly = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Favorites'),
                      value: Options.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      value: Options.All,
                    )
                  ]),
          Consumer<Cart>(
            builder: (
              ctx,
              caro,
              ch,
            ) =>
                Badge(
              child: ch,
              value: caro.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart-screen');
              },
            ),
          ),
        ],
      ),
      drawer: DrawerApp(),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
