import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/api/auth_api.dart';
import 'package:recipes_web/config/config.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/models/dto/sign_in.dto.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final ApiStateController apiState = Get.put(ApiStateController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue[50]),
        width: sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildHeaderWidget(context),
            const SizedBox(height: 32),
            Obx(
              () => apiState.isLoading.value
                  ? _buildProgressIndicator()
                  : _buildLoginForm(),
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

  Widget _buildLoginForm() {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthAPI authAPI = AuthAPI();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Username (email address) field
            TextFormField(
              controller: usernameController,
              validator: (final String? value) {
                if (value!.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(),
            ),
            // Password Field
            TextFormField(
              controller: passwordController,
              validator: (final String? value) {
                if (value!.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(),
            ),
            /// Login button
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await authAPI.signIn(
                    signInCredentials: SignInDto(
                      username: usernameController.text,
                      password: passwordController.text,
                      platform: await Config().getPlatform(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() => const CircularProgressIndicator(
      // TODO(Rob): Add some styling to the indicator
      );
}
