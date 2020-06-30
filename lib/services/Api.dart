import 'dart:async';
import 'package:http/http.dart' as http;

class api {
  static Future getUrl(url) {
    return http.get(url);
  }
}