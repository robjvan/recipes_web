import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/pages/login_screen/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';

  @override
  Widget build(final BuildContext context) {
    final double sw = Get.width;
    final ApiStateController apiState = Get.put(ApiStateController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildHeaderWidget(context),
            const SizedBox(height: 32),
            Obx(
              () => apiState.isLoading.value
                  ? _buildLoadingIndicator()
                  : const LoginForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderWidget(final BuildContext context) => Text(
        'Recipes',
        style: TextStyle(
          fontSize: 32,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildLoadingIndicator() => const CircularProgressIndicator(
      // TODO(Rob): Add some styling to the indicator
      );
}
