import 'package:minance/widgets/bottom_navigation.dart';
import 'package:minance/widgets/expense_list_view.dart';
import 'package:minance/widgets/floating_action_add.dart';
import 'package:flutter/material.dart';
import 'package:minance/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'minance',
          style: TextStyles.headerTextStyle,
        ),
        shadowColor: Colors.black12,
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionAdd(),
      body: ExpenseListView(),
    );
  }
}
