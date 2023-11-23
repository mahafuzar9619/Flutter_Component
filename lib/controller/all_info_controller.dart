import 'package:flutter_component/model/user_model.dart';
import 'package:flutter_component/repository/all_info_repository.dart';
import 'package:get/get.dart';

class All_Info_Controller extends GetxController{
  static All_Info_Controller get interface => Get.find();
  final _AllInfo_repo = Get.put(All_Info_Repository());

  Future<List<User_Model>> getAllUserdata() async{
    return await _AllInfo_repo.getAllUser_Data();
  }

  UpdateRecord(User_Model user){
    _AllInfo_repo.allvalueupdate(user);
  }
}