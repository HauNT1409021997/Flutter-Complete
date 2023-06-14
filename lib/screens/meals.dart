import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  final List<Meal> mealList;
  final String? ScreenTitle;
  final void Function(Meal meal) onSelectFavourite;
  const Meals({
    super.key,
    required this.mealList,
    this.ScreenTitle,
    required this.onSelectFavourite,
  });
  Widget renderData(BuildContext context, index) {
    return MealItem(
      mealItem: mealList.elementAt(index),
      onSelectFavourite: onSelectFavourite,
    );
  }

  @override
  Widget build(BuildContext context) {
    mealList.forEach((element) {
      print(element.title);
    });
    Widget content = SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No meals found',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'try selecting a different cateogry',
          )
        ],
      ),
    );
    if (mealList.isNotEmpty) {
      content =
          ListView.builder(itemCount: mealList.length, itemBuilder: renderData);
    }
    if (ScreenTitle == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreenTitle!),
      ),
      body: content,
    );
  }
}
