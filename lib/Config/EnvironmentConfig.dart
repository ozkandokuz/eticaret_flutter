import 'package:app/utils/Constants.dart';

class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment(
      'DEF_APP_NAME',
      defaultValue: 'awesomeApp'
  );
  static const APP_SUFFIX = String.fromEnvironment(
      'DEF_APP_SUFFIX',
      defaultValue: 'app'
  );
  static const APP_URL = String.fromEnvironment(
      'DEF_APP_URL',
      defaultValue: ''
  );

  static getUrl(){
    if(APP_URL!="") {
      return "https://" + APP_URL;
    }
    return "";
  }
}