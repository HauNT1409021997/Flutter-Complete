import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filter { isGlutenFree }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.isGlutenFree: false,
        });
  void setFilters(Map<Filter, bool> filters) {
    state = {...filters};
  }

  void setFilter(Filter filterCondtion, bool isActive) {
    state = {
      ...state,
      filterCondtion: isActive,
    };
  }
}

final filterProdiver = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filteredMealList = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilter = ref.watch(filterProdiver);
  return meals.where((element) {
    return (element.isGlutenFree == activeFilter[Filter.isGlutenFree]);
  }).toList();
});
