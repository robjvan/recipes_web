import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  /// Builder for generic error dialog, used with API responses
// ignore: prefer_expression_function_bodies
  Future<void> buildErrorDialog(final String message) {
    return Get.defaultDialog(
      title: 'Error',
      content: Text(message),
      // TODO(Rob): Add some styling to the error dialog
    );
  }
}
