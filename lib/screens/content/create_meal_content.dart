import 'package:flutter/material.dart';

class CreateMealContent extends StatelessWidget {
  const CreateMealContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Start creating your meal!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
