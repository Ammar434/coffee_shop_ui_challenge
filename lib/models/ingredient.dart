class Ingredient {
  final String name;
  final String svgPath;

  Ingredient({required this.name, required this.svgPath});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      svgPath: json['svgPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'svgPath': svgPath,
    };
  }
}
