import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:minance/models/expense_model.dart';
import 'package:minance/providers/expense_page_provider.dart';
import 'package:provider/provider.dart';

class BarChartSample1 extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xFFF76300),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Total Spendings',
                    style: TextStyle(
                        color: const Color(0xff000a3c),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(expenseProvider.expenseList),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(List<Expense> expenseList) {
    /***** functions that return spendings for a specific month ****/

    int janSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Jan') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int febSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Feb') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int marSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Mar') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int aprSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Apr') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int maySpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'May') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int junSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Jun') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int julSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Jul') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int augSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Aug') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int sepSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Sep') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int octSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Oct') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int novSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Nov') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    int decSpendings() {
      int res = 0;
      expenseList.forEach((expense) {
        if (expense.monthSpent == 'Dec') {
          res += expense.expenseAmount;
        }
      });
      return res;
    }

    return List.generate(
      12,
      (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, janSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, febSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, marSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, aprSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, maySpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, junSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, julSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, augSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(8, sepSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 9:
            return makeGroupData(9, octSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 10:
            return makeGroupData(10, novSpendings().toDouble(),
                isTouched: i == touchedIndex);
          case 11:
            return makeGroupData(11, decSpendings().toDouble(),
                isTouched: i == touchedIndex);
          default:
            return null;
        }
      },
    );
  }

  BarChartData mainBarData(List<Expense> expenseList) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String month;
              switch (group.x.toInt()) {
                case 0:
                  month = 'Jan';
                  break;
                case 1:
                  month = 'Feb';
                  break;
                case 2:
                  month = 'Mar';
                  break;
                case 3:
                  month = 'Apr';
                  break;
                case 4:
                  month = 'May';
                  break;
                case 5:
                  month = 'Jun';
                  break;
                case 6:
                  month = 'Jul';
                  break;
                case 7:
                  month = 'Aug';
                  break;
                case 8:
                  month = 'Sep';
                  break;
                case 9:
                  month = 'Oct';
                  break;
                case 10:
                  month = 'Nov';
                  break;
                case 11:
                  month = 'Dec';
                  break;
              }
              return BarTooltipItem(month + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '1';
              case 1:
                return '2';
              case 2:
                return '3';
              case 3:
                return '4';
              case 4:
                return '5';
              case 5:
                return '6';
              case 6:
                return '7';
              case 7:
                return '8';
              case 8:
                return '9';
              case 9:
                return '10';
              case 10:
                return '11';
              case 11:
                return '12';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(expenseList),
    );
  }
}

// import 'dart:async';
// import 'dart:math';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:minance/models/expense_model.dart';
// import 'package:minance/providers/expense_page_provider.dart';
// import 'package:provider/provider.dart';

// import '../theme.dart';

// class BarChartSample1 extends StatefulWidget {
//   final List<Color> availableColors = [
//     Colors.purpleAccent,
//     Colors.yellow,
//     Colors.lightBlue,
//     Colors.orange,
//     Colors.pink,
//     Colors.redAccent,
//   ];

//   @override
//   State<StatefulWidget> createState() => BarChartSample1State();
// }

// class BarChartSample1State extends State<BarChartSample1> {
//   final Color barBackgroundColor = const Color(0xff72d8bf);
//   final Duration animDuration = const Duration(milliseconds: 250);

//   int touchedIndex;

//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     final expenseProvider = Provider.of<ExpenseProvider>(context);

//     return AspectRatio(
//       aspectRatio: 1,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//         color: const Color(0xff81e5cd),
//         child: Stack(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Text(
//                     'Mingguan',
//                     style: TextStyle(
//                         color: const Color(0xff0f4a3c),
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     'Grafik konsumsi kalori',
//                     style: TextStyle(
//                         color: const Color(0xff379982),
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 38,
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: BarChart(
//                         barData(expenseProvider.expenseList),
//                         swapAnimationDuration: animDuration,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   BarChartGroupData makeGroupData(
//     int x,
//     double y, {
//     bool isTouched = false,
//     Color barColor = Colors.white,
//     double width = 15,
//     List<int> showTooltips = const [],
//   }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           y: isTouched ? y + 1 : y,
//           colors: isTouched ? [Colors.yellow] : [barColor],
//           width: width,
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             y: 20,
//             colors: [barBackgroundColor],
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }

//   List<BarChartGroupData> showingGroups(List<Expense> expenseList) =>
//       List.generate(12, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, expenseList.last.expenseAmount.toDouble(),
//                 isTouched: i == touchedIndex);
//           case 1:
//             return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
//           case 2:
//             return makeGroupData(2, 5, isTouched: i == touchedIndex);
//           case 3:
//             return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
//           case 4:
//             return makeGroupData(4, 9, isTouched: i == touchedIndex);
//           case 5:
//             return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
//           case 6:
//             return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
//           default:
//             return null;
//         }
//       });

//   BarChartData barData(List<Expense> expenseList) {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchTooltipData: BarTouchTooltipData(
//             tooltipBgColor: Colors.blueGrey,
//             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//               String month;
//               switch (group.x.toInt()) {
// case 0:
//   month = 'Jan';
//   break;
// case 1:
//   month = 'Feb';
//   break;
// case 2:
//   month = 'Mar';
//   break;
// case 3:
//   month = 'Apr';
//   break;
// case 4:
//   month = 'May';
//   break;
// case 5:
//   month = 'Jun';
//   break;
// case 6:
//   month = 'Jul';
//   break;
// case 7:
//   month = 'Aug';
//   break;
// case 8:
//   month = 'Sep';
//   break;
// case 9:
//   month = 'Oct';
//   break;
// case 10:
//   month = 'Nov';
//   break;
// case 11:
//   month = 'Dec';
//   break;
//               }
//               return BarTooltipItem(month, TextStyles.subHeaderTextStyle);
//             }),
//         touchCallback: (barTouchResponse) {
//           setState(() {
//             if (barTouchResponse.spot != null &&
//                 barTouchResponse.touchInput is! FlPanEnd &&
//                 barTouchResponse.touchInput is! FlLongPressEnd) {
//               touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
//             } else {
//               touchedIndex = -1;
//             }
//           });
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
//           margin: 16,
//           getTitles: (double value) {
//             switch (value.toInt()) {
//               case 0:
//                 return '1';
//               case 1:
//                 return '2';
//               case 2:
//                 return '3';
//               case 3:
//                 return '4';
//               case 4:
//                 return '5';
//               case 5:
//                 return '6';
//               case 6:
//                 return '7';
//               case 7:
//                 return '8';
//               case 8:
//                 return '9';
//               case 9:
//                 return '10';
//               case 10:
//                 return '11';
//               case 11:
//                 return '12';
//               default:
//                 return '';
//             }
//           },
//         ),
//         leftTitles: SideTitles(
//           showTitles: false,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: showingGroups(expenseList),
//     );
//   }
// }
