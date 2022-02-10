import 'package:flutter/material.dart';
import '../widgets/drawer_app.dart';
import '../widgets/user_products.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('My Products'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/edit-product-screen');
                },
                icon: Icon(Icons.add))
          ],
        ),
        drawer: DrawerApp(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProducts(
                    productsData.items[i].id,
                    productsData.items[i].imageUrl,
                    productsData.items[i].title),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
