// Source:https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'screens/project-screen.dart';
import 'screens/project-entry-screen.dart';
import 'screens/project-email-screen.dart';
import 'screens/access-screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ProjectNavigationScaffold(),
    );
  }
}

class ProjectNavigationScaffold extends StatefulWidget {
  const ProjectNavigationScaffold({super.key});

  @override
  State<ProjectNavigationScaffold> createState() => _ProjectNavigationScaffoldState();
}

class _ProjectNavigationScaffoldState extends State<ProjectNavigationScaffold> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<String> _titleOptions = ['Project Description', 'Collect Data', 'Email a Question'];
  static List<Widget> _widgetOptions = <Widget>[
    ProjectScreen(),
    ProjectEntryScreen(),
    ProjectEmailScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( _titleOptions.elementAt(_selectedIndex)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_alt_rounded),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
