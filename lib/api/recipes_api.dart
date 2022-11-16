import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:recipes_web/models/access_token.dart';
import 'package:recipes_web/models/dto/sign_in.dto.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';
import 'package:recipes_web/providers/recipes_api_provider.dart';

class RecipesAPI {
  final RecipesAPIProvider _recipesAPIProvider;
  RecipesAPI(this._recipesAPIProvider);
  final AuthController authController = Get.put(AuthController());
  final ApiStateController apiState = Get.put(ApiStateController());

  /// Sign in an existing user
  Future<void> signIn({required final SignInDto signInCredentials}) async {
    apiState.setLoadingState(true);
    final http.Response response =
        await _recipesAPIProvider.signIn(signInCredentials);

    /// If response = OK, store auth token in Get store
    if (response.statusCode == 201) {
      final AuthToken json = AuthToken.fromJson(jsonDecode(response.body));

      // Parse and store authToken
      final String parsedToken = json.token;
      authController.saveToken(parsedToken);

      /// Navigate to Dashboard
      await Get.off(const DashboardScreen());
    } else if (response.statusCode == 404) {
      // throw "Could not connect" message
      await Get.defaultDialog(
        title: 'Error',
        content: const Text('Could not connect to server!'),
      );
    } else if (response.statusCode == 500) {
      // throw "Server errro" message
      await Get.defaultDialog(
        title: 'Error',
        content: const Text('Server error, please try again later'),
      );
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      // throw invalid credentials message
      await Get.defaultDialog(
        title: 'Error',
        content: const Text('Invalid username or password, please try again'),
      );
    }
    apiState.setLoadingState(false);
  }
}
