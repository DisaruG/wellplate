import 'package:flutter/material.dart';
import 'package:wellplate/api/api_service.dart'; // Import the ApiService

class CreateMealContent extends StatefulWidget {
  const CreateMealContent({super.key});

  @override
  State<CreateMealContent> createState() => _CreateMealContentState();
}

class _CreateMealContentState extends State<CreateMealContent> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];
  List<String> _recipes = [];

  // API Service instance
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Make the entire content scrollable
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ingredient Input Section with modern design
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _ingredientController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Ingredient',
                          border: InputBorder.none,
                          hintText: 'E.g., Chicken, Tomatoes',
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.blue),
                    onPressed: _addIngredient,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Ingredients List Section
            if (_ingredients.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Ingredients:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  const SizedBox(height: 8),
                  for (var ingredient in _ingredients)
                    Row(
                      children: [
                        const Icon(Icons.circle, size: 8, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(ingredient, style: const TextStyle(color: Colors.blue)),
                      ],
                    ),
                ],
              ),
            const SizedBox(height: 32),

            // Recipe Suggestions Section with Cards and Bullet Points
            if (_recipes.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Suggested Recipes:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  const SizedBox(height: 8),
                  for (var recipe in _recipes)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        title: Text(recipe, style: const TextStyle(color: Colors.blue)),
                        trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
                        onTap: () => _showNutritionalInfo(recipe),
                      ),
                    ),
                ],
              ),
            if (_recipes.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('No recipes suggested yet. Try adding some ingredients.', style: TextStyle(color: Colors.blueGrey)),
              ),
          ],
        ),
      ),
    );
  }

  // Add Ingredient to the list
  void _addIngredient() {
    if (_ingredientController.text.isNotEmpty) {
      setState(() {
        _ingredients.add(_ingredientController.text);
      });
      _ingredientController.clear();

      // Fetch recipes based on ingredients
      _fetchRecipes();
    }
  }

  // Fetch recipes from the API
  void _fetchRecipes() async {
    try {
      List<String> recipes = await _apiService.fetchRecipes(_ingredients);
      setState(() {
        _recipes = recipes;
      });
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to load recipes')));
    }
  }

  // Placeholder for showing nutritional info
  void _showNutritionalInfo(String recipe) {
    setState(() {
    });
  }
}
