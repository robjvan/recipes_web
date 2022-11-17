import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/api/auth_api.dart';
import 'package:recipes_web/api/users_api.dart';
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
          _buildHeaderWidget(context),
          const SizedBox(height: 32),
          _buildRegisterForm(),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(final BuildContext context) => Text(
        'Register',
        style: TextStyle(
          fontSize: 32,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildRegisterForm() {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final AuthAPI authAPI = AuthAPI();
    final UsersAPI usersAPI = UsersAPI();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: usernameController,
              validator: (final String? value) {
                debugPrint('');
                if (value!.isEmpty) {
                  return 'Email address cannot be empty';
                } else if (!value.isEmail) {
                  return 'Email must be a valid email address';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  /// Check if username already exists in DB
                  final bool result =
                      await authAPI.checkUsername(usernameController.text);

                  ///

                  if (result) {
                    await Get.defaultDialog(
                      content: const Text(
                        'User account with that email address already exists',
                      ),
                    );
                  } else {
                    await authAPI.signUp(
                      SignUpDto(
                        username: usernameController.text,
                        password: passwordController.text,
                        platform: await Config().getPlatform(),
                      ),
                    );
                  }
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
