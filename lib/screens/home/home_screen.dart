import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellplate/widgets/app_bar_widget.dart';
import 'package:wellplate/widgets/bottom_nav_bar_widget.dart';
import 'package:wellplate/widgets/daily_tip_card.dart';
import 'package:wellplate/providers/health_tip_provider.dart';
import 'package:wellplate/widgets/recipe_input_buttons.dart';
import 'package:wellplate/widgets/recipe_card_widget.dart';  // Import the RecipeCardWidget
import 'package:wellplate/data/recipe_data.dart';  // Import recipe data

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int _currentIndex = 0;
  String randomTip = "";
  final HealthTipProvider healthTipProvider = HealthTipProvider();

  String? selectedCuisine;
  String? selectedType;
  String? selectedGoal;
  List<Recipe> filteredRecipeList = [];  // List to hold filtered recipes

  final ScrollController _scrollController = ScrollController();  // Marked as final
  bool _isScrolling = false;  // Track scrolling state for visibility

  @override
  void initState() {
    super.initState();
    randomTip = healthTipProvider.getRandomTip();

    // Add ScrollController listener
    _scrollController.addListener(() {
      setState(() {
        // Show the button if scrolled more than 200 pixels
        _isScrolling = _scrollController.offset > 200;
      });
    });
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
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
      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select $type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
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
                  backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: items
                      .map((item) => Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Colors.white : Colors.black,
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

  @override
  void dispose() {
    // Remove the listener when the screen is disposed
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: CustomAppBar(
          isDarkMode: isDarkMode,
          toggleTheme: toggleTheme,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,  // Add ScrollController
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
                onCuisinePressed: () {
                  _showBottomSheet(context, 'Cuisine', const [
                    'Italian', 'Chinese', 'Indian', 'Japanese', 'Mexican', 'French',
                    'Thai', 'American'
                  ], (selected) {
                    _updateSelection('Cuisine', selected);
                  });
                },
                onTypePressed: () {
                  _showBottomSheet(context, 'Type', const [
                    'Vegetarian', 'Non-Vegetarian', 'Vegan', 'Keto', 'Low-Carb',
                    'High-Protein', 'Gluten-Free'
                  ], (selected) {
                    _updateSelection('Type', selected);
                  });
                },
                onGoalPressed: () {
                  _showBottomSheet(context, 'Goal', const [
                    'Weight Loss', 'Muscle Gain', 'Maintenance', 'Balanced',
                    'Low-Calorie', 'Low-Carb'
                  ], (selected) {
                    _updateSelection('Goal', selected);
                  });
                },
                onFilterPressed: _onFilterPressed,  // Hook up the filter button
                selectedCuisine: selectedCuisine,
                selectedType: selectedType,
                selectedGoal: selectedGoal,
              ),
              const SizedBox(height: 16),
              _buildRecipeList(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
        ),
        floatingActionButton: Visibility(
          visible: _isScrolling,  // Show the button based on scroll state
          child: FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.arrow_upward),
          ),
        ),
      ),
    );
  }
}
