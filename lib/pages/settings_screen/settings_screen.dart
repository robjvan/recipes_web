import 'package:flutter/material.dart';
import 'package:recipes_web/widgets/navigation_drawer/navigation.drawer.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = '/settings';

  const SettingsScreen({super.key});

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
                Text('Hello from SettingsScreen'),
              ],
            ),
          ),
        ),
      );
}
