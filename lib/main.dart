import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/biodata_form_screen.dart';
import 'screens/biodata_display_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/education_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/form': (context) => BiodataFormScreen(),
        '/display': (context) => BiodataDisplayScreen(),
        '/skills': (context) => SkillsScreen(),
        '/education': (context) => EducationScreen(),
      },
    );
  }
}