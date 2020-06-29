import 'package:flutter/material.dart';
import 'package:medicine/providers/medicine.dart';

class Medicines with ChangeNotifier {
  List<Medicine> _items = [
    Medicine(
      id: 'm1',
      title: 'Fematos',
      quantity: 50,
    ),
    Medicine(
      id: 'm2',
      title: 'Seclo',
      quantity: 35,
    ),
    Medicine(
      id: 'm3',
      title: 'Rabeca',
      quantity: 90,
    ),
    Medicine(
      id: 'm4',
      title: 'Alcet',
      quantity: 200,
    ),
    Medicine(
      id: 'm5',
      title: 'Flexi®',
      quantity: 150,
    ),
    Medicine(
      id: 'm6',
      title: 'Tylace™',
      quantity: 15,
    ),
    Medicine(
      id: 'm7',
      title: 'Virux®',
      quantity: 29,
    ),
    Medicine(
      id: 'm8',
      title: 'Virux Tablet®',
      quantity: 45,
    ),
    Medicine(
      id: 'm9',
      title: 'Virux® HC',
      quantity: 68,
    ),
    Medicine(
      id: 'm10',
      title: 'Antiva®',
      quantity: 75,
    ),
    Medicine(
      id: 'm11',
      title: 'Geston®',
      quantity: 80,
    ),
  ];

  List<Medicine> get items {
    return [..._items];
  }

  void addMedicine() {
    //_items.add(value);
    notifyListeners();
  }

  void decreaseMedicine(String id) {
    final medIndex = _items.indexWhere((med) => med.id == id);
    if (medIndex >= 0) {
      _items[medIndex].quantity--;
      notifyListeners();
    }
  }
}
