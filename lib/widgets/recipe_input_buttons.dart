import 'package:flutter/material.dart';

class RecipeInputButtons extends StatelessWidget {
  final List<String> cuisines;
  final List<String> types;
  final List<String> goals;
  final Function onCuisinePressed;
  final Function onTypePressed;
  final Function onGoalPressed;
  final VoidCallback onFilterPressed;
  final String? selectedCuisine;
  final String? selectedType;
  final String? selectedGoal;

  const RecipeInputButtons({
    super.key,
    required this.cuisines,
    required this.types,
    required this.goals,
    required this.onCuisinePressed,
    required this.onTypePressed,
    required this.onGoalPressed,
    required this.onFilterPressed,
    this.selectedCuisine,
    this.selectedType,
    this.selectedGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cuisine Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onCuisinePressed(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(selectedCuisine ?? "Cuisine"), // Display selected value or default text
                ),
              ),
              const SizedBox(width: 8),
              // Type Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onTypePressed(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(selectedType ?? "Type"), // Display selected value or default text
                ),
              ),
              const SizedBox(width: 8),
              // Goal Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onGoalPressed(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(selectedGoal ?? "Goal"), // Display selected value or default text
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Filter Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onFilterPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Filter Recipes",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
