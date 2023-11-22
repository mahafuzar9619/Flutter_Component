import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_component/model/user_model.dart';
import 'package:flutter_component/repository/personal_info_repository.dart';
import 'package:get/get.dart';

class Personal_Info_Update_Repositoy extends GetxController{
  static Personal_Info_Update_Repositoy get interface => Get.find();

 final _per_info_Repo = Get.put(Personal_Info_Repository());
  final _db = FirebaseFirestore.instance;


 update_Personal_info(User_Model user) {
   var id = _per_info_Repo.Current_Id();
  // print("nnnnnnn$id");
  // print("ggggggg ${user.full_name}");
     _db.collection("User_Form").doc("$id").update(user.toJson()).then((value) => Get.back());
  }
}