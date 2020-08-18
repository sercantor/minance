import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ShowExpenseDialog extends StatefulWidget {
  @override
  _ShowExpenseDialogState createState() => _ShowExpenseDialogState();
}

class _ShowExpenseDialogState extends State<ShowExpenseDialog> {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final TextEditingController amountController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).copyWith().size.height / 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expense Type',
                  style: TextStyles.subHeaderTextStyle,
                ),
                Text(
                  'Expense Amount',
                  style: TextStyles.subHeaderTextStyle,
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).copyWith().size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: expenseProvider.dropDownExpenseType,
                  elevation: 16,
                  onChanged: (String newValue) {
                    expenseProvider.updateDropdownExpenseType(newValue);
                  },
                  style: TextStyle(color: Colors.blueAccent),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  //when clicking other, it should turn to textformfield
                  items: <String>['Food', 'Insurance', 'Pet', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).copyWith().size.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                    child: Text(
                      'Cancel',
                      style: TextStyles.cancelButtonTextStyle,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyles.okButtonTextStyle,
                  ),
                  onPressed: () {
                    if (int.parse(amountController.text) > 0) {
                      expenseProvider.updateExpenseTypeList(
                          expenseProvider.dropDownExpenseType);
                      expenseProvider
                          .updateAmountList(int.parse(amountController.text));
                      expenseProvider.updateDaySpent(
                          DateFormat.MMMEd().format(DateTime.now()));
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
