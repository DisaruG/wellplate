import 'package:flutter/material.dart';
import 'package:wellplate/data/recipe_data.dart';

class RecipeFilterProvider with ChangeNotifier {
  String? _selectedCuisine;
  String? _selectedType;
  String? _selectedGoal;
  List<Recipe> _filteredRecipes = [];

  // Getters
  String? get selectedCuisine => _selectedCuisine;
  String? get selectedType => _selectedType;
  String? get selectedGoal => _selectedGoal;
  List<Recipe> get filteredRecipes => _filteredRecipes.isNotEmpty
      ? _filteredRecipes
      : recipes; // Return default recipes if none are filtered

  // Setters and logic
  void updateCuisine(String cuisine) {
    _selectedCuisine = cuisine;
    notifyListeners();
  }

  void updateType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  void updateGoal(String goal) {
    _selectedGoal = goal;
    notifyListeners();
  }

  void applyFilter() {
    if (_selectedCuisine == null ||
        _selectedType == null ||
        _selectedGoal == null) {
      return;
    }

    _filteredRecipes = recipes.where((recipe) {
      bool matchesCuisine =
          _selectedCuisine == null || recipe.cuisine == _selectedCuisine;
      bool matchesType =
          _selectedType == null || recipe.type == _selectedType;
      bool matchesGoal =
          _selectedGoal == null || recipe.goal == _selectedGoal;

      return matchesCuisine && matchesType && matchesGoal;
    }).toList();
    notifyListeners();
  }
}
