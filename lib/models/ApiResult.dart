import 'dart:convert';
import 'package:app/models/Session.dart';
import 'package:app/models/Menu.dart';

class ApiResult {
  final int result_code;
  final List errors;
  final List result_data;
  final Session session;
  final int cart_item_count;

  ApiResult({ this.result_code, this.errors,this.result_data,this.session,this.cart_item_count});

  factory ApiResult.fromJson(Map<String, dynamic> json) {


    var mylist = json['result_data'] as List;
    //print(mylist.runtimeType);
    List<Menu> menu_items = mylist.map((i) => Menu.fromJson(i)).toList();

    return ApiResult(

      result_code: json['result_code'],
      errors: json['errors'],
      result_data: menu_items,
      session: Session.fromJson(json['session']),
      cart_item_count: json['cart_item_count'],

    );
  }

}
