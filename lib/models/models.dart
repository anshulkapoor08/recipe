class Recipemodels {
  String label;
  String image;
  String source;
  String url;

  Recipemodels({required this.url, required this.image,required this.label,required this.source});
  factory Recipemodels.fromMap(Map<String, dynamic> parsedJson) {
    return Recipemodels(
      url: parsedJson["url"],
      label: parsedJson["label"],
      source: parsedJson["source"],
      image: parsedJson["image"],
    );
  }
}
