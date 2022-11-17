import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_web/api/providers/users_api_provider.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/widgets/custom_dialogs.dart';

class UsersAPI {
  final ApiStateController _apiState = Get.put(ApiStateController());
  final UsersAPIProvider _userAPIProvider = UsersAPIProvider();
}
