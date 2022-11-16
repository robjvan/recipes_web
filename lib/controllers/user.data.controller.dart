import 'package:get/get.dart';

import 'package:recipes_web/models/recipe.model.dart';

class UserDataController extends GetxController {
  final RxList<Recipe> _userRecipes = <Recipe>[].obs;
  List<Recipe> get userRecipes => _userRecipes;

  void addRecipe(Recipe recipe) {
    _userRecipes.add(recipe);
  }

  void removeRecipeById(final int recipeId) {
    _userRecipes.removeWhere((final Recipe recipe) => recipe.id == recipeId);
  }

  void wipeRecipes() {
    _userRecipes.clear();
  }
}
