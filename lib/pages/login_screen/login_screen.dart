import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:recipes_web/controllers/user.data.controller.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final double sw = MediaQuery.of(context).size.width;
    final AuthController authController = Get.put(AuthController());

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
            Form(
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
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                /// 1. Ensure form data is valid
                if (formKey.currentState!.validate()) {
                  /// 2. Send user credentials to API
                  
                  
                  /// 3. If response = OK, store token in Get store
                  authController.saveToken(authToken)
                  /// 4. Navigate to Dashboard
                  Navigator.pushReplacementNamed(
                    context,
                    DashboardScreen.routeName,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
