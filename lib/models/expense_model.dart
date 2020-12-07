import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'expense_model.g.dart';

var _uuid = Uuid();

@HiveType(typeId: 1)
class Expense {
  @HiveField(0)
  final String expenseType;

  @HiveField(1)
  final int expenseAmount;

  @HiveField(2)
  final String daySpent;

  @HiveField(3)
  final String monthSpent;

  @HiveField(4)
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

  factory Expense.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Expense(
      expenseType: map['expenseType'],
      expenseAmount: map['expenseAmount'],
      daySpent: map['daySpent'],
      monthSpent: map['monthSpent'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));
}
