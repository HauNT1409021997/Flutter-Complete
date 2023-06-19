import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal mealItem;
  final void Function(Meal meal) onSelectFavourite;
  const MealItem({
    super.key,
    required this.mealItem,
    required this.onSelectFavourite,
  });

  String get getMealComplexity {
    return mealItem.complexity.name[0].toUpperCase() +
        mealItem.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealItem.affordability.name[0].toUpperCase() +
        mealItem.affordability.name.substring(1);
  }

  void _transistToMealDetail(BuildContext context, Meal mealItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          mealInfo: mealItem,
          onSelectFavourite: onSelectFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mealItemContent = Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _transistToMealDetail(context, mealItem),
        child: Stack(
          children: [
            Hero(
              tag: mealItem.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItem.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  width: double.infinity,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        mealItem.title,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '${mealItem.duration} min',
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.work,
                            label: getMealComplexity,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.attach_money,
                            label: affordabilityText,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
    return mealItemContent;
  }
}
