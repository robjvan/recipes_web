import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_web/api/auth_api.dart';
import 'package:recipes_web/config/config.dart';
import 'package:recipes_web/controllers/password_visibility.controller.dart';
import 'package:recipes_web/pages/login_screen/dto/sign_in.dto.dart';
import 'package:recipes_web/pages/register_screen/register_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildUsernameField(usernameController),
            _buildPasswordField(passwordController),
            const SizedBox(height: 32),
            _buildLoginButton(usernameController, passwordController),
            const SizedBox(height: 8),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildLoginButton(
    final TextEditingController usernameController,
    final TextEditingController passwordController,
  ) {
    final AuthAPI authAPI = AuthAPI();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 60),
        maximumSize: const Size(200, 60),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          await authAPI.signIn(
            SignInDto(
              username: usernameController.text,
              password: passwordController.text,
              platform: await Config().getPlatform(),
            ),
          );
        }
      },
    );
  }

  TextButton _buildSignupButton() {
    return TextButton(
      onPressed: () => Get.off(RegisterScreen.new),
      style: TextButton.styleFrom(
        minimumSize: const Size(200, 40),
        maximumSize: const Size(200, 40),
      ),
      child: const Text('Register'),
    );
  }

  TextFormField _buildUsernameField(
    final TextEditingController usernameController,
  ) {
    final GetStorage settingsBox = GetStorage();
    usernameController.text = settingsBox.read('lastUsername') ?? '';

    return TextFormField(
      controller: usernameController,
      validator: (final String? value) {
        if (value!.isEmpty) {
          return 'Username cannot be empty';
        } else if (!value.isEmail) {
          return 'Username must be a valid email address';
        }
        return null;
      },
      onChanged: (final String value) =>
          settingsBox.write('lastUsername', value),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(),
    );
  }

  Obx _buildPasswordField(final TextEditingController passwordController) {
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
