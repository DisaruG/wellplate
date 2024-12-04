import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash/splash_screen.dart'; // Import the SplashScreen
import 'core/apptheme.dart'; // Import the AppTheme class
import 'providers/recipe_filter_provider.dart'; // Import RecipeFilterProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeFilterProvider()),
        // Add more providers here as needed
      ],
      child: MaterialApp(
        title: 'WellPlate',
        theme: AppTheme.lightTheme, // Use the lightTheme defined in AppTheme
        debugShowCheckedModeBanner: false, // Hide the debug banner
        home: const SplashScreen(), // SplashScreen will be the initial screen
      ),
    );
  }
}
