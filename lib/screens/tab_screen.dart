import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorite_meal.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';
import '../provider/meals_provider.dart';
import '../provider/filter_provider.dart';
import 'categories.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabScreen> {
  int _currentIndexPage = 0;
  String screenTitle = 'Meals App';
  final List<Meal> _favoriteList = [];
  _setPageIndex(index) {
    setState(() {
      _currentIndexPage = index;
    });
  }

  void _showSnackbar(message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        duration: const Duration(microseconds: 300),
        content: Text(message),
      ),
    );
  }

  void _onSelectFavourite(Meal meal) {
    bool isFavorite = _favoriteList.contains(meal);
    if (isFavorite) {
      setState(() {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        _favoriteList.remove(meal);
      });
      _showSnackbar('not Favorite');
    } else {
      setState(() {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        _favoriteList.add(meal);
      });
      _showSnackbar('Favorite');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ScaffoldMessenger.of(context).dispose();
  }

  void _setScreen(String screenName) async {
    var returnedValue;
    Navigator.of(context).pop();
    if (screenName == 'Meals') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const TabScreen(),
        ),
      );
    } else if (screenName == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (BuildContext context) => Filters(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    // final prodiverMealsContent = ref.watch(mealProvider);
    // final activeFilter = ref.watch(filterProdiver);
    // final filteredMeals = prodiverMealsContent
    //     .where((element) =>
    //         element.isGlutenFree == activeFilter[Filter.isGlutenFree])
    //     .toList();
    // print(activeFilter[Filter.isGlutenFree]);
    Widget mainContent = Categories(
      mealList: ref.watch(filteredMealList),
      onSelectFavourite: _onSelectFavourite,
    );
    if (_currentIndexPage == 1) {
      // print(favouriteMeals);
      mainContent = Meals(
        mealList: favouriteMeals,
        ScreenTitle: '',
        onSelectFavourite: _onSelectFavourite,
      );
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      drawer: MainDrawer(
        setScreen: _setScreen,
      ),
      body: mainContent,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Filters',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Meals'),
        ],
        onTap: (index) => _setPageIndex(index),
      ),
    );
  }
}
