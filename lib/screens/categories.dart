import 'package:meals_app/models/categoryData.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals.dart';
import '../data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../models/meal.dart';

class Categories extends StatelessWidget {
  final void Function(Meal meal) onSelectFavourite;
  final List<Meal> mealList;
  const Categories({
    required this.mealList,
    super.key,
    required this.onSelectFavourite,
  });
  // List<CategoryItem> renderList() {
  //   return mockDataList.map((item) {
  //     return CategoryItem(categoryItem: item);
  //   }).toList();
  // }

  void _selectScreen(BuildContext context, CategoryData categoryItem) {
    final filteredMeals = mealList
        .where((element) => element.categories.contains(categoryItem.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(
          ScreenTitle: 'Meals',
          mealList: filteredMeals,
          onSelectFavourite: onSelectFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(5),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            ...mockDataList.map((item) {
              return CategoryItem(
                categoryItem: item,
                pageNavigation: () {
                  _selectScreen(context, item);
                },
              );
            }),
            // for (var item in mockDataList) CategoryItem(categoryItem: item),
          ],
        ),
      ),
    );
  }
}
