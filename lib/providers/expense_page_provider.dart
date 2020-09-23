import 'package:flutter/foundation.dart';

class ExpenseProvider with ChangeNotifier {
  String _dropdownExpenseType;
  List<String> _expenseTypeList;
  List<int> _expenseAmountList;
  List<String> _daySpent;
  List<String> _monthSpent;
  Map<String, int> _chartMap;

  //constructor
  ExpenseProvider() {
    setDropdownExpenseType();
    _expenseTypeList = List<String>();
    _expenseAmountList = List<int>();
    _daySpent = List<String>();
    _monthSpent = List<String>();
    _chartMap = Map();
  }

  String get dropDownExpenseType => _dropdownExpenseType;
  List<String> get expenseTypeList => _expenseTypeList;
  List<int> get expenseAmountList => _expenseAmountList;
  List<String> get daySpent => _daySpent;
  List<String> get monthSpent => _monthSpent;
  Map get chartMap => _chartMap;

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
    print(_expenseAmountList);
    notifyListeners();
  }

  updateDaySpent(String value) {
    _daySpent.add(value);
    notifyListeners();
  }

  updateMonthSpent(String value) {
    _monthSpent.add(value);
    print('$_monthSpent');
    notifyListeners();
  }

  updateChartMap(String month, int amount) {
    // _chartMap.putIfAbsent(month, () => amount);
    // _chartMap.forEach((key, value) {});
    _chartMap.update(month, (existingValue) => existingValue + amount,
        ifAbsent: () => amount);
    print(chartMap);
    notifyListeners();
  }

  removeFromExpenseTypeList(int index) {
    _expenseTypeList.removeAt(index);
    notifyListeners();
  }

  removeFromAmountList(int index) {
    _expenseAmountList.removeAt(index);
    notifyListeners();
  }

  removeDaySpent(int index) {
    _daySpent.removeAt(index);
    notifyListeners();
  }

  removeMonthSpent(int index) {
    _monthSpent.removeAt(index);
    notifyListeners();
  }

  subtractFromChartMap(int index) {
    _chartMap.update(_monthSpent[index],
        (existingValue) => existingValue - _expenseAmountList[index]);
  }

  updateDropdownExpenseType(String newValue) {
    _dropdownExpenseType = newValue;
    notifyListeners();
  }
}
