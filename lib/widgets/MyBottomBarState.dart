//import 'dart:async';
//import 'dart:convert';
//import 'dart:developer';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app/Config/EnvironmentConfig.dart';
import 'package:app/utils/Constants.dart';
//import 'package:app/services/Api.dart';
import 'package:app/widgets/MyBottomBar.dart';


class MyBottomBarState extends State<MyBottomBar> {


  @override
  Widget build(BuildContext context) {
    _cartPrdCountText(){
      return ValueListenableBuilder(
        builder: (BuildContext context, int value, Widget child) {
          // This builder will only get called when the cart_prd_count_notifier
          // is updated.
          return Text(
            value.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          );
        },
        valueListenable: widget.cart_prd_count_notifier,
      );
    }
    _textStyle(){
      return new TextStyle(color: const Color(0xFF06244e), fontSize: 12.0);
    }
    _navItemCart(){
      return  BottomNavigationBarItem(
        title: Text('Sepetim',style: _textStyle()),
        icon: new Stack(
            children: <Widget>[
              new Icon(Icons.shopping_cart),
              new Positioned(  // draw a red marble
                top: 0.0,
                right: 0.0,
                child: new Container(
                  padding: EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: _cartPrdCountText(),
                ),
              )
            ]
        ),
      );
    }

    _navItemSiparisler(){
      return BottomNavigationBarItem(
        icon: Icon(Icons.view_list),
        title: Text('Siparişlerim',style: _textStyle()),

      );
    }
    _navItemHome() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Anasayfa',style: _textStyle()),
      );
    }
    /*
    _navItemBack(){
      return BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back),
        title: Container(height: 0.0),
      );
    }*/
    /*
    _navItems1() {
      return <BottomNavigationBarItem>[
        _navItemBack(),
        //_navItemHome(),
        _navItemCart(),
        _navItemSiparisler(),
      ];
    }*/
    _navItems2() {
      return <BottomNavigationBarItem>[
        _navItemHome(),
        _navItemCart(),
        _navItemSiparisler(),
      ];
    }

    /*
    _navItems(){
      return widget.back_button_enabled ? _navItems1() : _navItems2();
    }
    */


    return  ValueListenableBuilder(
      builder: (BuildContext context, bool back_button_enabled, Widget child) {
        // This builder will only get called when the back_button_notifier
        // is updated.
        return BottomNavigationBar(
          currentIndex: 0,
          //onTap: _onItemTapped,//
          //onTap: back_button_enabled ? _onItemTappedBackEnabled : _onItemTapped,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          //items: back_button_enabled ? _navItems1() :_navItems2(),
          items: _navItems2(),
          );
      },
      valueListenable: widget.back_button_notifier,
    );
  }
  /*
  void _goBack(){
    widget.callback("back");
  }*/
  void _goToHomePage(){
    widget.callback(EnvironmentConfig.getUrl()+"/"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToCart(){
    widget.callback(EnvironmentConfig.getUrl()+"/cart"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToMyOrders(){
    widget.callback(EnvironmentConfig.getUrl()+"/index.php?p=Orders"+"&"+Constants.MOBILE_PARAMS);
  }
/*
  void _searchSubmitted(String text){
    widget.callback(Constants.BASE_URL+"/index.php?p=Products&q="+text+"&"+Constants.MOBILE_PARAMS);
  }*/
  void _onItemTapped(_index) {
    switch (_index) {
      case 0:
        _goToHomePage();
        break;

      case 1:
        _goToCart();
        break;
      case 2:
        _goToMyOrders();
        break;
    }
  }
/*
  void _onItemTappedBackEnabled(_index) {
    switch (_index) {
      case 0:
        _goBack();
        break;
      case 1:
        _goToCart();
        break;
      case 2:
        _goToMyOrders();
        break;
    }
  }
*/
}