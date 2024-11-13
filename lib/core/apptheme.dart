import 'package:flutter/material.dart';
import '../components/color.dart'; // Import the AppColors class from color.dart

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,  // Use the primaryColor from AppColors
      scaffoldBackgroundColor: AppColors.backgroundColor,  // Set the scaffold background to white
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: AppColors.secondaryColor),  // Use the secondaryColor from AppColors
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textColor), // Use the textColor for default text
      ),
    );
  }
}
