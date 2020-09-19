import 'package:flutter/material.dart';

import '../theme.dart';

class StatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'stats',
          style: TextStyles.subHeaderTextStyle,
        ),
      ),
    );
  }
}
