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
}