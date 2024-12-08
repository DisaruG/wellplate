import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For making HTTP requests

class ApiService {
  // Replace with your actual API key
  static const String _apiKey = 'a948bcdd551446c480541e614ecaa62e'; // Paste your API key here
  static const String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  // Method to fetch recipes based on ingredients
  Future<List<String>> fetchRecipes(List<String> ingredients) async {
    // Build the query string using ingredients
    String query = ingredients.join(',');

    final response = await http.get(
      Uri.parse('$_baseUrl?query=$query&apiKey=$_apiKey'),
    );

    // If the server returns a successful response
    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = jsonDecode(response.body);
      List<String> recipes = [];
      // Extract recipe names (or modify as per your API response structure)
      for (var recipe in data['results']) {
        recipes.add(recipe['title']);
      }
      return recipes;
    } else {
      // If the server did not return a 200 response, throw an error.
      throw Exception('Failed to load recipes');
    }
  }
}
