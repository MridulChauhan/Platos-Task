import 'package:flutter/cupertino.dart';

class Data extends ChangeNotifier {
  int count = 0;
  void incrementCount() {
    count++;
    notifyListeners();
  }
}
