import 'package:minance/screens/expense_details.dart';
import 'package:minance/widgets/show_expense_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/expense_list_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Text(
                'Detailed View',
                style: TextStyles.drawerHeaderTextStyle,
              ),
            ),
            ListTile(
              title: Text(
                'Expense Details',
                style: TextStyles.drawerItemTextStyle,
              ),
              onTap: () {
                final expenseProvider =
                    Provider.of<ExpenseProvider>(context, listen: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: expenseProvider,
                      child: ExpenseDetails(),
                    ),
                  ),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'minance',
          style: TextStyles.headerTextStyle,
        ),
        shadowColor: Colors.black12,
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
      body: Column(
        children: [
          Visibility(
            visible: expenseProvider.expenseTypeList.isEmpty ||
                expenseProvider.expenseAmountList.isEmpty,
            child: Expanded(
              child: Center(
                child: Text(
                  'There are no expenses added, yet.',
                  style: TextStyles.subHeaderTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          expenseProvider.removeFromAmountList(index);
                          expenseProvider.removeFromExpenseTypeList(index);
                        },
                        child: expenseListBuilder(
                            context,
                            index,
                            expenseProvider.expenseTypeList,
                            expenseProvider.expenseAmountList,
                            expenseProvider.daySpent),
                      );
                    },
                    itemCount: expenseProvider.expenseTypeList.length),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
