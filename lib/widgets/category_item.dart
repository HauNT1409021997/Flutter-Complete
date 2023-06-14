import 'package:flutter/material.dart';
import 'package:meals_app/models/categoryData.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryItem;
  final Function() pageNavigation;
  const CategoryItem(
      {super.key, required this.categoryItem, required this.pageNavigation});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pageNavigation,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(221, 67, 59, 221),
            Color.fromARGB(255, 32, 14, 113)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          categoryItem.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: categoryItem.color,
                backgroundColor: Colors.green[100],
              ),
        ),
      ),
    );
  }
}
