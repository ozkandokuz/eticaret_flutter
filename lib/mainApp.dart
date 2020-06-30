import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:app/widgets/MyApp.dart';
import 'package:app/widgets/Error.dart';
import 'package:app/utils/Constants.dart';
import 'package:app/Config/EnvironmentConfig.dart';
//import 'flavors.dart';

void mainApp() async {
  try{
    /*
    * EnvironmentConfig main.dart a parametre verilerek cagrilmasiyla olusuyor.
    * main.dart --dart-define=DEF_APP_URL=www.megakitap.com --dart-define=DEF_APP_NAME=MegaKitap --dart-define=DEF_APP_SUFFIX=.app
    */
    final base_url = EnvironmentConfig.getUrl();
    if(base_url!="") {
      final String url = base_url + "/?" +
          Constants.MOBILE_PARAMS + "&get_config=1";
      //print(url);
      await GlobalConfiguration().loadFromUrl(url);

      runApp(MyApp());
    }
    else{
      runApp(Error());
    }
  }catch(e){
    runApp(Error());
  }

}


