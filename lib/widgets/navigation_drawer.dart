import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/recipes_screen/recipes_screen.dart';
import 'package:recipes_web/pages/settings_screen/settings_screen.dart';
import 'package:recipes_web/pages/shoppinglist_screen/shoppinglist_screen.dart';

class NavigationDrawer extends Drawer {
  const NavigationDrawer({super.key});

  @override
  Widget build(final BuildContext context) => Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _buildNavigationRow(
                  context,
                  navRoute: DashboardScreen.routeName,
                  iconData: Icons.menu,
                  label: 'Dashboard',
                ),
                _buildNavigationRow(
                  context,
                  navRoute: RecipesScreen.routeName,
                  iconData: Icons.cookie_outlined,
                  label: 'Recipes',
                ),
                _buildNavigationRow(
                  context,
                  navRoute: ShoppingListScreen.routeName,
                  iconData: Icons.shopping_bag_outlined,
                  label: 'Shopping List',
                ),
                Expanded(child: Container()),
                _buildNavigationRow(
                  context,
                  navRoute: SettingsScreen.routeName,
                  iconData: Icons.settings_outlined,
                  label: 'Settings',
                ),
                _buildLogoutButton(context),
              ],
            ),
          ),
        ),
      );

  Widget _buildLogoutButton(final BuildContext context) => TextButton(
        onPressed: () => Get.offAll(LoginScreen.new),
        child: const Text('Logout'),
      );

  Widget _buildNavigationRow(
    final BuildContext context, {
    required final String navRoute,
    required final IconData iconData,
    required final String label,
  }) =>
      TextButton(
        onPressed: () => Navigator.pushNamed(
          context,
          navRoute,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: <Widget>[
              Icon(iconData),
              const SizedBox(width: 16),
              Text(label),
              const Spacer(),
            ],
          ),
        ),
      );
}
