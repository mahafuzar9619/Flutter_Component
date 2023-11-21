import 'package:flutter_component/model/user_model.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:flutter_component/repository/personal_info_repository.dart';
import 'package:get/get.dart';

class Personal_Info_Controller extends GetxController{
  static Personal_Info_Controller get interface => Get.find();
  final _auth_repo = Get.put(AuthenticationRepository());
  final _personal_info_repo = Get.put(Personal_Info_Repository());

Future<User_Model?>get_personal_info() async{
  var email = _auth_repo.Current_Email();
  if (email != null){
  return await _personal_info_repo.get_personal_info_infirebase(email);
  }else{
    Get.snackbar('Error', 'Login to continue');
    return null;
  }
}
}