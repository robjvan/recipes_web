import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/api/auth_api.dart';
import 'package:recipes_web/config/config.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/signup_screen/dto/sign-up.dto.dart';

@immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final double sw = Get.width;
    final ApiStateController apiState = Get.put(ApiStateController());

    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('Register'),
          _buildRegisterForm(),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final AuthAPI authAPI = AuthAPI();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await authAPI.signUp(
                    SignUpDto(
                      username: usernameController.text,
                      password: passwordController.text,
                      platform: await Config().getPlatform(),
                    ),
                  );
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Get.off(() => const LoginScreen()),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Build signup/register screen
