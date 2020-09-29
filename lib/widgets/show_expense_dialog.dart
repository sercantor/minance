import 'package:flutter/material.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:minance/providers/navigation_provider.dart';
import 'package:minance/theme.dart';
import 'package:minance/widgets/stat_page.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ShowExpenseDialog extends StatefulWidget {
  @override
  _ShowExpenseDialogState createState() => _ShowExpenseDialogState();
}

class _ShowExpenseDialogState extends State<ShowExpenseDialog> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateTimeController =
      TextEditingController(text: DateFormat('MMMEd').format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    DateTime selectedDate = DateTime.now();
    // final navigationProvider = Provider.of<NavigationProvider>(context);

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
                    //TODO: parse doesn't work, 0 or negative values breaks the app
                    if (int.parse(amountController.text) > 1) {
                      expenseProvider.updateExpenseTypeList(
                          expenseProvider.dropDownExpenseType);
                      expenseProvider
                          .updateAmountList(int.parse(amountController.text));
                      expenseProvider.updateDaySpent(dateTimeController.text);
                      expenseProvider.updateMonthSpent(
                          dateTimeController.text.substring(5, 8));
                      expenseProvider.updateChartMap(
                        dateTimeController.text.substring(5, 8),
                        int.parse(amountController.text),
                      );
                      // navigationProvider.setSelectedIndex(0);
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
