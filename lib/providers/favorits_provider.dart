import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealProvider extends StateNotifier<List<Meal>> {
  FavoriteMealProvider() : super([]);

  bool toggelMealFavoriteState(Meal meal) {
    var isFavorite = state.contains(meal);

    if (isFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriesProvider =
    StateNotifierProvider<FavoriteMealProvider, List<Meal>>(
  (ref) => FavoriteMealProvider(),
);
