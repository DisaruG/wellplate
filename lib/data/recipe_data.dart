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

// Recipe data
final List<Recipe> recipes = [
  Recipe(
    name: "Spaghetti Carbonara (Weight Loss)",
    cuisine: "Italian",
    type: "Non-Vegetarian",
    goal: "Weight Loss",
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
    name: "Paneer Butter Masala",
    cuisine: "Indian",
    type: "Vegetarian",
    goal: "Low-Calorie",
    imageAsset: "assets/Masala.jpg",
  ),
  Recipe(
    name: "Tacos (Muscle Gain)",
    cuisine: "Mexican",
    type: "Non-Vegetarian",
    goal: "Muscle Gain",
    imageAsset: "assets/Tacos.jpg",
  ),
  Recipe(
    name: "Classic Cheeseburger",
    cuisine: "American",
    type: "Non-Vegetarian",
    goal: "Balanced",
    imageAsset: "assets/cheeseburger.jpg",
  ),
];
