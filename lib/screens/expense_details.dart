import 'package:flutter/material.dart';

import '../theme.dart';

class ExpenseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'minance',
          style: TextStyles.headerTextStyle,
          softWrap: false,
        ),
        shadowColor: Colors.black12,
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
