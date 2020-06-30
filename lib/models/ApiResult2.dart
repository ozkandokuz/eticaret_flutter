import 'dart:convert';
import 'package:app/models/Menu.dart';

class ApiResult2 {
  final int cart_item_count;
  final String user_name;
  final String logo_url;
  final List<Menu> menu_items;


  ApiResult2({this.cart_item_count,this.user_name,this.logo_url,this.menu_items});
  //ApiResult2({this.cart_item_count,this.user_name});

  factory ApiResult2.fromJson(Map<String, dynamic> json) {


    var mylist = json['menu_items'] as List;
    //print(mylist.runtimeType);
    List<Menu> menu_items_data = mylist.map((i) => Menu.fromJson(i)).toList();

    return ApiResult2(

      cart_item_count: json['cart_item_count'],
      user_name: json['user_name'],
      logo_url: json['logo'],
      menu_items: menu_items_data,


    );
  }

}
