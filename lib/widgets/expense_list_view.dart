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

    return (expenseProvider.expenseId.length != 0)
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
                        expenseProvider.removeFromAmountList(
                            index, expenseProvider.expenseId[index]);
                        expenseProvider.removeFromExpenseTypeList(
                            index, expenseProvider.expenseId[index]);
                        expenseProvider.removeMonthSpent(
                            index, expenseProvider.expenseId[index]);
                        expenseProvider.removeDaySpent(
                            index, expenseProvider.expenseId[index]);
                        expenseProvider.removeExpenseId(index);
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
