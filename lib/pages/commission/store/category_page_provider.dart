import 'package:flutter/foundation.dart';

class CommissionProvider with ChangeNotifier {
  bool loading = true;


  // category选中索引
  int _categorySelectedIndex = 0;
  int get getCategorySelectedIndex => _categorySelectedIndex;
  set setCategorySelectedIndex(int value) {
    _categorySelectedIndex = value;
    notifyListeners();
  }

  CommissionProvider() {
  }

}
