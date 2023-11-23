import 'package:flutter_component/model/api_call_model.dart';
import 'package:flutter_component/servise/api_call_service.dart';
import 'package:get/get.dart';



class Api_Call_Controller extends GetxController {

  var isLoding = true.obs;
  var dispay_list = <ApiCallModel>[].obs;

  @override
  void onInit() {
    GetAllPost();
    super.onInit();
  }

  void GetAllPost() async {
    var data = await Api_Call_Service().fetchPost();
    if (data.length > 0) {
      dispay_list.clear();
      isLoding(false);
      dispay_list.addAll(data);
    }
  }
}