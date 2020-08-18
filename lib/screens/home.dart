import 'package:minance/widgets/show_expense_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _expenseListBuilder(
                        context,
                        index,
                        expenseProvider.expenseTypeList,
                        expenseProvider.expenseAmountList);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: expenseProvider.expenseTypeList.length),
            ),
          ),
        ],
      ),
    );
  }
}

_expenseListBuilder(BuildContext context, int index,
    List<String> expenseTypeList, List<int> expenseAmountList) {
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

  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).copyWith().size.height / 6,
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
    ],
  );
}
