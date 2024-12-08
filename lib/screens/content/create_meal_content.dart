import 'package:flutter/material.dart';

class CreateMealContent extends StatefulWidget {
  const CreateMealContent({super.key});

  @override
  State<CreateMealContent> createState() => _CreateMealContentState();
}

class _CreateMealContentState extends State<CreateMealContent> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];
  final List<String> _recipes = [];
  List<String> _nutritionalInfo = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ingredient Input Section with Card Style
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
          // List of Ingredients with Styling
          if (_ingredients.isNotEmpty)
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Ingredients:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ..._ingredients.map((ingredient) => Text(
                      '- $ingredient',
                      style: const TextStyle(fontSize: 16),
                    )),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 32),
          // Recipe Suggestions Section with a Card Style
          if (_recipes.isNotEmpty)
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Suggested Recipes:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ..._recipes.map((recipe) {
                      return GestureDetector(
                        onTap: () => _showNutritionalInfo(recipe),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              recipe,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          if (_recipes.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text('No recipes suggested yet.'),
            ),
          const SizedBox(height: 32),
          // Nutritional Information Section with Modern Design
          if (_nutritionalInfo.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nutritional Information:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ..._nutritionalInfo.map((info) => Text(
                      info,
                      style: const TextStyle(fontSize: 16),
                    )),
                  ],
                ),
              ),
            ),
          if (_nutritionalInfo.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text('No nutritional information available.'),
            ),
        ],
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
    }
  }

  // Show nutritional info for a recipe
  void _showNutritionalInfo(String recipe) {
    setState(() {
      _nutritionalInfo = [
        'Calories: 200 kcal',  // Placeholder values
        'Fat: 10g',
        'Protein: 15g',
      ];
    });
  }
}
