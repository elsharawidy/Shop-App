import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50, top: 50),
            width: double.infinity,
            height: 150,
            color: Colors.blue[200],
            child: Text(
              'Hello There!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Shop',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Orders',
              style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/orders-screen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Manage Products',
              style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/user-products-screen');
            },
          ),
        ],
      ),
    );
  }
}
