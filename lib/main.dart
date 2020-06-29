import 'package:flutter/material.dart';
import 'package:medicine/providers/medicines.dart';
import 'package:medicine/screens/edit_medicine_screen.dart';
import 'package:medicine/screens/medicines_screen.dart';
import 'package:medicine/screens/user_medicines_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Medicines(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicines',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MedicinesScreen(),
        routes: {
          UserMedicinesScreen.routeName: (ctx) => UserMedicinesScreen(),
          EditMedicineScreen.routeName: (ctx) => EditMedicineScreen(),
        },
      ),
    );
  }
}
