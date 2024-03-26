import "package:flutter/material.dart";
import "package:meals_app/data/dummy_data.dart";
import "package:meals_app/models/category.dart";
import "package:meals_app/models/meal.dart";
import "package:meals_app/screens/meals_screen.dart";
import "package:meals_app/widgets/category_grid_item.dart";

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //another method of availableCategories.map((category) => category).toList()
        for (final category in availableCategories)
          CategorysGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
