import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: const VisualDensity(vertical: 0),
        scaffoldBackgroundColor:
            Colors.white, // Background color for all Scaffold widgets
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF004643),
        ),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}
