import 'package:flutter/material.dart';
import '../services/biodata_service.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final _biodataService = BiodataService();
  List<String> _skills = [];
  final _skillController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  void _loadSkills() async {
    final biodata = await _biodataService.getBiodata();
    setState(() {
      _skills = biodata.skills;
    });
  }

  void _addSkill(String skill) {
    if (skill.isNotEmpty) {
      setState(() {
        _skills.add(skill);
        _biodataService.updateSkills(_skills);
      });
      _skillController.clear();
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
      _biodataService.updateSkills(_skills);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Skills')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _skillController,
                    decoration: InputDecoration(labelText: 'Add a new skill'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addSkill(_skillController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _skills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_skills[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeSkill(_skills[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}