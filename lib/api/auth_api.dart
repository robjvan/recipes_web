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

class AuthAPI {
  final RecipesAPIProvider _recipesAPIProvider = RecipesAPIProvider();
  final AuthController authController = Get.put(AuthController());
  final ApiStateController apiState = Get.put(ApiStateController());

  Future<Widget> _buildErrorDialog(final String message) async =>
      await Get.defaultDialog(
        title: 'Error',
        content: Text(message),
        // TODO(Rob): Add some styling to the error dialog
      );

  /// Sign in an existing user
  Future<void> signIn({required final SignInDto signInCredentials}) async {
    apiState.setLoadingState(true);
    late http.Response response;

    try {
      response = await _recipesAPIProvider.signIn(signInCredentials);

      if (response.statusCode == 201) {
        final AuthToken json = AuthToken.fromJson(jsonDecode(response.body));

        // Parse and store authToken
        final String parsedToken = json.token;
        authController.saveToken(parsedToken);

        /// Navigate to Dashboard
        await Get.off(const DashboardScreen());
      } else if (response.statusCode == 404) {
        // throw "Could not connect" message
        await _buildErrorDialog(
          'Could not connect to server, please try again later',
        );

        // await Get.defaultDialog(
        //   title: 'Error',
        //   content:
        //       const Text('Could not connect to server, please try again later'),
        // );
      } else if (response.statusCode == 500) {
        // throw "Server error" message
        await _buildErrorDialog('Server error, please try again later');
        // await Get.defaultDialog(
        //   title: 'Error',
        //   content: const Text('Server error, please try again later'),
        // );
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        // throw invalid credentials message
        await _buildErrorDialog(
          'Invalid username or password, please try again',
        );
        // await Get.defaultDialog(
        //   title: 'Error',
        //   content: const Text('Invalid username or password, please try again'),
        // );
      }
      apiState.setLoadingState(false);
    } on Exception catch (err) {
      debugPrint(err.toString());
      // throw "Could not connect" message
      await _buildErrorDialog(
        'Could not connect to server, please try again later',
      );
      // await Get.defaultDialog(
      //   title: 'Server Error',
      //   content: const Text('Could not connect to server'),
      // );
      apiState.setLoadingState(false);
    }
  }
}
