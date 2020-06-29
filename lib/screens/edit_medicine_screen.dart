import 'package:flutter/material.dart';
import 'package:medicine/providers/medicine.dart';
import 'package:medicine/providers/medicines.dart';
import 'package:provider/provider.dart';

class EditMedicineScreen extends StatefulWidget {
  static const routeName = '/edit-medicine';

  @override
  _EditMedicineScreenState createState() => _EditMedicineScreenState();
}

class _EditMedicineScreenState extends State<EditMedicineScreen> {
  final _form = GlobalKey<FormState>();
  final _quantityFocusNode = FocusNode();
  var _editedMedicine = Medicine(
    id: null,
    title: '',
    quantity: 0,
  );
  var _initValues = {
    'title': '',
    'quantity': '',
  };

  void _saveForm() {
    final isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();
    Provider.of<Medicines>(context, listen: false).addMedicine(_editedMedicine);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medicine'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_quantityFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedMedicine = Medicine(
                    id: _editedMedicine.id,
                    title: value,
                    quantity: _editedMedicine.quantity,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                focusNode: _quantityFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a quantity.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid quantity.';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a quantity greater than 0.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedMedicine = Medicine(
                    id: _editedMedicine.id,
                    title: _editedMedicine.title,
                    quantity: int.parse(value),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
