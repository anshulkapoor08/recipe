import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  String applicationId = "ae5c58a3";
  String applicationKey = "b2ebfdac1a227601487ec73de7e422f1";

  getRecipe(String query){

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
                  width: MediaQuery.of(context).size.width*0.7,
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
                              )
                          ),
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
                  onTap: (){
                    if(textEditingController.text.isEmpty){
                      getRecipe(textEditingController.text);
                      print('Just do it');
                    }
                    else{
                      print("Just don't do it");
                    }
                  },
                    child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                    )
                ),
              ],
            ),


          ],
        ),
      )
    ]));
  }
}
