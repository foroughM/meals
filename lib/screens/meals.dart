import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? const Text('No meals added')
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: meals[index],
                  onMealClicked: () => _selectMeal(context, meals[index]),
                );
              },
            ),
    );
  }
}
