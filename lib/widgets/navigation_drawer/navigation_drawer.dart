import 'package:flutter/material.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/recipes_screen/recipes_screen.dart';
import 'package:recipes_web/pages/settings_screen/settings_screen.dart';
import 'package:recipes_web/pages/shoppinglist_screen/shoppinglist_screen.dart';
import 'package:recipes_web/widgets/navigation_drawer/widgets/navigation_row.dart';

class NavigationDrawer extends Drawer {
  const NavigationDrawer({super.key});

  @override
  Widget build(final BuildContext context) => Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                NavigationRow(
                  navRoute: DashboardScreen.routeName,
                  iconData: Icons.menu,
                  label: 'Dashboard',
                ),
                NavigationRow(
                  navRoute: RecipesScreen.routeName,
                  iconData: Icons.cookie_outlined,
                  label: 'Recipes',
                ),
                NavigationRow(
                  navRoute: ShoppingListScreen.routeName,
                  iconData: Icons.shopping_bag_outlined,
                  label: 'Shopping List',
                ),
                Expanded(child: Container()),
                NavigationRow(
                  navRoute: SettingsScreen.routeName,
                  iconData: Icons.settings_outlined,
                  label: 'Settings',
                ),
                buildLogoutButton(context),
              ],
            ),
          ),
        ),
      );
}

Widget buildLogoutButton(final BuildContext context) => TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          LoginScreen.routeName,
        );
      },
      child: const Text('Logout'),
    );
