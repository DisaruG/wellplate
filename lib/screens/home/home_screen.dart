import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellplate/screens/calculator/calculator_screen.dart';
import 'package:wellplate/widgets/app_bar_widget.dart';
import 'package:wellplate/widgets/custom_nav_bar.dart';
import 'package:wellplate/widgets/daily_tip_card.dart';
import 'package:wellplate/providers/health_tip_provider.dart';
import 'package:wellplate/widgets/recipe_input_buttons.dart';
import 'package:wellplate/widgets/recipe_card_widget.dart';  // Import the RecipeCardWidget
import 'package:wellplate/data/recipe_data.dart';  // Import recipe data
import 'package:wellplate/screens/mealplanner/my_meal_screen.dart'; // Import other screens

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;  // Track the current index of the bottom navigation bar
  String randomTip = "";
  final HealthTipProvider healthTipProvider = HealthTipProvider();

  String? selectedCuisine;
  String? selectedType;
  String? selectedGoal;
  List<Recipe> filteredRecipeList = [];  // List to hold filtered recipes

  final ScrollController _scrollController = ScrollController();  // Marked as final
  // Track scrolling state for visibility

  @override
  void initState() {
    super.initState();
    randomTip = healthTipProvider.getRandomTip();

    // Add ScrollController listener
    _scrollController.addListener(() {
      setState(() {
        // Show the button if scrolled more than 200 pixels
      });
    });
  }

  void _updateSelection(String type, String selected) {
    setState(() {
      if (type == 'Cuisine') {
        selectedCuisine = selected;
      } else if (type == 'Type') {
        selectedType = selected;
      } else if (type == 'Goal') {
        selectedGoal = selected;
      }
    });
  }

  // Handle Filter button press logic
  void _onFilterPressed() {
    if (selectedCuisine == null || selectedType == null || selectedGoal == null) {
      // Show message if any filter is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select all filters: Cuisine, Type, and Goal.')),
      );
    } else {
      // Apply the filter
      _filterRecipes();
    }
  }

  // Apply filter logic based on selected criteria
  void _filterRecipes() {
    List<Recipe> filteredRecipes = recipes.where((recipe) {
      bool matchesCuisine = selectedCuisine == null || recipe.cuisine == selectedCuisine;
      bool matchesType = selectedType == null || recipe.type == selectedType;
      bool matchesGoal = selectedGoal == null || recipe.goal == selectedGoal;

      return matchesCuisine && matchesType && matchesGoal;
    }).toList();

    setState(() {
      filteredRecipeList = filteredRecipes;
    });
  }

  // Build the list of recipes, either filtered or unfiltered
  Widget _buildRecipeList() {
    final listToDisplay = filteredRecipeList.isNotEmpty ? filteredRecipeList : recipes;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: listToDisplay.length,
        itemBuilder: (context, index) {
          final recipe = listToDisplay[index];
          return RecipeCardWidget(
            imageAsset: recipe.imageAsset,  // Using local assets
            foodName: recipe.name,
            cuisineType: recipe.cuisine,
            foodType: recipe.type,
          );
        },
      ),
    );
  }

  // Show the bottom sheet for selecting a filter type (Cuisine, Type, Goal)
  void _showBottomSheet(BuildContext context, String type, List<String> items,
      ValueChanged<String> onItemSelected) {
    int selectedIndex = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,  // No need for dark mode
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: Colors.grey[200],  // Standard color, no dark mode
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select $type',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,  // No dark mode color
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Pass the selected item here
                          onItemSelected(items[selectedIndex]);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                  itemExtent: 40.0,
                  backgroundColor: Colors.white,  // No dark mode
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: items
                      .map((item) => Center(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,  // No dark mode color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Define the onTabSelected method to handle bottom navigation selection
  void onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set the AppBar title based on the current screen
    String appBarTitle = _currentIndex == 0
        ? 'Dashboard'
        : _currentIndex == 1
        ? 'Meal Planner'
        : 'Calculator';

    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle),  // Pass the dynamic title
      body: _currentIndex == 0
          ? SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            DailyTipCard(tip: randomTip),
            const SizedBox(height: 16),
            RecipeInputButtons(
              cuisines: const [
                'Italian', 'Chinese', 'Indian', 'Japanese', 'Mexican', 'French',
                'Thai', 'American'
              ],
              types: const [
                'Vegetarian', 'Non-Vegetarian', 'Vegan', 'Keto', 'Low-Carb',
                'High-Protein', 'Gluten-Free'
              ],
              goals: const [
                'Weight Loss', 'Muscle Gain', 'Maintenance', 'Balanced Nutrition',
                'Weight Maintenance', 'Low-Calorie', 'Low-Carb'
              ],
              selectedCuisine: selectedCuisine,
              selectedType: selectedType,
              selectedGoal: selectedGoal,
              onCuisinePressed: () {
                _showBottomSheet(context, 'Cuisine', const [
                  'Italian', 'Chinese', 'Indian', 'Japanese', 'Mexican', 'French',
                  'Thai', 'American'
                ], (selected) {
                  _updateSelection('Cuisine', selected);  // Update selected cuisine
                });
              },
              onTypePressed: () {
                _showBottomSheet(context, 'Type', const [
                  'Vegetarian', 'Non-Vegetarian', 'Vegan', 'Keto', 'Low-Carb',
                  'High-Protein', 'Gluten-Free'
                ], (selected) {
                  _updateSelection('Type', selected);  // Update selected type
                });
              },
              onGoalPressed: () {
                _showBottomSheet(context, 'Goal', const [
                  'Weight Loss', 'Muscle Gain', 'Maintenance', 'Balanced Nutrition',
                  'Weight Maintenance', 'Low-Calorie', 'Low-Carb'
                ], (selected) {
                  _updateSelection('Goal', selected);  // Update selected goal
                });
              },
              onFilterPressed: _onFilterPressed,
            ),
            const SizedBox(height: 16),
            _buildRecipeList(),
          ],
        ),
      )
          : _currentIndex == 1
          ? const MyMealsScreen() // Display the meal planner screen
          : const MyCalculatorScreen(), // Display the meal builder screen
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: onTabSelected,  // Pass the function to update the index
      ),
    );
  }
}
