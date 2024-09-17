import 'package:flutter/material.dart';
import '../models/biodata.dart';
import '../services/biodata_service.dart';

class BiodataFormScreen extends StatefulWidget {
  @override
  _BiodataFormScreenState createState() => _BiodataFormScreenState();
}

class _BiodataFormScreenState extends State<BiodataFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _biodata = Biodata();
  final _biodataService = BiodataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Biodata')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                onSaved: (value) => _biodata.name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => !value!.contains('@') ? 'Please enter a valid email' : null,
                onSaved: (value) => _biodata.email = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Select Birth Date'),
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() => _biodata.birthDate = pickedDate);
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _biodataService.saveBiodata(_biodata);
                    Navigator.pushNamed(context, '/display');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}