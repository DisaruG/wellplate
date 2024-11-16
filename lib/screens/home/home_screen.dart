import 'package:flutter/material.dart';
import 'package:wellplate/widgets/app_bar_widget.dart';
import 'package:wellplate/widgets/bottom_nav_bar_widget.dart';
import 'package:wellplate/widgets/daily_tip_card.dart'; // Import DailyTipCard
import 'package:wellplate/providers/health_tip_provider.dart'; // Import HealthTipProvider
import 'package:wellplate/widgets/recipe_input_buttons.dart'; // Import the RecipeInputButtons widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int _currentIndex = 0;
  String randomTip = ""; // Store the randomly selected health tip
  final HealthTipProvider healthTipProvider = HealthTipProvider(); // Instance of the provider

  @override
  void initState() {
    super.initState();
    // Get a random tip when the screen is initialized
    randomTip = healthTipProvider.getRandomTip();
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
          child: Column(
            children: [
              // Daily Health Tip
              DailyTipCard(tip: randomTip),
              const SizedBox(height: 16),
              // Recipe Input Buttons
              RecipeInputButtons(
                onCuisinePressed: () {
                  // Handle Cuisine button press
                },
                onTypePressed: () {
                  // Handle Type button press
                },
                onGoalPressed: () {
                  // Handle Goal button press
                },
                onFilterPressed: () {
                  // Handle Filter Recipes button press
                },
              ),
              // Additional content can go here...
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}
