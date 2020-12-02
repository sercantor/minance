import 'package:flutter/material.dart';
import 'package:minance/models/expense_model.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/show_expense_dialog.dart';
import 'package:provider/provider.dart';

Widget expenseListBuilder(
    BuildContext context, int index, List<Expense> expenseList) {
  String imageUrl;
  //image display logic
  switch (expenseList[index].expenseType) {
    case 'Food':
      imageUrl = 'assets/img/food.png';
      break;
    case 'Insurance':
      imageUrl = 'assets/img/insurance.png';
      break;
    case 'Pet':
      imageUrl = 'assets/img/dog.png';
      break;
    case 'Other':
      imageUrl = 'assets/img/money.png';
      break;
  }

  return Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).copyWith().size.height / 5,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomLeft,
                // I have no idea why this is giving me an error
                colors: [Colors.pink, Colors.red]),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
            constraints: BoxConstraints.expand(),
            child: Column(
              children: [
                Container(
                  child: Text(
                    '${expenseList[index].expenseType}',
                    style: TextStyles.headerTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    'Amount: ₺${expenseList[index].expenseAmount}',
                    style: TextStyles.regularTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    'Spent at ${expenseList[index].daySpent}',
                    style: TextStyles.subHeaderTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: new EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
          alignment: FractionalOffset.centerLeft,
          child: Image(
            image: AssetImage(imageUrl),
            height: 92.0,
            width: 92.0,
          ),
        ),
        GestureDetector(
          child: Container(
            margin: new EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
            alignment: FractionalOffset.centerRight,
            child: Icon(
              Icons.edit,
              color: Colors.white70,
              size: 28.0,
            ),
          ),
          onTap: () {
            final expenseProvider =
                Provider.of<ExpenseProvider>(context, listen: false);
            showDialog(
              context: context,
              builder: (_) {
                return ChangeNotifierProvider.value(
                  value: expenseProvider,
                  child: ShowExpenseDialog(
                      expenseProvider.expenseList[index], index),
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
