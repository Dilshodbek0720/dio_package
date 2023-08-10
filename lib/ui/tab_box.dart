import 'package:dio_package/ui/home/companies_screen.dart';
import 'package:dio_package/ui/home/countries_screen.dart';
import 'package:flutter/material.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const CountriesScreen());
    screens.add(const CompaniesScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Companies',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}