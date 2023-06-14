import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_meal.dart';

class MealDetailScreen extends ConsumerWidget {
  final Meal mealInfo;
  final void Function(Meal meal) onSelectFavourite;
  const MealDetailScreen({
    super.key,
    required this.mealInfo,
    required this.onSelectFavourite,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isMealFavored = favouriteMeals.contains(mealInfo);
    Widget mainContent = Scaffold(
      appBar: AppBar(
        title: const Text('Meal detail'),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleFavouriteMeal(mealInfo);
              if (wasAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('favourite'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('not favourite'),
                  ),
                );
              }
            },
            icon: Icon(isMealFavored ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                mealInfo.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ...mealInfo.ingredients.map((item) {
                return Text(
                  item,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color.fromARGB(255, 119, 116, 116),
                      ),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ...mealInfo.steps.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    return mainContent;
  }
}
