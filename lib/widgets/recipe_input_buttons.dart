import 'package:flutter/material.dart';

class RecipeInputButtons extends StatelessWidget {
  final VoidCallback onCuisinePressed;
  final VoidCallback onTypePressed;
  final VoidCallback onGoalPressed;
  final VoidCallback onFilterPressed;

  const RecipeInputButtons({
    super.key,
    required this.onCuisinePressed,
    required this.onTypePressed,
    required this.onGoalPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Row for Cuisine, Type, and Goal Buttons (side by side)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cuisine Button
              Expanded(
                child: ElevatedButton(
                  onPressed: onCuisinePressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Cuisine"),
                ),
              ),
              const SizedBox(width: 8), // Space between buttons

              // Type Button
              Expanded(
                child: ElevatedButton(
                  onPressed: onTypePressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Type"),
                ),
              ),
              const SizedBox(width: 8), // Space between buttons

              // Goal Button
              Expanded(
                child: ElevatedButton(
                  onPressed: onGoalPressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Goal"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Space between row and Filter button

          // Filter Button (unchanged, full width)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onFilterPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50), // Full width, increased height
              ),
              child: const Text("Filter Recipes"),
            ),
          ),
        ],
      ),
    );
  }
}
