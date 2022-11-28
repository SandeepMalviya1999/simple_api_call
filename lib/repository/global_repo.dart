import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_wed/commmon/function.dart';
import 'package:test_wed/model/api_res.model.dart';

class GlobalRepo {
  // ------------------------------------------------------------
  // FETCH API --------------------------------------------------
  // ------------------------------------------------------------

  Future<List<ApiDataModel>> fetchApiResRepo() async {
    try {
      String apiBase = 'https://jsonplaceholder.typicode.com/posts';

      var res = await Dio().get(apiBase, options: Options(responseType: ResponseType.plain));

      printLog(title: 'DATA', content: res.data);
      if (res.statusCode == 200) {
        return unitListModelFromJson(res.data);
      } else {
        showMessage(title: 'Status ${res.statusCode}', content: 'Something Went Wrong');
      }
    } catch (error, stacktrace) {
      printLog(title: 'ERROR', content: error);
      printLog(title: 'STACKTRACE', content: stacktrace);
    }
    return [];
  }
}
