// recipe_data.dart

class Recipe {
  final String name;
  final String cuisine;
  final String type;
  final String goal;
  final String imageAsset;

  Recipe({
    required this.name,
    required this.cuisine,
    required this.type,
    required this.goal,
    required this.imageAsset,
  });
}

// Updated recipe list with no duplicate recipes
final List<Recipe> recipes = [
  // Italian Recipes
  Recipe(
    name: "Spaghetti Carbonara",
    cuisine: "Italian",
    type: "Non-Vegetarian",
    goal: "Weight Loss",
    imageAsset: "assets/carbonara.jpg",
  ),
  Recipe(
    name: "Spaghetti Carbonara",
    cuisine: "Italian",
    type: "Non-Vegetarian",
    goal: "Muscle Gain",
    imageAsset: "assets/carbonara.jpg",
  ),
  Recipe(
    name: "Spaghetti Carbonara",
    cuisine: "Italian",
    type: "Non-Vegetarian",
    goal: "Maintenance",
    imageAsset: "assets/carbonara.jpg",
  ),
  Recipe(
    name: "Vegetarian Lasagna",
    cuisine: "Italian",
    type: "Vegetarian",
    goal: "Weight Loss",
    imageAsset: "assets/VegetableLasagna.jpg",
  ),
  Recipe(
    name: "Vegetarian Lasagna",
    cuisine: "Italian",
    type: "Vegetarian",
    goal: "Muscle Gain",
    imageAsset: "assets/VegetableLasagna.jpg",
  ),
  Recipe(
    name: "Margherita Pizza",
    cuisine: "Italian",
    type: "Vegetarian",
    goal: "Balanced",
    imageAsset: "assets/pizza.jpg",
  ),

  // Chinese Recipes
  Recipe(
    name: "Vegetable Stir Fry",
    cuisine: "Chinese",
    type: "Vegetarian",
    goal: "Weight Loss",
    imageAsset: "assets/Vegetablefry.jpg",
  ),
  Recipe(
    name: "Vegetable Stir Fry",
    cuisine: "Chinese",
    type: "Vegetarian",
    goal: "Low-Calorie",
    imageAsset: "assets/Vegetablefry.jpg",
  ),
  Recipe(
    name: "Kung Pao Chicken",
    cuisine: "Chinese",
    type: "Non-Vegetarian",
    goal: "Low-Carb",
    imageAsset: "assets/kungpao.jpg",
  ),
  Recipe(
    name: "Sweet and Sour Pork",
    cuisine: "Chinese",
    type: "Non-Vegetarian",
    goal: "Low-Calorie",
    imageAsset: "assets/Sweet.jpg",
  ),

  // Indian Recipes
  Recipe(
    name: "Paneer Butter Masala",
    cuisine: "Indian",
    type: "Vegetarian",
    goal: "Low-Calorie",
    imageAsset: "assets/Masala.jpg",
  ),
  Recipe(
    name: "Chicken Tikka Masala",
    cuisine: "Indian",
    type: "Non-Vegetarian",
    goal: "Low-Carb",
    imageAsset: "assets/tikka.jpg",
  ),
  Recipe(
    name: "Dal Tadka",
    cuisine: "Indian",
    type: "Vegan",
    goal: "Weight Loss",
    imageAsset: "assets/Dal.jpg",
  ),

  // Mexican Recipes
  Recipe(
    name: "Tacos",
    cuisine: "Mexican",
    type: "Non-Vegetarian",
    goal: "Muscle Gain",
    imageAsset: "assets/Tacos.jpg",
  ),
  Recipe(
    name: "Vegetarian Quesadilla",
    cuisine: "Mexican",
    type: "Vegetarian",
    goal: "Low-Calorie",
    imageAsset: "assets/Quesadillas.jpg",
  ),
  Recipe(
    name: "Guacamole with Tortilla Chips",
    cuisine: "Mexican",
    type: "Vegan",
    goal: "Balanced",
    imageAsset: "assets/Guacamole.jpg",
  ),

  // American Recipes
  Recipe(
    name: "Vegan Burger",
    cuisine: "American",
    type: "Vegan",
    goal: "Muscle Gain",
    imageAsset: "assets/vegan.jpg",
  ),
  Recipe(
    name: "Classic Cheeseburger",
    cuisine: "American",
    type: "Non-Vegetarian",
    goal: "Balanced",
    imageAsset: "assets/cheeseburger.jpg",
  ),
];

