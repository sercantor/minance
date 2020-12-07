import 'package:minance/providers/navigation_provider.dart';
import 'package:minance/widgets/bottom_navigation.dart';
import 'package:minance/widgets/expense_list_view.dart';
import 'package:minance/widgets/floating_action_add.dart';
import 'package:flutter/material.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/stat_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final _tabs = [
      Center(child: ExpenseListView()),
      Center(child: BarChartSample1()),
    ];

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
      //TODO: this should be handled differently, clean up the mess.
      body: _tabs[navigationProvider.selectedIndex],
    );
  }
}
