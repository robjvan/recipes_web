import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:platform_plus/platform_plus.dart';
import 'package:recipes_web/pages/dashboard_screen/dashboard_screen.dart';

// import 'package:recipes_web/pages/home_screen.dart';
// import 'package:recipes_web/pages/loading_screen.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:recipes_web/pages/recipes_screen/recipes_screen.dart';
import 'package:recipes_web/pages/settings_screen/settings_screen.dart';
import 'package:recipes_web/pages/shoppinglist_screen/shoppinglist_screen.dart';
import 'package:recipes_web/utils/translations.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PlatformPlus.platform.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(final BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en', 'US'),
      title: 'App Title',
      translations: MyTranslations(), 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: LoadingScreen.routeName, //TODO: Add load logic
      initialRoute: LoginScreen.routeName,
      getPages: [
        GetPage<dynamic>(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage<dynamic>(
          name: DashboardScreen.routeName,
          page: () => const DashboardScreen(),
        ),
        GetPage<dynamic>(
          name: RecipesScreen.routeName,
          page: () => const RecipesScreen(),
        ),
        GetPage<dynamic>(
          name: SettingsScreen.routeName,
          page: () => const SettingsScreen(),
        ),
        GetPage<dynamic>(
          name: ShoppingListScreen.routeName,
          page: () => const ShoppingListScreen(),
        ),
      ],
    );
  }
}
