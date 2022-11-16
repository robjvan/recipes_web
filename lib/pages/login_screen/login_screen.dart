import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/api/recipes_api.dart';
import 'package:recipes_web/config/config.dart';
import 'package:recipes_web/controllers/api_state.controller.dart';
import 'package:recipes_web/models/dto/sign_in.dto.dart';
import 'package:recipes_web/providers/recipes_api_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final RecipesAPI recipesAPI = RecipesAPI(RecipesAPIProvider());
    final double sw = MediaQuery.of(context).size.width;
    final ApiStateController apiState = Get.put(ApiStateController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).splashColor),
        width: sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Recipes',
              style: TextStyle(
                fontSize: 32,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Obx(
              () => apiState.isLoading.value
                  ? const CircularProgressIndicator() // TODO(Rob): Add some style
                  : Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
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
                            ElevatedButton(
                              child: const Text('Login'),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await recipesAPI.signIn(
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
