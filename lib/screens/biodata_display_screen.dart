import 'package:flutter/material.dart';
import '../models/biodata.dart';
import '../services/biodata_service.dart';

class BiodataDisplayScreen extends StatelessWidget {
  final _biodataService = BiodataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biodata Display')),
      body: FutureBuilder<Biodata>(
        future: _biodataService.getBiodata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No biodata available'));
          } else {
            final biodata = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name: ${biodata.name}', style: TextStyle(fontSize: 18)),
                  Text('Email: ${biodata.email}', style: TextStyle(fontSize: 18)),
                  Text('Birth Date: ${biodata.birthDate.toString().split(' ')[0]}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text('Skills:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 8.0,
                    children: biodata.skills.map((skill) => Chip(label: Text(skill))).toList(),
                  ),
                  SizedBox(height: 20),
                  Text('Education:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Column(
                    children: biodata.education.map((edu) => ListTile(
                      title: Text(edu.degree),
                      subtitle: Text('${edu.institution} (${edu.year})'),
                    )).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}