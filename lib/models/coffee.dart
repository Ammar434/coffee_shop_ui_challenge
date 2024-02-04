import '../datas/temporary_data.dart';
import 'ingredient.dart';

class Coffee {
  final String name;
  final CoffeeCategory category;
  final List<Ingredient> ingredients;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final int review;

  Coffee({
    required this.name,
    required this.category,
    required this.ingredients,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.review,
  });
}
