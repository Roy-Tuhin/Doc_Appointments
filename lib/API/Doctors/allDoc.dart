import 'package:http/http.dart' as http;
import 'dart:convert';
class AllDoc{
   Future<List<dynamic>> fetchData() async{
     final response = await http.post("http://medbo.digitalicon.in/api/medboapi/alldoctor");

     Map<String, dynamic> map = jsonDecode(response.body);
     return map["Data"];
   }
}