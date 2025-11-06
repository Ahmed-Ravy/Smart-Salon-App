import 'package:flutter/material.dart';
import 'package:smart_saloon/log_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Salon",
      home: LogInPage(),
    );
  }
}
