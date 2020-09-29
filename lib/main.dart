import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:minance/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExpenseProvider>(
          create: (context) => ExpenseProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: HomePage(),
      ),
    );
  }
}
