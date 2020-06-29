import 'package:flutter/material.dart';
import 'package:medicine/providers/medicines.dart';
import 'package:medicine/screens/edit_medicine_screen.dart';
import 'package:medicine/widgets/app_drawer.dart';
import 'package:medicine/widgets/user_medicine_item.dart';
import 'package:provider/provider.dart';

class UserMedicinesScreen extends StatelessWidget {
  static const routeName = '/manage-medicines';

  @override
  Widget build(BuildContext context) {
    final medicinesData = Provider.of<Medicines>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Medicines'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditMedicineScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: medicinesData.items.length,
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserMedicineItem(
                medicinesData.items[i].id,
                medicinesData.items[i].title,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
