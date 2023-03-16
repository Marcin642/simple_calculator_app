import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/views/buttons_grid.dart';
import 'package:calculator_app/views/output_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kTextColor,
            ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: OutputWidget(),
            ),
          ),
          Expanded(
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonsGrid(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
