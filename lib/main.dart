import 'package:depinflutter/di/di.dart';
import 'package:depinflutter/view/data_view.dart';
import 'package:depinflutter/view/display_data.dart';
import 'package:flutter/material.dart';

void main() {
  initModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const DataView(),
          '/output': (context) => const DisplayData(),
        });
  }
}
