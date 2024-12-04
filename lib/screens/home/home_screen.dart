import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellplate/providers/recipe_filter_provider.dart';
import 'package:wellplate/widgets/app_bar_widget.dart';
import 'package:wellplate/widgets/daily_tip_card.dart';
import 'package:wellplate/widgets/recipe_input_buttons.dart';
import 'package:wellplate/widgets/recipe_card_widget.dart';
import 'package:wellplate/data/recipe_data.dart'; // Ensure Recipe class is imported correctly

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final recipeFilterProvider =
    Provider.of<RecipeFilterProvider>(context, listen: true);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Dashboard'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DailyTipCard(tip: 'Eat your veggies!'),
            const SizedBox(height: 16),
            RecipeInputButtons(
              cuisines: const [
                'Italian',
                'Chinese',
                'Indian',
                'Japanese',
                'Mexican',
                'French',
                'Thai',
                'American'
              ],
              types: const [
                'Vegetarian',
                'Non-Vegetarian',
                'Vegan',
                'Keto',
                'Low-Carb',
                'High-Protein',
                'Gluten-Free'
              ],
              goals: const [
                'Weight Loss',
                'Muscle Gain',
                'Maintenance',
                'Balanced Nutrition',
                'Weight Maintenance',
                'Low-Calorie',
                'Low-Carb'
              ],
              selectedCuisine: recipeFilterProvider.selectedCuisine,
              selectedType: recipeFilterProvider.selectedType,
              selectedGoal: recipeFilterProvider.selectedGoal,
              onCuisinePressed: () {
                _showBottomSheet(
                  context,
                  'Cuisine',
                  recipeFilterProvider.updateCuisine,
                  const [
                    'Italian',
                    'Chinese',
                    'Indian',
                    'Japanese',
                    'Mexican',
                    'French',
                    'Thai',
                    'American'
                  ],
                );
              },
              onTypePressed: () {
                _showBottomSheet(
                  context,
                  'Type',
                  recipeFilterProvider.updateType,
                  const [
                    'Vegetarian',
                    'Non-Vegetarian',
                    'Vegan',
                    'Keto',
                    'Low-Carb',
                    'High-Protein',
                    'Gluten-Free'
                  ],
                );
              },
              onGoalPressed: () {
                _showBottomSheet(
                  context,
                  'Goal',
                  recipeFilterProvider.updateGoal,
                  const [
                    'Weight Loss',
                    'Muscle Gain',
                    'Maintenance',
                    'Balanced Nutrition',
                    'Weight Maintenance',
                    'Low-Calorie',
                    'Low-Carb'
                  ],
                );
              },
              onFilterPressed: recipeFilterProvider.applyFilter,
            ),
            const SizedBox(height: 16),
            _buildRecipeList(recipeFilterProvider.filteredRecipes),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeList(List<Recipe> recipes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: recipes.isNotEmpty
          ? GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCardWidget(
            imageAsset: recipe.imageAsset,
            foodName: recipe.name,
            cuisineType: recipe.cuisine,
            foodType: recipe.type,
          );
        },
      )
          : const Center(
        child: Text(
          'No recipes match your filters!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context,
      String filterType,
      Function(String) updateFilter,
      List<String> options,
      ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: options.map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                updateFilter(option);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
