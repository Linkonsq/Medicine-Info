import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/dummy_data.dart';

class InfoScreen extends StatefulWidget {
  static String id = 'info_screen';

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  DataTable dataBody() {
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
      rows: DUMMY_MEDICINES
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
                  InkWell(
                    child: Container(
                      child: Text('Buy'),
                    ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Info'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: dataBody(),
          )
        ],
      ),
    );
  }
}
