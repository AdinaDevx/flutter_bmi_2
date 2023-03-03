import 'package:flutter/material.dart';
import 'package:flutter_bmi_2/screens/home_screen.dart';

void main() {
  runApp(
    const BmiCalculiator(),
  );
}

class BmiCalculiator extends StatelessWidget {
  const BmiCalculiator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
