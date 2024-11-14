import 'package:flutter/material.dart';
import 'package:wellplate/widgets/app_bar_widget.dart'; // Import the custom AppBar
import 'package:wellplate/widgets/bottom_nav_bar_widget.dart'; // Import the custom BottomNavigationBar

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false; // To manage theme state
  int _currentIndex = 0; // To track the selected tab index

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index; // Update the current tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: CustomAppBar(
          isDarkMode: isDarkMode,
          toggleTheme: toggleTheme, // Pass the theme toggle function to AppBar
        ),
        body: const Center(
          child: Text(
            'Welcome to the Dashboard',
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected, // Pass the tab selection handler to BottomNavBar
        ),
      ),
    );
  }
}
