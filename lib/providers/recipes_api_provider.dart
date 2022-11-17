import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/config/config.dart' as config;
import 'package:recipes_web/models/recipe.model.dart';

//* The purpose of an API Provider is to handle the direct communication with the DB.
//* It attaches an authToken to outgoing requests and returns the
//* raw response without any sort of processing.

@immutable
class RecipesAPIProvider {
  final String _apiUrl = '/api/v1';

  /// Save a new recipe to the DB
  Future<http.Response> saveRecipe(final Recipe newRecipe) {
    /// 1. Retrieve authToken from Get storage
    final AuthController authController = Get.find();
    final String authToken = authController.authToken;

    /// 2. Construct url
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/recipes');

    /// 3. Return API response with token attached as bearerToken
    return http.post(
      fetchUrl,
      headers: <String, String>{
        'Bearer-Token': authToken,
      },
      body: jsonEncode(newRecipe),
    );
  }

  /// Grab all recipes from the DB
  Future<http.Response> fetchAll() {
    /// 1. Retrieve authToken from Get storage
    final AuthController authController = Get.find();
    final String authToken = authController.authToken;

    /// 2. Construct url
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/recipes');

    /// 3. Return API response with token attached as bearerToken
    return http.get(
      fetchUrl,
      headers: <String, String>{
        'Bearer-Token': authToken,
      },
    );
  }

  /// Grab one recipe by ID
  Future<http.Response> fetchOneById(final int id) {
    /// 1. Retrieve authToken from Get storage
    final AuthController authController = Get.find();
    final String authToken = authController.authToken;

    /// 2. Construct url
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/recipes/$id');

    /// 3. Return API response with token attached as bearerToken
    return http.get(
      fetchUrl,
      headers: <String, String>{
        'Bearer-Token': authToken,
      },
    );
  }

  /// Update one recipe by ID
  Future<http.Response> updateRecipeById(final int id, final Recipe newData) {
    /// 1. Retrieve authToken from Get storage
    final AuthController authController = Get.find();
    final String authToken = authController.authToken;

    /// 2. Construct url
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/recipes/$id');

    /// 3. Return API response with token attached as bearerToken
    return http.post(
      fetchUrl,
      headers: <String, String>{
        'Bearer-Token': authToken,
      },
      body: jsonEncode(newData),
    );
  }

  /// Delete one recipe by ID
  Future<http.Response> deleteById(final int id) {
    /// 1. Retrieve authToken from Get storage
    final AuthController authController = Get.find();
    final String authToken = authController.authToken;

    /// 2. Construct url
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/recipes/$id');

    /// 3. Return API response with token attached as bearerToken
    return http.delete(
      fetchUrl,
      headers: <String, String>{
        'Bearer-Token': authToken,
      },
    );
  }
}
