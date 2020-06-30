//import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:app/services/Api.dart';
//import 'package:app/utils/Constants.dart';
//import 'package:app/models/Menu.dart';
//import 'package:app/models/Session.dart';
//import 'package:app/models/ApiResult.dart';
/*
Future<Response> _loadMenuAsset() async {
  var url = Constants.BASE_URL+"/index.php?p=Menu&menu_type=8&json=1";
  return await http.get(url);
}
*/
/*
Future loadMenu() async {
  print("Loading menu............");
  final url = Constants.BASE_URL+Constants.MENU_URL;
  api.getUrl(url).then((response) {
      final json_data = json.decode(response.body);

      final ApiResult MyApiResult=new ApiResult.fromJson(json_data);
      print("*********************** CART ITEM COUNT: "+json_data["cart_item_count"].toString()+" *******************");
      print("*********************** CART ITEM COUNT: "+MyApiResult.cart_item_count.toString()+" *******************");
      print("*********************** User Full Name: "+MyApiResult.session.userFullName.toString()+" *******************");
      print("*********************** Response Body: "+response.body.toString()+" *******************");
      print("*********************** Response Body: "+MyApiResult.result_data[0].title.toString()+" *******************");

     // final Iterable mylist = json_data["result_data"];
      ///final sessionData = json_data["session"]; //session->userFullName;
      //final cart_item_count = json_data["cart_item_count"];
      //menu_items = mylist.map((model) => Menu.fromJson(model)).toList();
      //debugPrint("denemeler");
      //print(albums[0].id.toString());
  });

*/
/*
  String jsonString = api.getUrl(url);
  final jsonResponse = json.decode(jsonString);
  ApiResult MyResult = new ApiResult.fromJson(jsonResponse);
  print("*********************** CART ITEM COUNT: "+MyResult.cart_item_count.toString()+" *******************");
  */
}