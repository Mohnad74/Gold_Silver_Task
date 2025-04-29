import 'package:flutter/material.dart';
import 'package:gold_silver_task/mainScreen.dart';
import 'package:gold_silver_task/network/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const Mainscreen(),
    );
  }
}
