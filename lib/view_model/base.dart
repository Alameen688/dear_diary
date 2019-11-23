import 'package:flutter/foundation.dart';

enum ViewStatus {
  Loading,
  Ready
}

class BaseViewModel extends ChangeNotifier  {
  ViewStatus _status;
  
  ViewStatus get viewStatus => _status;

  void setStatus(ViewStatus status) {
    _status = status;
    notifyListeners();
  }
}