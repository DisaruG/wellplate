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
  bool _isLoading = false; // To track the loading state

  // API Service instance
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Make the entire content scrollable
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ingredient Input Section with Icon
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background changed to white
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.search, color: Colors.grey), // Icon color changed to grey
                  ),
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Ingredient',
                        border: InputBorder.none,
                        hintText: 'Chicken, Tomatoes',
                        hintStyle: TextStyle(
                          color: Color(0x80333333), // 50% opacity of #333333
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Add Button with the same width as the TextField
            SizedBox(
              width: double.infinity, // Makes the button the same width as the TextField
              child: ElevatedButton(
                onPressed: _addIngredient,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  backgroundColor: Colors.green, // Background color changed to green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Add Ingredient', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 32),

            // Ingredients Cards Section with Animated Chips
            if (_ingredients.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Ingredients:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0, // Horizontal spacing between cards
                    runSpacing: 8.0, // Vertical spacing between rows
                    children: _ingredients.map((ingredient) {
                      return Chip(
                        backgroundColor: Colors.grey[200], // Changed background to light grey
                        label: Text(ingredient, style: const TextStyle(color: Colors.black)), // Changed text color to black
                        deleteIcon: const Icon(Icons.close, color: Colors.red),
                        onDeleted: () => _removeIngredient(ingredient),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 32),

            // Loader while fetching recipes
            if (_isLoading)
              const Center(child: CircularProgressIndicator(color: Colors.green)),

            // Recipe Suggestions Section with Enhanced Cards
            if (_recipes.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Suggested Recipes:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(height: 8),
                  for (var recipe in _recipes)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        title: Text(recipe, style: const TextStyle(color: Colors.black)), // Changed text color to black
                        onTap: () => _showNutritionalInfo(recipe),
                      ),
                    ),
                ],
              ),

            // Empty State Illustration if no recipes or ingredients
            if (_ingredients.isEmpty && _recipes.isEmpty)
              const Column(
                children: [
                  Image(
                    image: AssetImage('assets/Eating.png'), // Add your empty state image
                    height: 200,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No recipes yet! Start adding ingredients to see suggestions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                ],
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

  // Remove Ingredient from the list
  void _removeIngredient(String ingredient) {
    setState(() {
      _ingredients.remove(ingredient);
    });
    _fetchRecipes(); // Fetch updated recipes after ingredient removal
  }

  // Fetch recipes from the API
  void _fetchRecipes() async {
    setState(() {
      _isLoading = true; // Set loading state to true when fetching
    });

    try {
      List<String> recipes = await _apiService.fetchRecipes(_ingredients);
      if (mounted) { // Check if the widget is still mounted before calling setState
        setState(() {
          _recipes = recipes;
          _isLoading = false; // Stop loading once recipes are fetched
        });
      }
    } catch (e) {
      // Handle errors
      if (mounted) { // Ensure context is still valid before showing a snackbar
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to load recipes')));
      }
    }
  }

  // Placeholder for showing nutritional info
  void _showNutritionalInfo(String recipe) {
    setState(() {
      // Placeholder for showing nutritional information
    });
  }
}
