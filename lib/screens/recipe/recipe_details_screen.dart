import 'package:flutter/material.dart';
import 'package:wellplate/data/recipe_data.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(recipe.imageAsset),
            const SizedBox(height: 16),
            Text(
              recipe.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              "Cuisine: ${recipe.cuisine}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Type: ${recipe.type}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Goal: ${recipe.goal}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            // Add any other details like ingredients and instructions if you have them
            const Text(
              "Ingredients:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Example list of ingredients (you can customize this part)
            const Text("• Ingredient 1"),
            const Text("• Ingredient 2"),
            const Text("• Ingredient 3"),
            const SizedBox(height: 16),
            const Text(
              "Instructions:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Example instructions (you can customize this part)
            const Text("1. Step 1..."),
            const Text("2. Step 2..."),
            const Text("3. Step 3..."),
          ],
        ),
      ),
    );
  }
}
