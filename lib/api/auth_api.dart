import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:recipes_web/models/access_token.dart';
import 'package:recipes_web/pages/login_screen/dto/sign_in.dto.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';
import 'package:recipes_web/pages/signup_screen/dto/sign-up.dto.dart';
import 'package:recipes_web/providers/auth_api_provider.dart';
import 'package:recipes_web/providers/recipes_api_provider.dart';

class AuthAPI {
  final AuthAPIProvider _authAPIProvider = AuthAPIProvider();
  final AuthController _authController = Get.put(AuthController());
  final ApiStateController _apiState = Get.put(ApiStateController());

  Future<void> _buildErrorDialog(final String message) => Get.defaultDialog(
        title: 'Error',
        content: Text(message),
        // TODO(Rob): Add some styling to the error dialog
      );

  /// Sign in an existing user
  Future<void> signIn(final SignInDto signInCredentials) async {
    _apiState.setLoadingState(true);
    late http.Response response;

    try {
      response = await _authAPIProvider.signIn(signInCredentials);

      if (response.statusCode == 201) {
        final AuthToken json = AuthToken.fromJson(jsonDecode(response.body));

        // Parse and store authToken
        final String parsedToken = json.token;
        _authController.saveToken(parsedToken);

        /// Navigate to Dashboard
        await Get.off(DashboardScreen.new);
      } else if (response.statusCode == 404) {
        await _buildErrorDialog(
          'Could not connect to server, please try again later',
        );
      } else if (response.statusCode == 500) {
        await _buildErrorDialog('Server error, please try again later');
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        await _buildErrorDialog(
          'Invalid username or password, please try again',
        );
      }
      _apiState.setLoadingState(false);
    } on Exception catch (err) {
      await _buildErrorDialog(
        'Could not connect to server, please try again later',
      );
      debugPrint(err.toString());
      _apiState.setLoadingState(false);
    }
  }

  Future<dynamic> signUp(final SignUpDto signupCredentials) async {
    _apiState.setLoadingState(true);
    late http.Response response;

    
  }
}
