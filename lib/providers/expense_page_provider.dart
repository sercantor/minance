import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class ExpenseProvider with ChangeNotifier {
  String _dropdownExpenseType;
  List<String> _expenseTypeList;
  List<int> _expenseAmountList;
  List<String> _daySpent;
  List<String> _monthSpent;
  Map<String, int> _chartMap;
  List<String> _expenseId;

  //constructor
  ExpenseProvider() {
    setDropdownExpenseType();
    _expenseTypeList = List<String>();
    _expenseAmountList = List<int>();
    _daySpent = List<String>();
    _monthSpent = List<String>();
    _chartMap = Map();
    _expenseId = List<String>();
  }

  String get dropDownExpenseType => _dropdownExpenseType;
  List<String> get expenseTypeList => _expenseTypeList;
  List<int> get expenseAmountList => _expenseAmountList;
  List<String> get daySpent => _daySpent;
  List<String> get monthSpent => _monthSpent;
  Map get chartMap => _chartMap;
  List<String> get expenseId => _expenseId;

  setDropdownExpenseType() {
    _dropdownExpenseType = 'Food';
  }

  addExpenseId(String id) {
    _expenseId.add(id);
    print(id);
    notifyListeners();
  }

  updateExpenseTypeList(String value, String id) {
    if (_expenseId.contains(id)) {
      _expenseTypeList[_expenseId.indexOf(id)] = value;
    } else {
      _expenseTypeList.add(value);
    }
    print('$_expenseTypeList');
    notifyListeners();
  }

  updateAmountList(int value, String id) {
    if (_expenseId.contains(id)) {
      _expenseAmountList[_expenseId.indexOf(id)] = value;
    } else {
      _expenseAmountList.add(value);
    }
    print(_expenseAmountList);
    notifyListeners();
  }

  updateDaySpent(String value, String id) {
    if (_expenseId.contains(id)) {
      _daySpent[_expenseId.indexOf(id)] = value;
    } else {
      _daySpent.add(value);
    }
    notifyListeners();
  }

  updateMonthSpent(String value, String id) {
    if (_expenseId.contains(id)) {
      _monthSpent[_expenseId.indexOf(id)] = value;
    } else {
      _monthSpent.add(value);
    }
    notifyListeners();
  }

  updateChartMap(String month, int amount, String id) {
    _chartMap.update(month, (existingValue) => existingValue + amount,
        ifAbsent: () => amount);
    print(chartMap);
    notifyListeners();
  }

  removeFromExpenseTypeList(int index, String id) {
    if (_expenseId.contains(id)) {
      _expenseTypeList.removeAt(index);
    }
    notifyListeners();
  }

  removeFromAmountList(int index, String id) {
    if (_expenseId.contains(id)) {
      _expenseAmountList.removeAt(index);
    }
    notifyListeners();
  }

  removeDaySpent(int index, String id) {
    if (_expenseId.contains(id)) {
      _daySpent.removeAt(index);
    }
    notifyListeners();
  }

  removeMonthSpent(int index, String id) {
    if (_expenseId.contains(id)) {
      _monthSpent.removeAt(index);
    }
    print('LENGHT OF EXPENSEID IS: ${_expenseId.length}');
    notifyListeners();
  }

  removeExpenseId(int index) {
    print('removing expenseid index: $index, $_expenseId');
    _expenseId.removeAt(index);
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
