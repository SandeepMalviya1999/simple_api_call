import 'package:get/get.dart';
import 'package:test_wed/commmon/function.dart';
import 'package:test_wed/model/api_res.model.dart';
import 'package:test_wed/repository/global_repo.dart';

class GlobalController extends GetxController {
  static GlobalController to = Get.find();

  @override
  void onInit() {
    fetchApiRes();
    super.onInit();
  }

  // ------------------------------------------------------------
  // FETCH API --------------------------------------------------
  // ------------------------------------------------------------

  RxBool isLoading = true.obs;
  RxList<ApiDataModel> listData = <ApiDataModel>[].obs;

  Future fetchApiRes() async {
    try {
      isLoading(true);
      listData(await GlobalRepo().fetchApiResRepo());
    } catch (error, stacktrace) {
      printLog(title: 'ERROR', content: error);
      printLog(title: 'STACKTRACE', content: stacktrace);
    } finally {
      isLoading(false);
    }
  }
}
