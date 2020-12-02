import 'package:minance/providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.attach_money), label: 'Expenses'),
        BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Stats'),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: navigationProvider.selectedIndex,
      onTap: navigationProvider.setSelectedIndex,
    );
  }
}
