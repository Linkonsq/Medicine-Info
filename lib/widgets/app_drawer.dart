import 'package:flutter/material.dart';
import 'package:medicine/screens/user_medicines_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Medicine'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Medicines'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserMedicinesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
