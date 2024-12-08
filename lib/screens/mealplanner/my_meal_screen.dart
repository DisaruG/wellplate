import 'package:flutter/material.dart';
import 'package:wellplate/screens/content/create_meal_content.dart'; // Import the Create Meal Content file
import 'package:wellplate/screens/content/shopping_list_content.dart'; // Import the Shopping List Content file

class MyMealsScreen extends StatefulWidget {
  const MyMealsScreen({super.key});

  @override
  State<MyMealsScreen> createState() => _MyMealsScreenState();
}

class _MyMealsScreenState extends State<MyMealsScreen> {
  String _selectedSegment = 'Create a Meal'; // Default selected segment

  @override
  Widget build(BuildContext context) {
    const double borderRadiusValue = 20.0; // Define a consistent border radius

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
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
                ? const CreateMealContent() // Use the Create Meal Content widget
                : const ShoppingListContent(), // Use the Shopping List Content widget
          ),
        ],
      ),
    );
  }
}
