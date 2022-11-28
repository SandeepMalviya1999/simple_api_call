import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

printLog({required String title, required dynamic content}) {
  if (kDebugMode) {
    log('$title : $content');
  }
}

showMessage({required String title, required content}) {
  Get.snackbar(title, content);
}
