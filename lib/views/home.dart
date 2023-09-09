import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:receipe/models/models.dart';
import 'package:receipe/views/recipe_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Recipemodels> recipe = List<Recipemodels>.empty();
  TextEditingController textEditingController = TextEditingController();
  String applicationId = "ae5c58a3";
  String applicationKey = "b2ebfdac1a227601487ec73de7e422f1";

  getRecipe(String query) async {
    String url =
        "https://api.edamam.com/search?q=${textEditingController.text}&app_id=ae5c58a3&app_key=b2ebfdac1a227601487ec73de7e422f1";

    var response = await http.get(url as Uri);
    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata["Hits"].forEach((element) {
      print(element.toString());
      Recipemodels recipemodel = new Recipemodels(
        url: 'url',
        image: 'image',
        label: 'label',
        source: 'source',
      );
      recipemodel = Recipemodels.fromMap(element["recipe"]);
      recipe.add(recipemodel);
    });
    print("${recipe.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color(0xff213A50),
          const Color(0xff071930),
        ])),
      ),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment:
                  kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Text("Kapoor",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
                Text(
                  "Recipe",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "What will you cook today?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Just enter the name of the ingredients and we will show you the best recipe related to it.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              hintText: " Enter Ingredients",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white60,
                              )),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: () {
                      if (textEditingController.text.isEmpty) {
                        getRecipe(textEditingController.text);
                        print('Just do it');
                      } else {
                        print("Just don't do it");
                      }
                    },
                    child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
                SizedBox(
                  height: 30,
                ),

              ],
            ),
          ],
        ),
      )
    ]));
  }
}

class RecipieTile extends StatefulWidget {
  final String title, desc, imgUrl, url;

  RecipieTile(
      {required this.title,
      required this.desc,
      required this.imgUrl,
      required this.url});

  @override
  _RecipieTileState createState() => _RecipieTileState();
}

class _RecipieTileState extends State<RecipieTile> {
  _launchURL(String url) async {
    print(url);
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: <Widget>[
      GestureDetector(
        onTap: () {
          if (kIsWeb) {
            _launchURL(widget.url);
          } else {
            print(widget.url + " this is what we are going to see");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeView(
                          postUrl: widget.url,
                        )));
          }
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: Stack(
            children: [
              Image.network(
                widget.imgUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.white30, Colors.white],
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                  )),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontFamily: 'Overpass'),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular'),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )
    ]);
  }
}
