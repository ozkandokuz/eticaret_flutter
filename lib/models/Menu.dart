import 'dart:convert';

class Menu {
  final int id;
  final String title;
  final String url;

  Menu({ this.id, this.title,this.url});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(

      id: json['men_id'],
      title: json['men_name'],
      url: json['men_link'],

    );
  }

  Map toJson() {
    return {'id': id, 'title': title,'url':url};
  }
}
