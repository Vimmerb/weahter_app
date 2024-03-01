import 'package:flutter/material.dart';
import 'package:weather_test_app/ui/screens/home_page.dart';
import 'package:weather_test_app/helpers/preferences/shared_preferences.dart';
import 'package:weather_test_app/ui/screens/login_page.dart';
import 'package:weather_test_app/ui/screens/main_page.dart';
import 'package:weather_test_app/ui/screens/register_page.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация UserPreferences
  await UserPreferences().init();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: ((context, state) => MyHomePage()),
      routes: <RouteBase>[
        GoRoute(
          path: 'main',
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          path: 'register',
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
    );
  }
}
