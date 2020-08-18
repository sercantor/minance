import 'package:flutter/foundation.dart';

class ExpenseProvider with ChangeNotifier {
  String _dropdownExpenseType;
  List<String> _expenseTypeList;
  List<int> _expenseAmountList;
  List<String> _daySpent;

  //constructor
  ExpenseProvider() {
    setDropdownExpenseType();
    _expenseTypeList = List<String>();
    _expenseAmountList = List<int>();
    _daySpent = List<String>();
  }

  String get dropDownExpenseType => _dropdownExpenseType;
  List<String> get expenseTypeList => _expenseTypeList;
  List<int> get expenseAmountList => _expenseAmountList;
  List<String> get daySpent => _daySpent;

  setDropdownExpenseType() {
    _dropdownExpenseType = 'Food';
  }

  updateExpenseTypeList(String value) {
    _expenseTypeList.add(value);
    print('$_expenseTypeList');
    notifyListeners();
  }

  updateAmountList(int value) {
    _expenseAmountList.add(value);
    notifyListeners();
  }

  updateDaySpent(String value) {
    _daySpent.add(value);
    notifyListeners();
  }

  updateDropdownExpenseType(String newValue) {
    _dropdownExpenseType = newValue;
    notifyListeners();
  }
}
