import 'package:flutter/material.dart';

class MyMealsScreen extends StatefulWidget {
  const MyMealsScreen({super.key});

  @override
  State<MyMealsScreen> createState() => _MyMealsScreenState();
}

class _MyMealsScreenState extends State<MyMealsScreen> {
  // Track the selected option
  String _selectedOption = 'Planner'; // Default option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Segmented Button
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'Planner',
                  label: Text('Planner'),
                  icon: Icon(Icons.calendar_today),
                ),
                ButtonSegment(
                  value: 'Shopping List',
                  label: Text('Shopping List'),
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
              selected: <String>{_selectedOption},
              onSelectionChanged: (newSelection) {
                setState(() {
                  _selectedOption = newSelection.first; // Update selection
                });
              },
            ),
            const SizedBox(height: 16),
            // Display content based on selection
            Expanded(
              child: _selectedOption == 'Planner'
                  ? _buildPlannerContent() // Planner content
                  : _buildShoppingListContent(), // Shopping list content
            ),
          ],
        ),
      ),
    );
  }

  // Placeholder for Planner content
  Widget _buildPlannerContent() {
    return const Center(
      child: Text(
        'Meal Planner coming soon!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  // Placeholder for Shopping List content
  Widget _buildShoppingListContent() {
    return const Center(
      child: Text(
        'Shopping List coming soon!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
