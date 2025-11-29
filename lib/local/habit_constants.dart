import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HabitConstants {
  static const List<String> weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  static const List<String> intervalType = [
    "Day",
    "Week",
    "Month",
  ];

  static List<HabitCategory> habitCategories = [
    HabitCategory(name: "Health", icon: IconlyLight.heart),
    HabitCategory(name: "Fitness", icon: Icons.fitness_center),
    HabitCategory(name: "Learning", icon: Icons.school),
    HabitCategory(name: "Productivity", icon: IconlyLight.work),
    HabitCategory(name: "Hobby", icon: Icons.palette),
    HabitCategory(name: "Social", icon: IconlyLight.user2),
    HabitCategory(name: "Finance", icon: IconlyLight.wallet),
    HabitCategory(name: "Other", icon: Icons.category),
  ];
}

// Create a model class and use it to store the habit category and icon data
class HabitCategory {
  final String name;
  final IconData icon;

  HabitCategory({required this.name, required this.icon});
}
