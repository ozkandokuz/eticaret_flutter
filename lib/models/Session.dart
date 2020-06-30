//import 'dart:convert';

class Session {
  final String token;
  final String userFullName;
  final String userEmail;
  final int userID;

  Session({ this.token, this.userFullName,this.userEmail,this.userID});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(

      token: json['token'],
      userFullName: json['userFullName'],
      userEmail: json['userEmail'],
      userID: json['userID'],

    );
  }

}
