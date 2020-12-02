import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

class Expense {
  final String expenseType;
  final int expenseAmount;
  final String daySpent;
  final String monthSpent;
  final String id;

  Expense({
    @required this.expenseType,
    @required this.expenseAmount,
    @required this.daySpent,
    @required this.monthSpent,
    String id,
  }) : id = id ?? _uuid.v4();

  Map<String, dynamic> toMap() {
    return {
      'expenseType': expenseType,
      'expenseAmount': expenseAmount,
      'daySpent': daySpent,
      'monthSpent': monthSpent,
      'id': id,
    };
  }
}
