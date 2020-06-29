import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/providers/medicine.dart';
import 'package:medicine/providers/medicines.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  static String id = 'info_screen';

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  DataTable dataBody(List<Medicine> medicines) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text('Title'),
          numeric: false,
          tooltip: 'This is Title',
        ),
        DataColumn(
          label: Text('Quantity'),
          numeric: false,
          tooltip: 'This is Quantity',
        ),
        DataColumn(
          label: Text('Action'),
          numeric: false,
          tooltip: 'This is Action',
        ),
      ],
      rows: medicines
          .map(
            (medicine) => DataRow(
              cells: [
                DataCell(
                  Text(medicine.title),
                ),
                DataCell(
                  Text(medicine.quantity.toString()),
                ),
                DataCell(
                  FlatButton(
                    child: Text(
                      'Buy',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      Provider.of<Medicines>(context, listen: false)
                          .decreaseMedicine(medicine.id);
                    },
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicinesData = Provider.of<Medicines>(context);
    final medicines = medicinesData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Info'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: dataBody(medicines),
          )
        ],
      ),
    );
  }
}
