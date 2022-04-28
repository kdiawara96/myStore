import 'package:mystore/Articlemodel.dart';
import 'package:flutter/material.dart';

import 'Articlemodel.dart';

class Description extends StatelessWidget {
  final ArticleList articles;

  const Description({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = articles.isUrgent;
    return Scaffold(
      appBar: AppBar(
        //rendre le background de la appBar transparente
        elevation: 10.0,
        centerTitle: true,
        title: Text(
          articles.title as String,
          style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF363f93),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, color: Colors.black, size: 30.0),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Date: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: "${articles.creationDate}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.network(
                articles.imagesUrl!.thumb as String,
                width: 480,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Category: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: "${articles.categoryId as int}",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF375f93),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Price: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: "${articles.price as double}\$",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  if (value == true) ...[
                    const Text(
                      "Urgent",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else ...[
                    const Text(
                      " Not Urgent",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 20),
                child: Text(
                  articles.description as String,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
      ]),

      /* body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 2,
              child: Column(
                children: [
                  Card(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(articles.imagesUrl),
                        //cheked exception of image
                        onError: (exception, stackTrace) => exception,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
                  Text(
                    articles.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF363f93),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    articles.description,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}

showDialogfun(
  BuildContext context,
  String imagesUrl,
  String description,
  String title,
) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  /* SizedBox(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(_Article[i].imagesUrl),
                        //cheked exception of image
                        onError: (exception, stackTrace) => exception,
                        fit: BoxFit.fill,
                      ))),*/
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

/*
class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
  final _Article = <Articles>[];
  // final _Images = <Images>[];

  Future<void> _loadData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json'));

    setState(() {
      final List dataList = json.decode(response.body);

      for (final item in dataList) {
        Map obj = item;
        Map images_url = obj['images_url'];
        String thumb = images_url['thumb'] ?? "";

        final id = item['id'] as int? ?? 0;
        final categori = item['category_id'] as int? ?? 0;

        final title = item['title'] as String? ?? '';
        final description = item['description'] as String? ?? '';

        final price = item['price'] as double? ?? 0.0;
        final imagesUrl = thumb;
        final date = item['creation_date'] as String? ?? "";
        final urgent = item['is_urgent'] as bool? ?? false;

        // final url = item[] as String? ?? '';
        final articles = Articles(
            id, categori, title, description, price, imagesUrl, date, urgent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
