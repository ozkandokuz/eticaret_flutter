import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:app/utils/Constants.dart';
import 'package:app/widgets/MyAppBar.dart';
import 'package:app/utils/HexColor.dart';
//import 'package:myapp/flavors.dart';
import 'package:app/Config/EnvironmentConfig.dart';

class MyAppBarState extends State<MyAppBar> {

  var AppBarSearchVisible=false;

  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }
  _AppBarDefault(back_button_enabled) {
      return AppBar(
          leading: back_button_enabled ? new IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _backPressed
          ):
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer()
          ),
          backgroundColor: HexColor(GlobalConfiguration().getString("app_bar_bg_color")),
          brightness: GlobalConfiguration().getString("status_bar_light") == "light" ? Brightness.light: Brightness.dark,
          iconTheme: IconThemeData(
              color: HexColor(GlobalConfiguration().getString("app_bar_text_color")) ///Colors.white
          ),
          //title: Text(GlobalConfiguration().getString("logo")!=null? GlobalConfiguration().getString("logo") : ""),//
            //title: Text(EnvironmentConfig.APP_NAME),
          title: new Image.network(GlobalConfiguration().getString("logo"),
              fit: BoxFit.cover),
          //actions: back_button_enabled ? _AppBarActionsBackEnabled() : _AppBarActions()
          actions: _AppBarActions()

    );
  }
/*
  _AppBarActionsBackEnabled(){
      return <Widget>[ // Add 3 lines from here...

        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _backPressed
        ),
        IconButton(
            icon: Icon(Icons.search),
            onPressed: _searchPressed
        ),
        IconButton(
            icon: Icon(Icons.person),
            onPressed:_goToMyAccount
        ),
        // IconButton(icon: Icon(Icons.shopping_cart), onPressed: _goToCart),
      ];
  }*/
  _AppBarActions(){
    return <Widget>[ // Add 3 lines from here...
      IconButton(
          icon: Icon(Icons.search),
          onPressed: _searchPressed
      ),
      IconButton(
          icon: Icon(Icons.person),
          onPressed:_goToMyAccount
      ),
      // IconButton(icon: Icon(Icons.shopping_cart), onPressed: _goToCart),
    ];
  }
  _AppBarSearch() {
      return AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer()),
        backgroundColor: HexColor(GlobalConfiguration().getString("app_bar_bg_color")),
        iconTheme: IconThemeData(
            color: HexColor(GlobalConfiguration().getString("app_bar_text_color"))
        ),
        title: new TextField(
          //controller: _filter,

          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...',
            filled: true,
            fillColor: Colors.white,
            //border: OutlineInputBorder(),
            focusColor: Colors.red,
          ),

          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          onSubmitted: _searchSubmitted,
        ), //Text('Side menu'),
        actions: <Widget>[ // Add 3 lines from here...
          IconButton(icon: new Icon(Icons.close), onPressed: _searchPressed),
        ],
      );
  }


  @override
  Widget build(BuildContext context) {
    //return AppBarSearchVisible?_AppBarSearch():_AppBarDefault();

    return  ValueListenableBuilder(
      builder: (BuildContext context, bool value, Widget child) {
        // This builder will only get called when the back_button_notifier
        // is updated.
        return AppBarSearchVisible?_AppBarSearch():_AppBarDefault(value);
      },
      valueListenable: widget.back_button_notifier,
    );


  }
  /*
  void _goToHomePage(){
    widget.callback(Constants.BASE_URL+"/"+"?"+Constants.MOBILE_PARAMS);
  }
   */
  /*
  void _goToCart(){
    widget.callback(Constants.BASE_URL+"/cart"+"?"+Constants.MOBILE_PARAMS);
  }
  */
  void _goToMyAccount(){
    widget.callback(EnvironmentConfig.getUrl()+"/login"+"?"+Constants.MOBILE_PARAMS);
  }
  void _backPressed(){
    widget.callback("back");
  }
  void _searchPressed() {
    setState(() {
      if (!AppBarSearchVisible) {
        AppBarSearchVisible=true;
      } else {
        AppBarSearchVisible=false;
      }
    });
  }

  void _searchSubmitted(String text){
    widget.callback(EnvironmentConfig.getUrl()+"/index.php?p=Products&q="+text+"&"+Constants.MOBILE_PARAMS);
  }
}