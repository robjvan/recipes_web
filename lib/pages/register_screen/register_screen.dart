import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/pages/register_screen/register_form.dart';

@immutable
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String routeName = '/register';

  @override
  Widget build(final BuildContext context) {
    final double sw = Get.width;

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
            RegisterForm()
          ],
        ),
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

}
