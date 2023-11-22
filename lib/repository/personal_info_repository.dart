import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_component/model/user_model.dart';
import 'package:get/get.dart';

class Personal_Info_Repository extends GetxController{
  static Personal_Info_Repository get interface => Get.find();

  final _db = FirebaseFirestore.instance;
  late var id;
  Current_Id(){
    return id;
  }

 Future<User_Model> get_personal_info_infirebase(String email) async {
   final snapshot = await _db.collection("User_Form").where('gmail', isEqualTo: email).get();
   id = snapshot.docs.first.id;
    final User_Model formData = snapshot.docs.map((e) => User_Model.fromSnapshot(e)).single;
    return formData;
 }

}