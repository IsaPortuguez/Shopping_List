import 'package:flutter/material.dart';

enum Category {
  vegetables,
  fruits,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  drinks,
  hygiene,
  other,
}

class CategoryData {
  const CategoryData({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;
}

const categoryData = {
  Category.vegetables: CategoryData(
    title: 'Vegetables',
    icon: Icons.eco,
    color: Colors.green,
  ),
  Category.fruits: CategoryData(
    title: 'Fruits',
    icon: Icons.apple,
    color: Colors.pink,
  ),
  Category.meat: CategoryData(
    title: 'Meat',
    icon: Icons.set_meal,
    color: Colors.red,
  ),
  Category.dairy: CategoryData(
    title: 'Dairy',
    icon: Icons.local_drink,
    color: Colors.blue,
  ),
  Category.carbs: CategoryData(
    title: 'Carbs',
    icon: Icons.bakery_dining,
    color: Colors.orange,
  ),
  Category.sweets: CategoryData(
    title: 'Sweets',
    icon: Icons.cookie,
    color: Colors.purple,
  ),
  Category.spices: CategoryData(
    title: 'Spices',
    icon: Icons.soup_kitchen,
    color: Colors.brown,
  ),
  Category.convenience: CategoryData(
    title: 'Convenience',
    icon: Icons.fastfood,
    color: Colors.indigo,
  ),
  Category.drinks: CategoryData(
    title: 'Drinks',
    icon: Icons.emoji_food_beverage,
    color: Colors.cyan,
  ),
  Category.hygiene: CategoryData(
    title: 'Hygiene',
    icon: Icons.clean_hands,
    color: Colors.teal,
  ),
  Category.other: CategoryData(
    title: 'Other',
    icon: Icons.inventory_2,
    color: Colors.grey,
  ),
};
