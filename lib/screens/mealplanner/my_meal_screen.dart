import 'package:flutter/material.dart';

class MyMealsScreen extends StatefulWidget {
  const MyMealsScreen({super.key});

  @override
  State<MyMealsScreen> createState() => _MyMealsScreenState();
}

class _MyMealsScreenState extends State<MyMealsScreen> {
  String _selectedSegment = 'Planned Meals'; // Default selected segment

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
                      value: 'Planned Meals',
                      label: Text('Planned Meals'),
                      icon: Icon(Icons.calendar_today),
                    ),
                    ButtonSegment(
                      value: 'Meal History',
                      label: Text('Meal History'),
                      icon: Icon(Icons.history),
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
            child: _selectedSegment == 'Planned Meals'
                ? _buildPlannedMeals()
                : _buildMealHistory(),
          ),
        ],
      ),
    );
  }

  // Widget for the Planned Meals screen
  Widget _buildPlannedMeals() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'No meals planned yet!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget for the Meal History screen
  Widget _buildMealHistory() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'No meal history available!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
