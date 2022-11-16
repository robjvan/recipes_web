import 'package:flutter/material.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';

  @override
  Widget build(final BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).splashColor),
        width: sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello from LoginScreen',
              style: TextStyle(
                fontSize: 32,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  DashboardScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
