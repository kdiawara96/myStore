import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Articlemodel.dart';

class FetchArticle {
  var data = [];
  List<ArticleList> results = [];

  String fetchurl =
      "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json";

  Future<List<ArticleList>> getArticleList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => ArticleList.fromJson(e)).toList();

        if (query != null) {
          results = results
              .where((element) =>
                  element.title!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        } /*else if (query != null) {
          result = results
              .where((element) =>
                  element.title!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }*/
      } else {
        print('API Error');
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
    return results;
  }
}
