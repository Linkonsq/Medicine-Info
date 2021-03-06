import 'package:flutter/material.dart';

class UserMedicineItem extends StatelessWidget {
  final String id;
  final String title;

  UserMedicineItem(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
