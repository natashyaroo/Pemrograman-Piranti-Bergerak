import 'package:flutter/material.dart';

class BiodataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Saya'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama: John Doe', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Umur: 30 tahun', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Pekerjaan: Software Developer', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Alamat: Jl. Contoh No. 123, Jakarta', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}