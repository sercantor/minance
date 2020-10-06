import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/show_expense_dialog.dart';
import 'package:provider/provider.dart';

Widget expenseListBuilder(
  BuildContext context,
  int index,
  List<String> expenseTypeList,
  List<int> expenseAmountList,
  List<String> daySpent,
  List<String> expenseId,
) {
  String imageUrl;
  //image display logic
  switch (expenseTypeList[index]) {
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
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.pink, Colors.red]),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
            constraints: BoxConstraints.expand(),
            child: Column(
              children: [
                Container(
                  child: Text(
                    '${expenseTypeList[index]}',
                    style: TextStyles.headerTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    'Amount: ₺${expenseAmountList[index]}',
                    style: TextStyles.regularTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    'Spent at ${daySpent[index]}',
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
            alignment: FractionalOffset.centerLeft,
            child: Icon(
              Icons.rowing,
              size: 35.0,
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
                      expenseProvider.expenseAmountList[index],
                      expenseProvider.expenseId[index]),
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
