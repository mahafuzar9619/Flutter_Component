import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model{
  final String full_name;
  final String age;
  final String occupation;
  final String mobile_no;
  final String gmail;

  User_Model({required this.full_name,required this.age,required this.occupation,required this.mobile_no,required this.gmail});
  toJson(){
    return {
      "full_name" : full_name,
      "age" : age,
      "occupation" : occupation,
       "mobile_no" : mobile_no,
      "gmail" : gmail,
  };
}
factory User_Model.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data =document.data()!;
    return User_Model(
        full_name: data['full_name'],
        age: data['age'],
        occupation: data['occupation'],
        mobile_no: data['mobile_no'],
        gmail: data['gmail']
    );
  }
}