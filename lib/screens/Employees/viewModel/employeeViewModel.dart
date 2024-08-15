import 'package:flutter/cupertino.dart';

class EmployeeViewmodel extends ChangeNotifier {
  bool _isGrid = true;

  bool get isGrid => _isGrid;

  setIsGrid() {
    _isGrid = !_isGrid;
    notifyListeners();
  }
}
