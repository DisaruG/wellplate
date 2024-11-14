import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellplate/screens/onboarding/onboarding_view.dart';
import 'package:wellplate/screens/home/home_screen.dart';
import '../../components/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  // Check if onboarding is completed
  _checkOnboardingStatus() async {
    await Future.delayed(const Duration(seconds: 3));  // Delay for splash screen

    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool("onboarding") ?? false;

    // Navigate to the appropriate screen
    if (onboardingCompleted) {
      if (!mounted) return;  // Check if widget is still mounted
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,  // Use primaryColor from AppColors
      body: Center(
        child: Text(
          'WellPlate',  // Display app name or logo here
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
