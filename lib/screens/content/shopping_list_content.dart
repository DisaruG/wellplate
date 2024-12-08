import 'package:flutter/material.dart';

class ShoppingListContent extends StatelessWidget {
  const ShoppingListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'No items in your shopping list yet!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
