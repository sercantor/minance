import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/expense_list_builder.dart';

class ExpenseListView extends StatefulWidget {
  @override
  _ExpenseListViewState createState() => _ExpenseListViewState();
}

class _ExpenseListViewState extends State<ExpenseListView> {
  final _expenseScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return (expenseProvider.expenseList.length != 0)
        ? Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _expenseScrollController,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Align(
                          child: Icon(
                            Icons.restore_from_trash,
                            size: 50.0,
                            color: Colors.redAccent,
                          ),
                        ),
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          expenseProvider.removeFromList(index);
                        },
                        child: expenseListBuilder(
                            context, index, expenseProvider.expenseList),
                      );
                    },
                    itemCount: expenseProvider.expenseList.length),
              ),
            ),
          )
        : Text(
            'No expenses added, yet.',
            style: TextStyles.subHeaderTextStyle,
          );
  }
}
