import 'dart:convert';

class Album {
  final int id;
  final String title;
  final String url;

  Album({ this.id, this.title,this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(

      id: json['id'],
      title: json['title'],
      url: json['url'],

    );
  }

  Map toJson() {
    return {'id': id, 'title': title,'url':url};
  }
}
