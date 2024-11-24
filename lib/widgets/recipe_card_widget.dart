import 'package:flutter/material.dart';
import 'package:wellplate/screens/recipe/recipe_details_screen.dart';  // Import RecipeDetailsScreen
import 'package:wellplate/data/recipe_data.dart';  // Import Recipe data class

class RecipeCardWidget extends StatelessWidget {
  final String imageAsset;
  final String foodName;
  final String cuisineType;
  final String foodType;

  const RecipeCardWidget({
    super.key,
    required this.imageAsset,
    required this.foodName,
    required this.cuisineType,
    required this.foodType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the RecipeDetailsScreen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsScreen(
              recipe: Recipe(
                name: foodName,
                cuisine: cuisineType,
                type: foodType,
                goal: "Example Goal", // Replace with actual goal if available
                imageAsset: imageAsset,
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(cuisineType),
                  Text(foodType),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
