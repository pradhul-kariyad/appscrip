import 'package:flutter/material.dart';

class HomeDateProvider extends ChangeNotifier {
  String _selectedText = "Date";

  String get selectedText => _selectedText;

  void updateDate(String newDate) {
    _selectedText = newDate;
    notifyListeners();
  }
}
