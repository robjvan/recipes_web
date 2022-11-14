import 'package:flutter/material.dart';
import 'package:recipes_web/widgets/navigation_drawer/navigation_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static String routeName = '/dashboard';
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: const NavigationDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Hello from DashboardScreen'),
                Text(
                    'The dashboard will have quick access to favorite recipes, shopping list, and fun insights about the user\'s collection, like how many recipes they have, how many they\'ve cooked, "It would take 35kg of butter to make all the cookies in your collection!", etc.'),
              ],
            ),
          ),
        ),
      );
}
