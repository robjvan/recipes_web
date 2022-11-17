import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/config/config.dart' as config;
import 'package:recipes_web/models/dto/sign_in.dto.dart';

@immutable
class RecipesAPIProvider {
  final String _apiUrl = '/api/v1';
  final String _authUrl = '/auth';

  Future<http.Response> signIn(final SignInDto signInCredentials) {
    // build request using sign in credentials, send off to API
    final Uri signInUrl = config.getAPIUrl().resolve('$_authUrl/signin');

    return http.post(
      signInUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': signInCredentials.username,
        'password': signInCredentials.password,
        'platform': signInCredentials.platform,
      }),
    );
  }
}
