import 'package:flutter/material.dart';
import 'components/my_home_page.dart';
import 'models/theme.dart';

main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: appTheme,
    );
  }
}
