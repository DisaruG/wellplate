import 'package:flutter/material.dart';

class MyMealsScreen extends StatelessWidget {
  const MyMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Welcome to My Meals!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
