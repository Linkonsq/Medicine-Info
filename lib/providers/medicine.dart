import 'package:flutter/material.dart';

class Medicine with ChangeNotifier {
  final String id;
  final String title;
  int quantity;

  Medicine({
    @required this.id,
    @required this.title,
    @required this.quantity,
  });
}
