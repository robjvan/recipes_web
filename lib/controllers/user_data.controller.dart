import 'package:get/get.dart';

import 'package:recipes_web/models/recipe.model.dart';

class UserDataController extends GetxController {
  // TODO(Rob): Download DB to local list for on-device processing
  // TODO(Rob): When an action is taken, update both the local lsit and backend DB
  
  final RxList<Recipe> _userRecipes = <Recipe>[].obs;
  List<Recipe> get userRecipes => _userRecipes;

  void addRecipe(final Recipe recipe) {
    _userRecipes.add(recipe);
  }

  void removeRecipeById(final int recipeId) {
    _userRecipes.removeWhere((final Recipe recipe) => recipe.id == recipeId);
  }

  void wipeRecipes() {
    _userRecipes.clear();
  }
}
