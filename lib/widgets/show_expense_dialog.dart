import 'package:flutter/material.dart';
import 'package:minance/models/expense_model.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ShowExpenseDialog extends StatefulWidget {
  @override
  _ShowExpenseDialogState createState() => _ShowExpenseDialogState();

  final Expense expense;
  final int index;
  ShowExpenseDialog([this.expense, this.index]);
}

class _ShowExpenseDialogState extends State<ShowExpenseDialog> {
  final amountController = TextEditingController();
  final dateTimeController =
      TextEditingController(text: DateFormat('MMMEd').format(DateTime.now()));

  @override
  void initState() {
    //many null checks, this isn't the right way to do this probably, but I'm gettin bored
    if (widget.expense?.expenseAmount != null) {
      amountController.text = widget.expense.expenseAmount.toString();
    }
    if (widget.expense?.daySpent != null) {
      print('debug with print the best');
      dateTimeController.text = widget.expense.daySpent;
    }
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    DateTime selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2012),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          dateTimeController.text = DateFormat('MMMEd').format(picked);
        });
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 10.0),
        height: MediaQuery.of(context).copyWith().size.height / 1.5,
        child: Column(
          children: [
            //expense type
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: DropdownButtonFormField<String>(
                  style: TextStyles.subHeaderTextStyle,
                  value: expenseProvider.dropDownExpenseType,
                  decoration: InputDecoration(
                      labelText: 'Expense Type',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyles.labelTextStyle),
                  onChanged: (String newValue) =>
                      expenseProvider.updateDropdownExpenseType(newValue),
                  items: <String>['Food', 'Insurance', 'Pet', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            //expense amount
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  autofocus: false,
                  style: TextStyles.subHeaderTextStyle,
                  decoration: InputDecoration(
                      labelText: 'Expense Amount',
                      labelStyle: TextStyles.labelTextStyle,
                      border: OutlineInputBorder()),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: amountController,
                ),
              ),
            ),
            //expense date
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  showCursor: false,
                  style: TextStyles.subHeaderTextStyle,
                  controller: dateTimeController,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyles.labelTextStyle),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _selectDate(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text(
                    'Cancel',
                    style: TextStyles.cancelButtonTextStyle,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyles.okButtonTextStyle,
                  ),
                  onPressed: () {
                    // expenseProvider.expenseList.forEach((element) {
                    //   print(
                    //       '${element.daySpent}\n ${element.expenseAmount}\n ${element.id}');
                    // });
                    //TODO: parse doesn't work, 0 or negative values breaks the app
                    if (int.parse(amountController.text) > 1) {
                      expenseProvider.addToList(
                          Expense(
                            daySpent: dateTimeController.text,
                            expenseAmount: int.parse(amountController.text),
                            expenseType: expenseProvider.dropDownExpenseType,
                            monthSpent: dateTimeController.text.substring(5, 8),
                          ),
                          widget.index);
                    }
                    Navigator.pop(context);
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
