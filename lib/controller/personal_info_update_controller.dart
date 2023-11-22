import 'package:flutter_component/model/user_model.dart';
import 'package:flutter_component/repository/personal_info_update_repository.dart';
import 'package:get/get.dart';

class Personal_Info_Update_Controller extends GetxController{
  static Personal_Info_Update_Controller get interface => Get.find();
  final _personal_Up_repo = Get.put(Personal_Info_Update_Repositoy());
 UpdateRecord(User_Model user) {
   _personal_Up_repo.update_Personal_info(user);
}
}