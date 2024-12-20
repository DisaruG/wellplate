import 'package:flutter/material.dart';

class MyCalculatorScreen extends StatefulWidget {
  const MyCalculatorScreen({super.key});

  @override
  State<MyCalculatorScreen> createState() => _MyCalculatorScreenState();
}

class _MyCalculatorScreenState extends State<MyCalculatorScreen> {
  String _selectedSegment = 'Create a Meal'; // Default selected segment

  @override
  Widget build(BuildContext context) {
    const double borderRadiusValue = 20.0; // Define a consistent border radius

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Segmented Button with Shadow
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the button
                borderRadius: BorderRadius.circular(borderRadiusValue),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    blurRadius: 8, // Spread of the shadow
                    offset: const Offset(0, 4), // Position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0), // Optional inner padding
                child: SegmentedButton<String>(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusValue),
                      ),
                    ),
                  ),
                  segments: const [
                    ButtonSegment(
                      value: 'Create a Meal',
                      label: Text('Create a Meal'),
                      icon: Icon(Icons.restaurant_menu),
                    ),
                    ButtonSegment(
                      value: 'Shopping List',
                      label: Text('Shopping List'),
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ],
                  selected: <String>{_selectedSegment}, // Track the selected segment
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      _selectedSegment = newSelection.first;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Display content based on the selected segment
          Expanded(
            child: _selectedSegment == 'Create a Meal'
                ? _buildCreateAMeal()
                : _buildShoppingList(),
          ),
        ],
      ),
    );
  }

  // Widget for the Create a Meal screen
  Widget _buildCreateAMeal() {
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

  // Widget for the Shopping List screen
  Widget _buildShoppingList() {
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
