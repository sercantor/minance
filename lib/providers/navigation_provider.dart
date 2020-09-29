import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex;

  NavigationProvider() {
    _selectedIndex = 0;
  }

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
