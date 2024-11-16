// recipe_data.dart

class Recipe {
  final String name;
  final String cuisine;
  final String type;
  final String imageAsset;

  Recipe({
    required this.name,
    required this.cuisine,
    required this.type,
    required this.imageAsset,
  });
}

final List<Recipe> recipes = [
  // Italian Recipes
  Recipe(
    name: "Spaghetti Carbonara",
    cuisine: "Italian",
    type: "Non-Vegetarian",
    imageAsset: "assets/carbonara.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Vegetarian Lasagna",
    cuisine: "Italian",
    type: "Vegetarian",
    imageAsset: "assets/VegetableLasagna.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Margherita Pizza",
    cuisine: "Italian",
    type: "Vegetarian",
    imageAsset: "assets/pizza.jpg", // Image from assets folder
  ),

  // Chinese Recipes
  Recipe(
    name: "Vegetable Stir Fry",
    cuisine: "Chinese",
    type: "Vegetarian",
    imageAsset: "assets/Vegetablefry.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Kung Pao Chicken",
    cuisine: "Chinese",
    type: "Non-Vegetarian",
    imageAsset: "assets/kungpao.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Sweet and Sour Pork",
    cuisine: "Chinese",
    type: "Non-Vegetarian",
    imageAsset: "assets/Sweet.jpg", // Image from assets folder
  ),

  // Indian Recipes
  Recipe(
    name: "Paneer Butter Masala",
    cuisine: "Indian",
    type: "Vegetarian",
    imageAsset: "assets/Masala.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Chicken Tikka Masala",
    cuisine: "Indian",
    type: "Non-Vegetarian",
    imageAsset: "assets/tikka.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Dal Tadka",
    cuisine: "Indian",
    type: "Vegan",
    imageAsset: "assets/Dal.jpg", // Image from assets folder
  ),

  // Mexican Recipes
  Recipe(
    name: "Tacos",
    cuisine: "Mexican",
    type: "Non-Vegetarian",
    imageAsset: "assets/Tacos.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Vegetarian Quesadilla",
    cuisine: "Mexican",
    type: "Vegetarian",
    imageAsset: "assets/Quesadillas.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Guacamole with Tortilla Chips",
    cuisine: "Mexican",
    type: "Vegan",
    imageAsset: "assets/Guacamole.jpg", // Image from assets folder
  ),

  // American Recipes
  Recipe(
    name: "Vegan Burger",
    cuisine: "American",
    type: "Vegan",
    imageAsset: "assets/vegan.jpg", // Image from assets folder
  ),
  Recipe(
    name: "Classic Cheeseburger",
    cuisine: "American",
    type: "Non-Vegetarian",
    imageAsset: "assets/cheeseburger.jpg", // Image from assets folder
  ),
];
