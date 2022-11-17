import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/config/config.dart' as config;
import 'package:recipes_web/pages/login_screen/dto/sign_in.dto.dart';
import 'package:recipes_web/pages/signup_screen/dto/sign-up.dto.dart';

//* The purpose of an API Provider is to handle the direct communication with the DB.
//* It passes requests and returns the raw response without any sort of processing

@immutable
class AuthAPIProvider {
  final String _authUrl = '/auth';

  /// Sign in as an existing user
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

  /// Sign up a new user
  Future<http.Response> signUp(final SignUpDto signupCredentials) {
    final Uri signupUrl = config.getAPIUrl().resolve('$_authUrl/signup');

    return http.post(
      signupUrl,
      body: jsonEncode(
        <String, String>{
          'username': signupCredentials.username,
          'password': signupCredentials.password,
          'platform': signupCredentials.platform,
        },
      ),
    );
  }
}