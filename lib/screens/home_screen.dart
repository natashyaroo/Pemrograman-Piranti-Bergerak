import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biodata App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Create Biodata'),
              onPressed: () => Navigator.pushNamed(context, '/form'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('View Biodata'),
              onPressed: () => Navigator.pushNamed(context, '/display'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Manage Skills'),
              onPressed: () => Navigator.pushNamed(context, '/skills'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Education History'),
              onPressed: () => Navigator.pushNamed(context, '/education'),
            ),
          ],
        ),
      ),
    );
  }
}