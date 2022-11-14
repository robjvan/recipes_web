import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

// import 'package:recipes_web/pages/home_screen.dart';
// import 'package:recipes_web/pages/loading_screen.dart';
import 'package:recipes_web/pages/login_screen/login_screen.dart';
import 'package:redux/redux.dart';

// Store<AppState> globalStore;

Future<bool> isRooted() async {
  bool isRooted = await FlutterJailbreakDetection.jailbroken;
  // bool developerMode = await FlutterJailbreakDetection.developerMode;
  bool isDebugging = !kReleaseMode;

  if (isDebugging) {
    print('Device is rooted?  $isRooted');
    if (isRooted) print('Ignoring root: developer mode detected');
    return false;
  }

  return isRooted;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      routes: {
        // HomeScreen.routeName: (ctx) => const HomeScreen(),
        LoginScreen.routeName: (final BuildContext ctx) => const LoginScreen(),
        // LoadingScreen.routeName: (ctx) => const LoadingScreen(),
      },
    );
  }
}
