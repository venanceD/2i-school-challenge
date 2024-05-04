import 'package:flutter/material.dart';
import 'package:sc2i/principal.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2ISC',
      debugShowCheckedModeBanner: false,
      home: welcome(),
    );
  }
}
