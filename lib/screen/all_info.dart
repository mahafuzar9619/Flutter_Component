import 'package:flutter/material.dart';
import 'package:flutter_component/controller/all_info_controller.dart';
import 'package:flutter_component/model/user_model.dart';
import 'package:get/get.dart';

class All_Info extends StatefulWidget {
  const All_Info({super.key});

  @override
  State<All_Info> createState() => _All_InfoState();
}

class _All_InfoState extends State<All_Info> {
  final _allInfocon = Get.put(All_Info_Controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
                "All User details".toUpperCase(),
              softWrap: true,
              style: TextStyle(
                fontSize: h*.04,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: h,
            width: w,
            color: Colors.teal.shade200,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: FutureBuilder(
                future: _allInfocon.getAllUserdata(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: size.height*.07,),
                                Container(
                                  height: size.height*.3,
                                  width: size.width,
                                  padding: EdgeInsets.only(left: size.height*.02,top: size.height*.01,),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data![index].full_name,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height*.04,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].occupation,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.04,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].gmail,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.03,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].mobile_no,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.03,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        'Age: ${snapshot.data![index].age}',
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height*.02,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      GestureDetector(
                                        onTap: (){
                                          User_Model user = snapshot.data![index] as User_Model;
                                          var full_name = TextEditingController(text: user.full_name);
                                          var occupation = TextEditingController(text: user.occupation);
                                          var gmail= TextEditingController(text: user.gmail);
                                          var mobile_no = TextEditingController(text: user.mobile_no);
                                          var age = TextEditingController(text: user.age);
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                backgroundColor: Colors.teal,
                                                title: Center(
                                                  child: Text(
                                                    'Update'.toUpperCase(),
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontSize: h*.03,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  height: h*.5,
                                                  width: w*.5,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Container(
                                                      height: h,
                                                      width: w,
                                                      color: Colors.teal.shade100,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              TextField(
                                                                controller: full_name,
                                                                decoration: InputDecoration(
                                                                  fillColor: Colors.white60,
                                                                  filled: true,
                                                                  labelText: 'Full_Name',
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                                                                ),
                                                              ),
                                                              SizedBox(height: size.height*.01,),
                                                              TextField(
                                                                controller: occupation,
                                                                decoration: InputDecoration(
                                                                  fillColor: Colors.white60,
                                                                  filled: true,
                                                                  labelText: 'Occupation',
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                  contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                ),
                                                              ),
                                                              SizedBox(height: size.height*.01,),
                                                              TextField(
                                                                controller: gmail,
                                                                decoration: InputDecoration(
                                                                  fillColor: Colors.white60,
                                                                  filled: true,
                                                                  labelText: 'gmail',
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                  contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                ),
                                                              ),
                                                              SizedBox(height: size.height*.01,),
                                                              TextField(
                                                                controller: mobile_no,
                                                                decoration: InputDecoration(
                                                                  fillColor: Colors.white60,
                                                                  filled: true,
                                                                  labelText: 'Mobile_No',
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                  contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                ),
                                                              ),
                                                              SizedBox(height: size.height*.01,),
                                                              TextField(
                                                                controller: age,
                                                                decoration: InputDecoration(
                                                                  fillColor: Colors.white60,
                                                                  filled: true,
                                                                  labelText: 'Age',
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(18),
                                                                    borderSide: BorderSide(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                  contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                actions: [
                                                  GestureDetector(
                                                    onTap: (){
                                                      final user = User_Model(
                                                        full_name: full_name.text.trim(),
                                                        age: age.text.trim(),
                                                        occupation: occupation.text.trim(),
                                                        mobile_no: mobile_no.text.trim(),
                                                        gmail: gmail.text.trim(),
                                                      );
                                                      _allInfocon.UpdateRecord(user);
                                                    },
                                                    child: Container(
                                                      height: size.height*.04,
                                                      width: size.width*.3,
                                                      color: Colors.teal.shade100,
                                                      child: Center(
                                                        child: Text(
                                                          'Submit'.toUpperCase(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: size.height*.03,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          );
                                        },
                                        child: Container(
                                          height: size.height*.03,
                                          width: size.width*.2,
                                          color: Colors.red.shade200,
                                          child: Center(
                                            child: Text(
                                              'update'.toUpperCase(),
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: size.height*.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                      );
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }else{
                      return Center(child: Text('error something',));
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
