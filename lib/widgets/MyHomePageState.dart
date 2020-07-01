import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:app/widgets/NavDrawer.dart';
import 'package:app/utils/Constants.dart';
import 'package:app/widgets/MyHomePage.dart';
import 'package:app/widgets/MyAppBar.dart';
import 'package:app/widgets/MyBottomBar.dart';
//import 'package:app/models/ApiResult2.dart';
import 'package:app/Config/EnvironmentConfig.dart';



class MyHomePageState extends State<MyHomePage> {
  InAppWebViewController MyWebView;
  //ProgressDialog pr;
  String username="...";
  ValueNotifier<bool> back_button_notifier = ValueNotifier<bool>(false);
  ValueNotifier<int> cart_prd_count_notifier = ValueNotifier<int>(0);
  ValueNotifier<double> progress_notifier = ValueNotifier<double>(1.0);

  int cart_prd_count=0;
  //List<Menu> menu_items;
  //String weburl=Constants.BASE_URL+"?"+Constants.MOBILE_PARAMS;
  String weburl=EnvironmentConfig.getUrl()+"?"+Constants.MOBILE_PARAMS;
  StreamController<String> MyStreamController = StreamController<String>();
  bool back_button_enabled=false;
  String logo_url;


  //callback(newurl){}
  //final _key=UniqueKey();
  getUsername(){
    return username;
  }
  getCartPrdCount(){
    return cart_prd_count;
  }
  callback(newurl) {
    //setState(() {
      if(MyWebView!=null) {
        if (newurl == "back") {
          MyWebView.goBack();
        }
        else {
          this.weburl = newurl;
          MyWebView.loadUrl(url: weburl);
        }
      }
    //});
  }

  setProgess(p){
    progress_notifier.value=p;
    //print("Progress: "+p.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          /*
          FocusScope.of(context).requestFocus(new FocusNode());

          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }

           */
      },
      child: MaterialApp(
          home: Scaffold(
            //key: _scaffoldKey,
            drawer: NavDrawer(callback,getUsername),
            appBar: MyAppBar(callback,logo_url),
            bottomNavigationBar: MyBottomBar(callback,cart_prd_count_notifier,back_button_notifier),
            /*
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              mini: true,
              floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
              onPressed: () {},
            ),*/
            body: Stack(
              children:[
                Visibility (
                    visible: true,
                    child: Container(
                      child: InAppWebView(
                        initialUrl: this.weburl,
                        initialHeaders: {},
                        initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                              debuggingEnabled: true,
                            )
                        ),
                        onWebViewCreated: (InAppWebViewController controller) {
                          MyWebView = controller;
                          setProgess(0.0);
                        },
                        onLoadStart: (InAppWebViewController controller, String url) {

                            //this.weburl = url;
                          setProgess(0.0);
                        },

                        onLoadStop: (InAppWebViewController controller, String url) async {

                          //FocusScopeNode currentFocus = FocusScope.of(context);
                          /*
                          currentFocus.unfocus();
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                           */
                            setProgess(1.0);
                            //this.weburl = url;
                            if(url==EnvironmentConfig.getUrl()+"/"+"?"+Constants.MOBILE_PARAMS){
                              back_button_enabled=false;
                            }
                            else{
                              back_button_enabled=true;
                            }

                            _onPageFinished(controller);

                            //Map<String, dynamic> MobileInfoResult = await MyWebView.evaluateJavascript(source:'getMobileInfo();');
                            //_onPageFinished(MobileInfoResult);
                        },
                        onProgressChanged: (InAppWebViewController controller, int progress) {
                          setProgess(progress/100);
                        },
                      ),


                      ),
                  ),



                  ValueListenableBuilder(
                    builder: (BuildContext context, double value, Widget child) {
                      // This builder will only get called when the progress_notifier
                      // is updated.
                      return Visibility (
                          visible: value<1.0,
                          child: Stack(
                            children:[
                              Container(
                                color: Colors.white,
                              ),
                              Center(
                                  child: CircularProgressIndicator(
                                      value: value,
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                                  ),
                                )
                            ]
                          )
                      );
                    },
                    valueListenable: progress_notifier,
                  ),
              ]
             ),
          ),
      )
    );
  }
  _onPageFinished(myWebViewController) {
    myWebViewController.addJavaScriptHandler(handlerName: "sayHello", callback: (args) {
      // Here you receive all the arguments from the JavaScript side
      // that is a List<dynamic>
      cart_prd_count=int.parse(args[0].toString());
      username=args[1].toString();
      //cart_prd_count=args[0];
      cart_prd_count_notifier.value=cart_prd_count;
      //back_button_notifier.value=back_button_enabled;

      //print("From the JavaScript side:");
      //print(args);//+" cart_prd_count:"+cart_prd_count.toString());
      return "Hello from Dart";
    });
  }
  /*
  _onPageFinished(parsedJson) {

      final ApiResult2 MyApiResult = new ApiResult2.fromJson(parsedJson);

      username = MyApiResult.user_name;
      cart_prd_count = MyApiResult.cart_item_count;

      //print(username);
      cart_prd_count_notifier.value=cart_prd_count;
      back_button_notifier.value=back_button_enabled;
      //NavDrawerState.setState();

  }
  */
}