import 'package:flutter/material.dart';
import 'package:flutter_component/controller/api_call_controller.dart';
import 'package:get/get.dart';

class Api_Call extends StatefulWidget {
  Api_Call({super.key});

  @override
  State<Api_Call> createState() => _Api_CallState();
}

class _Api_CallState extends State<Api_Call> {
  final dispayController = Get.put(Api_Call_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade200,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Api Calling'.toUpperCase(),
              softWrap: true,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Obx(() => dispayController.isLoding.value?Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
          itemCount: dispayController.dispay_list.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height*.4,
                padding: EdgeInsets.only(left: 8,right: 8),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                       "user id: ${dispayController.dispay_list[index].userId}".toString(),
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Text(
                      "Id: ${dispayController.dispay_list[index].id}".toString(),
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 19,
                      ),
                    ),
                    Center(
                      child: Text(
                    "TITLE: ${dispayController.dispay_list[index].title}",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                   "BODY: ${ dispayController.dispay_list[index].body}",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
        ),
      ),
    );
  }
}
