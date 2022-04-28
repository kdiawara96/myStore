import 'package:mystore/API_Articles.dart';
import 'package:mystore/Articlemodel.dart';
import 'package:mystore/search.dart';
import 'package:flutter/material.dart';

import 'API_Articles.dart';
import 'Articlemodel.dart';
import 'description.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool coeur = false;
bool increDecre() {
  if (coeur) {
    return coeur = false;
  } else {
    return coeur = true;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    FetchArticle _articleList = FetchArticle();

    //declaration

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "MyStore",
            style: TextStyle(
                fontSize: 30,
                color: const Color(0xFF363f93),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          elevation: 10.0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchArticle());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Container(
          child: FutureBuilder<List<ArticleList>>(
            future: _articleList.getArticleList(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (contet, index) {
                  var value = data?[index].isUrgent;

                  //final dataItem2 = data!..sort((items0, items1)=>t );

                  final dataItem = data!
                    ..sort((items2, items3) {
                      if (items2.isUrgent == false) {
                        return items2.creationDate!
                            .compareTo(items3.creationDate!);
                      }

                      return -1;
                    });

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            articles: dataItem[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 235,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 35,
                                  left: 20,
                                  child: Material(
                                    child: Container(
                                      height: 190.0,
                                      width: width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.9),
                                            offset: const Offset(
                                              -10.0,
                                              10.0,
                                            ),
                                            blurRadius: 20.0,
                                            spreadRadius: 4.0,
                                          ), //BoxShadow
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          //Loader avant le chargement de l'image
                                          const SizedBox(
                                            height: 200,
                                            width: 150,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                          //fin loader
                                          Card(
                                            elevation: 10.0,
                                            //Opacity designe la transparente
                                            shadowColor:
                                                Colors.grey.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              height: 200,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${dataItem[index].imagesUrl!.thumb}"),
                                                  //cheked exception of image
                                                  onError:
                                                      (exception, stackTrace) =>
                                                          exception,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  left: 200,
                                  child: SizedBox(
                                    height: 150,
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${dataItem[index].title}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF363f93),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(children: [
                                            const TextSpan(
                                              text: "Category: ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                                  " ${dataItem[index].categoryId} ",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ]),
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "${dataItem[index].price} \$",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
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
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 150,
                                  left: 365,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: increDecre,
                                        //le changement de l'icone si elle est favorable ou defavorble
                                        icon: coeur
                                            ? const Icon(
                                                Icons.favorite,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                              ),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
