import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/expense_list_builder.dart';

class ExpenseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    return (expenseProvider.expenseAmountList.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
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
                        expenseProvider.subtractFromChartMap(index);
                        expenseProvider.removeFromAmountList(index);
                        expenseProvider.removeFromExpenseTypeList(index);
                        expenseProvider.removeDaySpent(index);
                        expenseProvider.removeMonthSpent(index);
                      },
                      child: expenseListBuilder(
                        context,
                        index,
                        expenseProvider.expenseTypeList,
                        expenseProvider.expenseAmountList,
                        expenseProvider.daySpent,
                        expenseProvider.expenseId,
                      ),
                    );
                  },
                  itemCount: expenseProvider.expenseId.length),
            ),
          )
        : Text(
            'No expenses added, yet.',
            style: TextStyles.subHeaderTextStyle,
          );
  }
}
