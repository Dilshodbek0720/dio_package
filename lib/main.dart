import 'package:dio_package/ui/home/countries_screen.dart';
import 'package:dio_package/ui/tab_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox()
    );
  }
}
