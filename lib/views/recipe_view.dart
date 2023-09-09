import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class RecipeView extends StatefulWidget {
  final String postUrl;
  const RecipeView({ required this.postUrl});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
