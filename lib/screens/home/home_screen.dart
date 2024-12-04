import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wellplate/providers/recipe_filter_provider.dart';
import 'package:wellplate/widgets/app_bar_widget.dart';
import 'package:wellplate/widgets/daily_tip_card.dart';
import 'package:wellplate/widgets/recipe_input_buttons.dart';
import 'package:wellplate/widgets/recipe_card_widget.dart';
import 'package:wellplate/data/recipe_data.dart';

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
                _showCupertinoPicker(
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
                _showCupertinoPicker(
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
                _showCupertinoPicker(
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

  void _showCupertinoPicker(
      BuildContext context,
      String filterType,
      Function(String) updateFilter,
      List<String> options,
      ) {
    int selectedIndex = 0; // Track the currently selected index in the picker

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              // Picker Title and Done Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      filterType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Apply the selected filter when "Done" is pressed
                        updateFilter(options[selectedIndex]);
                        Navigator.pop(context);
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40, // Height of each item in the picker
                  onSelectedItemChanged: (index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map((option) => Center(child: Text(option)))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
