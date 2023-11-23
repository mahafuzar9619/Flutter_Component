import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_component/model/user_model.dart';
import 'package:get/get.dart';

class All_Info_Repository extends GetxController{
  static All_Info_Repository get interface => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<User_Model>> getAllUser_Data() async{
    final snapshot = await _db.collection("User_Form").get();
    final userdata = snapshot.docs.map((e) => User_Model.fromSnapshot(e)).toList();
    return userdata;
  }
  //for value update
Future  allvalueupdate(User_Model user) async{
    final snapshot = await _db.collection("User_Form").where('gmail' ,isEqualTo: user.gmail).get();
    var id = snapshot.docs.first.id;
    await _db.collection("User_Form").doc(id).update(user.toJson()).then((value) => Get.back());
}
}