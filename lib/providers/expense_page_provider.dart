import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:minance/models/expense_model.dart';
import 'package:uuid/uuid.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenseList = [];
  String _dropdownExpenseType;

  //constructor
  ExpenseProvider() {
    setDropdownExpenseType();
    setExpenses();
  }

  String get dropDownExpenseType => _dropdownExpenseType;
  List<Expense> get expenseList {
    return [..._expenseList];
  }

  setExpenses() async {
    Box<Expense> expense = Hive.box<Expense>('expenseBox');
    if (expense != null) {
      print(expense.values.length);
      _expenseList.addAll(expense.values);
    }
    notifyListeners();
  }

  setDropdownExpenseType() {
    _dropdownExpenseType = 'Food';
  }

  void updateDropdownExpenseType(String val) {
    _dropdownExpenseType = val;
    notifyListeners();
  }

  void addToList(Expense newExpense, int index) async {
    Box<Expense> expenses = Hive.box<Expense>('expenseBox');
    // we can edit now, bad logic...
    print('${newExpense.daySpent}');
    print(index);
    if (index != null) {
      if (!(_expenseList.every((expense) => expense.id == newExpense.id))) {
        _expenseList[index] = newExpense;
        expenses.putAt(index, newExpense);
      }
    }
    if (index == null) {
      print('adding to $index th key');
      _expenseList.add(newExpense);
      expenses.add(newExpense);
    }
    notifyListeners();
  }

  void removeFromList(int index) {
    Box<Expense> expenses = Hive.box<Expense>('expenseBox');

    _expenseList.removeAt(index);
    expenses.deleteAt(index);
    print(expenses.keys.toList());
    notifyListeners();
  }
}
