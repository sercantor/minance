import 'package:flutter/foundation.dart';
import 'package:minance/models/expense_model.dart';
import 'package:uuid/uuid.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenseList = [];
  String _dropdownExpenseType;

  //constructor
  ExpenseProvider() {
    setDropdownExpenseType();
  }

  String get dropDownExpenseType => _dropdownExpenseType;
  List<Expense> get expenseList {
    return [..._expenseList];
  }

  setDropdownExpenseType() {
    _dropdownExpenseType = 'Food';
  }

  void updateDropdownExpenseType(String val) {
    _dropdownExpenseType = val;
    notifyListeners();
  }

  void addToList(Expense newExpense, int index) {
    // we can edit now, bad logic...
    print('${newExpense.daySpent}');
    print(index);
    if (index != null) {
      if (!(_expenseList.every((expense) => expense.id == newExpense.id))) {
        _expenseList[index] = newExpense;
      }
    }
    if (index == null) {
      _expenseList.add(newExpense);
    }
    notifyListeners();
  }

  void removeFromList(int index) {
    _expenseList.removeAt(index);
    notifyListeners();
  }
}
