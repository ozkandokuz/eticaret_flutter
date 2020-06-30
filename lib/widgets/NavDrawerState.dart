//import 'dart:async';
import 'dart:convert';
//import 'dart:developer';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:app/Config/EnvironmentConfig.dart';
import 'package:app/utils/Constants.dart';
import 'package:app/services/Api.dart';
import 'package:app/models/Menu.dart';
import 'package:app/widgets/NavDrawer.dart';
import 'package:app/models/ApiResult.dart';
import 'package:app/utils/HexColor.dart';

//final GlobalKey<NavDrawerState> NavDrawerStateKey = GlobalKey<NavDrawerState>();

class NavDrawerState extends State<NavDrawer> {

  List<Menu> menu_items;
  //String UserName="...";
  //var menu_items = new List<Menu>();
/*
  _getMenuItems() {
    final url = Constants.BASE_URL+Constants.MENU_URL;
    api.getUrl(url).then((response) {
      setState(() {
        final json_data = json.decode(response.body);
        final ApiResult MyApiResult=new ApiResult.fromJson(json_data);
        menu_items = MyApiResult.result_data;
        //final Iterable mylist = json_data["result_data"];
        //final sessionData = json_data["session"]; //session->userFullName;
        //final cart_item_count = json_data["cart_item_count"];
        //menu_items = mylist.map((model) => Menu.fromJson(model)).toList();
        //debugPrint("denemeler");
        //print(albums[0].id.toString());
      });
    });
  }
*/

  _getMenuItems(){
    final menu_items_json = GlobalConfiguration().get("menu_items");
    var mylist = menu_items_json as List;
    menu_items = mylist.map((i) => Menu.fromJson(i)).toList();
  }
/*
  updateUserName(String user_name) {
    setState(() {
      widget.username = user_name;
    });
  }
*/
  initState() {
    super.initState();
    _getMenuItems();
/*
    if(!widget.MyStream.hasListener()) {
      final MyStreamSubscription = widget.MyStream.listen((user_name) {
        updateUserName(user_name);
      });
      //MyStreamSubscription.cancel();
    }
*/
  }
  /*
  dispose() {
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    //final List<String> entries = <String>['A', 'B', 'C'];
    //final List<int> colorCodes = <int>[600, 500, 100];
    final MyListTiles=<Widget>[];
    //var albums = new List<Album>();
    //print("***********");
    MyListTiles.add(new DrawerHeader(
      child: Text(
        widget.getUsername(),//+responseList.title,
        style: TextStyle(color: HexColor(GlobalConfiguration().getString("app_menu_bg_color")), fontSize: 25),
        //style: TextStyle(color: Colors.white, fontSize: 25),
      ),

      decoration: BoxDecoration(
          color: HexColor(GlobalConfiguration().getString("app_menu_text_color")),//Colors.green,
      )
    )
    );
/*
    MyListTiles.add(new ListTile(
      leading: Icon(Icons.input),
      title: Text("Album"),
      onTap: () => {},
    )
    );
*/
    if(menu_items!=null) {
      for (int i = 0; i < menu_items.length; i++) {
        MyListTiles.add(new ListTile(
          //leading: Icon(Icons.arrow_forward_ios,size: 16.0),

          title: Text(
              menu_items[i].title,
            style: TextStyle(color: HexColor(GlobalConfiguration().getString("app_menu_text_color")), fontSize: 16),

          ),

          onTap: () {
            final navlink=menu_items[i].url.replaceAll(EnvironmentConfig.getUrl(),"");
            widget.callback(EnvironmentConfig.getUrl() + navlink+ "?" + Constants.MOBILE_PARAMS);
            //controller.loadUrl(Constants.BASE_URL+"/login");
            Navigator.pop(context);
          },
        )
        );
      }
    }
    return Drawer(
      child:Container(
        color: HexColor(GlobalConfiguration().getString("app_menu_bg_color")),
        child: ListView(
          //key: NavDrawerStateKey,
          padding: EdgeInsets.zero,
          children: MyListTiles,
        ),
      )
    );
  }
}