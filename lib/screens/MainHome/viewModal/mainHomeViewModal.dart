import 'package:flutter/cupertino.dart';

class MainHomeViewViewModal extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndexAccordingScreen(int index) {
    _currentIndex = index;
  }
}
