import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:minance/models/expense_series.dart';
import 'package:provider/provider.dart';
import 'package:minance/providers/expense_page_provider.dart';
import '../theme.dart';

class StatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    List<ExpenseSeries> data = List<ExpenseSeries>();
    data.addAll([
      for (int i = 0; i < expenseProvider.expenseAmountList.length; i++)
        ExpenseSeries(
          expenseMonth: expenseProvider.monthSpent[i],
          expenseAmount:
              expenseProvider.chartMap[expenseProvider.monthSpent[i]],
          barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        )
    ]);
    var series = [
      charts.Series(
        id: 'Expenses',
        data: data,
        domainFn: (ExpenseSeries series, _) => series.expenseMonth,
        measureFn: (ExpenseSeries series, _) => series.expenseAmount,
        colorFn: (ExpenseSeries series, _) => series.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: charts.BarChart(
        series,
        animate: true,
        // Add the series legend behavior to the chart to turn on series legends.
        // By default the legend will display above the chart.
        behaviors: [new charts.SeriesLegend()],
      ),
    );
    // child: Text('${expenseProvider.expenseAmountList}'));
  }
}
