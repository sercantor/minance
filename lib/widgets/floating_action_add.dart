import 'package:minance/widgets/show_expense_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';

class FloatingActionAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      //this onpressed should be opening alertdialog to ask for what kind of expense that you should use.
      onPressed: () {
        final expenseProvider =
            Provider.of<ExpenseProvider>(context, listen: false);
        return showDialog(
          context: context,
          builder: (_) {
            return ChangeNotifierProvider.value(
              value: expenseProvider,
              child: ShowExpenseDialog(),
            );
          },
        );
      },
    );
  }
}
