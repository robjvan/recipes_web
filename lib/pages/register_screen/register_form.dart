import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/api/auth_api.dart';
import 'package:recipes_web/config/config.dart';
import 'package:recipes_web/controllers/password_visibility.controller.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/register_screen/dto/sign-up.dto.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final Map<String, dynamic> controllers = <String, dynamic>{
      'username': usernameController,
      'password': passwordController,
    };

    final AuthAPI authAPI = AuthAPI();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildUsernameField(usernameController),
            _buildPasswordField(passwordController),
            _buildRegisterButton(authAPI, controllers),
            const SizedBox(height: 16),
            _buildCancelButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(final TextEditingController usernameController) =>
      TextFormField(
        controller: usernameController,
        validator: (final String? value) {
          if (value!.isEmpty) {
            return 'Email address cannot be empty';
          } else if (!value.isEmail) {
            return 'Email must be a valid email address';
          }
          return null;
        },
      );

  Widget _buildRegisterButton(
    final AuthAPI authAPI,
    final Map<String, dynamic> controllers,
  ) =>
      ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await authAPI.signUp(
              SignUpDto(
                username: controllers['username'].text,
                password: controllers['password'].text,
                platform: await Config().getPlatform(),
              ),
            );
          }
        },
        child: const Text('Register'),
      );

  Widget _buildCancelButton() {
    return TextButton(
      onPressed: () => Get.off(() => const LoginScreen()),
      child: const Text('Cancel'),
    );
  }

  Widget _buildPasswordField(final TextEditingController passwordController) {
    final PasswordVisibiltyController passwordVisibilty = Get.put(
      PasswordVisibiltyController(),
    );

    return Obx(
      () => TextFormField(
        controller: passwordController,
        validator: (final String? value) {
          if (value!.isEmpty) {
            return 'Password cannot be empty';
          }
          return null;
        },
        obscureText: passwordVisibilty.obscurePassword,
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: passwordVisibilty.toggleVisibility,
            icon: passwordVisibilty.obscurePassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
      ),
    );
  }
}
