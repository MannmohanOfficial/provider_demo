import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/authProvider/auth_provider.dart';
import 'package:provider_demo/providers/common/universal_provider.dart';
import 'package:provider_demo/providers/userProvider/user_provider.dart';
import 'package:provider_demo/views/auth/login_view.dart';
import 'package:provider_demo/views/auth/signup_view.dart';
import 'package:provider_demo/views/home/home_view.dart';
import 'package:provider_demo/views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UniversalProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const SplashView(),
          "/login": (context) => const LoginView(),
          "/register": (context) => const SignupView(),
          "/home": (context) => const HomeView(),
        },
        initialRoute: ('/'),
      ),
    );
  }
}
