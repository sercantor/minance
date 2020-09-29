import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class ExpenseSeries {
  final String expenseMonth;
  final int expenseAmount;
  final charts.Color barColor;

  ExpenseSeries(
      {@required this.expenseMonth, this.expenseAmount, this.barColor});
}
