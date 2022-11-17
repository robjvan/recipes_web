// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
// import 'package:recipes_web/providers/recipes_api_provider.dart';

class RecipesAPI {
  // final RecipesAPIProvider _recipesAPIProvider = RecipesAPIProvider();
  final AuthController authController = Get.put(AuthController());
  final ApiStateController apiState = Get.put(ApiStateController());

  /// Builder for generic error dialogs, used with API responses
  // ignore: prefer_expression_function_bodies
  Future<Widget> _buildErrorDialog(final String message) async {
    return await Get.defaultDialog(
      title: 'Error',
      content: Text(message),
    );
  }
      

  /// Add new recipe to the DB
  void addRecipe() {
    // TODO(Rob): Build add recipe logic
  }

  /// Remove recipe from the DB
  void removeRecipe() {
    // TODO(Rob): Build remove recipe logic
  }

  /// Update existing recipe
  void updateRecipe() {
    // TODO(Rob): Build update recipe logic
  }
}
