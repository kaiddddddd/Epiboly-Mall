import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Toast {
  static void show(String msg) {
    SmartDialog.compatible.showToast(msg, type: SmartToastType.firstAndLast);
  }

  static fail(msg) {
    SmartDialog.compatible.showToast(msg, type: SmartToastType.firstAndLast);
  }
}
