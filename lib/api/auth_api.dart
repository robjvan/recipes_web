import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/api/providers/auth_api_provider.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:recipes_web/models/access_token.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';
import 'package:recipes_web/pages/login_screen/dto/sign_in.dto.dart';
import 'package:recipes_web/pages/register_screen/dto/sign-up.dto.dart';
import 'package:recipes_web/widgets/custom_dialogs.dart';

class AuthAPI {
  final AuthAPIProvider _authAPIProvider = AuthAPIProvider();
  final AuthController _authController = Get.put(AuthController());
  final ApiStateController _apiState = Get.put(ApiStateController());

  /// Sign in an existing user
  Future<void> signIn(final SignInDto signInCredentials) async {
    _apiState.setLoadingState(true);
    late http.Response response;

    try {
      response = await _authAPIProvider.signIn(signInCredentials);

      switch (response.statusCode) {
        case 201:
          final AuthToken json = AuthToken.fromJson(jsonDecode(response.body));

          // Parse and store authToken
          final String parsedToken = json.token;
          _authController.saveToken(parsedToken);

          /// Navigate to Dashboard
          await Get.off(DashboardScreen.new);
          break;
        case 400:
        case 401:
          await CustomDialogs().buildErrorDialog(
            'Invalid username or password, please try again',
          );
          break;
        case 404:
          await CustomDialogs().buildErrorDialog(
            'Could not connect to server, please try again later',
          );
          break;
        case 500:
          await CustomDialogs()
              .buildErrorDialog('Server error, please try again later');
          break;
      }
      _apiState.setLoadingState(false);
    } on Exception catch (err) {
      await CustomDialogs().buildErrorDialog(
        'Could not connect to server, please try again later',
      );
      debugPrint(err.toString());
      _apiState.setLoadingState(false);
    }
  }

  /// Check if username already exists in the DB
  Future<bool> checkUsername(final String username) async {
    _apiState.setLoadingState(true);
    http.Response response;

    try {
      response = await _authAPIProvider.checkUsername(username);
      switch (response.statusCode) {
        case 200:
        case 201:
          if (response.body == 'true') {
            return true;
          } else {
            return false;
          }
        case 400:
        case 401:
          break;
        case 404:
          await CustomDialogs().buildErrorDialog(
            'Could not connect to server, please try again later',
          );
          break;
        case 500:
          await CustomDialogs()
              .buildErrorDialog('Server error, please try again later');
          break;
      }
    } on Exception catch (err) {
      await CustomDialogs().buildErrorDialog(
        'Could not connect to the server, please try again later.',
      );
      debugPrint(err.toString());
    }
    return false;
  }

  /// Sign up as a new user
  Future<dynamic> signUp(final SignUpDto signupCredentials) async {
    _apiState.setLoadingState(true);
    // late http.Response response;

    /// Check if username already exists in DB
    bool userAlreadyExists = await checkUsername(signupCredentials.username);

    if (userAlreadyExists) {
      await Get.defaultDialog(
        content: const Text(
          'User account with that email address already exists',
        ),
      );
    } else {
      // TODO(Rob): Finish Signup method

    }
  }
}
