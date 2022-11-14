import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';

// import 'package:recipes_web/pages/home_screen.dart';
// import 'package:recipes_web/pages/loading_screen.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/recipes_screen/recipes_screen.dart';
import 'package:recipes_web/pages/settings_screen/settings_screen.dart';
import 'package:recipes_web/pages/shoppinglist_screen/shoppinglist_screen.dart';

// Store<AppState> globalStore;

Future<bool> isRooted() async {
  final bool isRooted = await FlutterJailbreakDetection.jailbroken;
  // bool developerMode = await FlutterJailbreakDetection.developerMode;
  const bool isDebugging = !kReleaseMode;

  if (isDebugging) {
    debugPrint('Device is rooted?  $isRooted');
    if (isRooted) debugPrint('Ignoring root: developer mode detected');
    return false;
  }

  return isRooted;
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // initialRoute: LoadingScreen.routeName, //TODO: Add load logic
      initialRoute: LoginScreen.routeName,
      routes: <String, WidgetBuilder>{
        DashboardScreen.routeName: (final BuildContext ctx) =>
            const DashboardScreen(),
        LoginScreen.routeName: (final BuildContext ctx) => const LoginScreen(),
        RecipesScreen.routeName: (final BuildContext ctx) =>
            const RecipesScreen(),
        SettingsScreen.routeName: (final BuildContext ctx) =>
            const SettingsScreen(),
        ShoppingListScreen.routeName: (final BuildContext ctx) =>
            const ShoppingListScreen(),
        // LoadingScreen.routeName: (ctx) => const LoadingScreen(),
      },
    );
  }
}
