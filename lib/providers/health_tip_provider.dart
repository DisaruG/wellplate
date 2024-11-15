import 'dart:math';

class HealthTipProvider {
  final List<String> healthTips = [
    "Drink more water daily.",
    "Exercise for at least 30 minutes a day.",
    "Eat more fruits and vegetables.",
    "Sleep for 7-8 hours every night.",
    "Take breaks while working to avoid burnout.",
    "Practice mindfulness and reduce stress.",
    "Avoid processed foods and sugary drinks.",
    "Get regular health check-ups."
  ];

  // Method to get a random health tip
  String getRandomTip() {
    final random = Random();
    return healthTips[random.nextInt(healthTips.length)];
  }
}
