import 'package:flutter/material.dart';
import 'package:recipes_web/widgets/navigation_drawer/navigation.drawer.dart';

class RecipesScreen extends StatelessWidget {
  static String routeName = '/recipes';

  const RecipesScreen({super.key});

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
                Text('Hello from RecipesScreen'),
              ],
            ),
          ),
        ),
      );
}
