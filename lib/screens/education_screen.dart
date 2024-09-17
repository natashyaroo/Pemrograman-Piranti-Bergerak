import 'package:flutter/material.dart';
import '../models/education.dart';
import '../services/biodata_service.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final _biodataService = BiodataService();
  List<Education> _educationList = [];

  @override
  void initState() {
    super.initState();
    _loadEducation();
  }

  void _loadEducation() async {
    final biodata = await _biodataService.getBiodata();
    setState(() {
      _educationList = biodata.education;
    });
  }

  void _addEducation(Education education) {
    setState(() {
      _educationList.add(education);
      _biodataService.updateEducation(_educationList);
    });
  }

  void _removeEducation(Education education) {
    setState(() {
      _educationList.remove(education);
      _biodataService.updateEducation(_educationList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Education History')),
      body: ListView.builder(
        itemCount: _educationList.length,
        itemBuilder: (context, index) {
          final education = _educationList[index];
          return ListTile(
            title: Text(education.degree),
            subtitle: Text('${education.institution} (${education.year})'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeEducation(education),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddEducationDialog(context),
      ),
    );
  }

  void _showAddEducationDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _degree = '';
    String _institution = '';
    int _year = DateTime.now().year;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Education'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Degree'),
                  validator: (value) => value!.isEmpty ? 'Please enter the degree' : null,
                  onSaved: (value) => _degree = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Institution'),
                  validator: (value) => value!.isEmpty ? 'Please enter the institution' : null,
                  onSaved: (value) => _institution = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                  validator: (value) => int.tryParse(value!) == null ? 'Please enter a valid year' : null,
                  onSaved: (value) => _year = int.parse(value!),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addEducation(Education(degree: _degree, institution: _institution, year: _year));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}