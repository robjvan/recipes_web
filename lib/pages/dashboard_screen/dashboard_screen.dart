import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_web/controllers/auth.controller.dart';
import 'package:recipes_web/widgets/navigation_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static String routeName = '/dashboard';
  @override
  Scaffold build(final BuildContext context) {
    final GetStorage box = GetStorage();
    final String authToken = box.read('authToken');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Text('Hello from DashboardScreen'),
              const Text(
                'The dashboard will have quick access to favorite recipes, shopping list, and fun insights about the user\'s collection, like how many recipes they have, how many they\'ve cooked, "It would take 35kg of butter to make all the cookies in your collection!", etc.',
              ),
              const SizedBox(height: 32),
              Text('AuthToken = ${box.read('authToken')}'),
            ],
          ),
        ),
      ),
    );
  }
}
