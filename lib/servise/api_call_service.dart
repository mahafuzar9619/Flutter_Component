import 'package:flutter_component/model/api_call_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api_Call_Service {
  var client = http.Client();
  Future<List<ApiCallModel>> fetchPost() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode == 200){
      final parsed = json.decode(response.body).cast<Map<String,dynamic>>();
      return parsed.map<ApiCallModel>((json) => ApiCallModel.fromJson(json)).toList();
    }else{
      throw Exception('Fail to load albums');
    }
  }
}