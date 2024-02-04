import 'dart:math';

import '../models/coffee.dart';
import '../models/ingredient.dart';

enum CoffeeCategory {
  cappuccino,
  espresso,
  americano,
  macchiato,
  latte,
  frappe,
}

final Map<CoffeeCategory, String> coffeeCategoryNames = {
  CoffeeCategory.cappuccino: 'Cappuccino',
  CoffeeCategory.espresso: 'Espresso',
  CoffeeCategory.americano: 'Americano',
  CoffeeCategory.macchiato: 'Macchiato',
  CoffeeCategory.latte: 'Latte',
  CoffeeCategory.frappe: 'Frappé',
};

final List<Ingredient> ingredientList = [
  Ingredient(name: 'Milk', svgPath: 'assets/icons/milk.svg'),
  Ingredient(name: 'Chocolate', svgPath: 'assets/icons/chocolate.svg'),
  Ingredient(name: 'Nut free', svgPath: 'assets/icons/nut-free-svgrepo-com.svg'),
  Ingredient(name: 'Gluten free', svgPath: 'assets/icons/gluten-free-svgrepo-com.svg'),
  Ingredient(name: 'Gluten', svgPath: 'assets/icons/gluten-svgrepo-com.svg'),
  Ingredient(name: 'Hazelnut', svgPath: 'assets/icons/hazelnut-svgrepo-com.svg'),
];

List<Ingredient> randomSelect(List<Ingredient> list) {
  List<Ingredient> newList = [];
  for (int i = 0; i < 2; i++) {
    int index = Random().nextInt(list.length);
    newList.add(list[index]);
  }
  return newList;
}

const String temporaryUrl = "https://coffee.alexflipnote.dev/random";

List<Coffee> cappuchinoCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the classic flavor of our Cappuccino. Crafted with rich espresso, steamed milk, and a touch of frothed milk, this coffee offers a creamy and satisfying experience.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Velvet Delight Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description: "Experience the smoothness of our Velvet Delight Cappuccino. Featuring a velvety blend of espresso, silky steamed milk, and frothed milk, this coffee provides a luxurious taste.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Bliss Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Savor the sweetness of our Caramel Bliss Cappuccino. Infused with caramel syrup, this delightful blend of espresso, steamed milk, and frothed milk creates a caramel-infused coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Hazelnut Elegance Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Elevate your taste buds with our Hazelnut Elegance Cappuccino. Featuring the rich flavor of hazelnut, combined with espresso, steamed milk, and frothed milk, this coffee provides an elegant and nutty experience.",
    imageUrl: temporaryUrl,
    rating: 4.7,
    price: 4.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Harmony Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Discover the perfect balance of chocolate and coffee in our Mocha Harmony Cappuccino. Blending espresso, steamed milk, frothed milk, and chocolate, this coffee creates a harmonious and indulgent flavor.",
    imageUrl: temporaryUrl,
    rating: 4.4,
    price: 4.3,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Dream Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to a world of sweetness with our Vanilla Dream Cappuccino. Infused with vanilla syrup, this blend of espresso, steamed milk, and frothed milk offers a dreamy and aromatic experience.",
    imageUrl: temporaryUrl,
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Cinnamon Spice Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Warm up your senses with our Cinnamon Spice Cappuccino. Infused with cinnamon flavor, this delightful blend of espresso, steamed milk, and frothed milk creates a spicy and comforting coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Irish Cream Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the richness of our Irish Cream Cappuccino. Infused with the flavor of Irish cream, this blend of espresso, steamed milk, and frothed milk offers a smooth and delightful coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.6,
    price: 4.4,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Bliss Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to the tropics with our Coconut Bliss Cappuccino. Infused with coconut flavor, this blend of espresso, steamed milk, and frothed milk offers a tropical and refreshing coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.1,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Spiced Chai Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description: "Warm up with our Spiced Chai Cappuccino. Infused with chai spices, this blend of espresso, steamed milk, and frothed milk creates a spiced and aromatic coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.1,
  ),
];

List<Coffee> espressocoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description: "Savor the pure essence of our Classic Espresso. This intense and concentrated coffee shot delivers a bold and rich flavor that espresso enthusiasts crave.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 3.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Double Shot Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description: "For an extra kick, try our Double Shot Espresso. Two shots of pure espresso deliver a powerful and invigorating coffee experience that will awaken your senses.",
    imageUrl: temporaryUrl,
    rating: 4.7,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Espresso Macchiato',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description: "Experience the simplicity of our Espresso Macchiato. A shot of espresso with just a hint of frothed milk creates a perfect balance of boldness and creaminess.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Infusion Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the sweetness of our Caramel Infusion Espresso. A drizzle of caramel enhances the rich and intense flavor of the espresso, creating a delightful coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.4,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Bliss Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description: "Escape to bliss with our Vanilla Bliss Espresso. Infused with vanilla notes, this espresso shot offers a smooth and aromatic coffee experience for vanilla lovers.",
    imageUrl: temporaryUrl,
    rating: 4.1,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Dark Chocolate Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the richness of our Dark Chocolate Espresso. A hint of dark chocolate complements the robust flavor of the espresso, creating a decadent and satisfying coffee indulgence.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.0,
  ),
];

List<Coffee> americanoCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Enjoy the timeless taste of our Classic Americano. Made with pure espresso and hot water, this coffee offers a bold and invigorating experience.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Bold Black Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Experience the richness of our Bold Black Americano. Crafted with intense espresso and hot water, this coffee delivers a strong and robust flavor.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Smooth Americano Blend',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the smoothness of our Americano Blend. Blending premium espresso with hot water, this coffee offers a delightful and balanced taste.",
    imageUrl: temporaryUrl,
    rating: 4.0,
    price: 3.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Crisp Morning Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Start your day with the freshness of our Crisp Morning Americano. Featuring high-quality espresso and hot water, this coffee provides a crisp and awakening flavor.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Golden Sunrise Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Experience the warmth of our Golden Sunrise Americano. Crafted with love and the perfect blend of espresso and hot water, this coffee brings a golden touch to your mornings.",
    imageUrl: temporaryUrl,
    rating: 4.8,
    price: 4.5,
  ),
];

List<Coffee> macchiatoCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description: "Savor the simplicity of our Classic Macchiato. A perfect balance of espresso and a dollop of frothed milk, creating a delightful and lightly creamy coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Drizzle Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the sweetness of our Caramel Drizzle Macchiato. A drizzle of caramel enhances the rich espresso and frothed milk, creating a deliciously caramel-infused coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Harmony Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description: "Experience the harmony of flavors in our Vanilla Harmony Macchiato. Infused with vanilla, the blend of espresso and frothed milk offers a smooth and aromatic coffee indulgence.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Hazelnut Bliss Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Elevate your senses with our Hazelnut Bliss Macchiato. Featuring the rich flavor of hazelnut, this macchiato combines espresso and frothed milk for a nutty and delightful coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.7,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Dream Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description: "Escape to a tropical dream with our Coconut Dream Macchiato. Infused with coconut, this macchiato blends espresso and frothed milk for a refreshing and exotic coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Indulgence Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the richness of our Mocha Indulgence Macchiato. A perfect blend of chocolate, espresso, and frothed milk creates a decadent and satisfying coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.4,
    price: 4.3,
  ),
];

List<Coffee> latteCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the classic taste of our Classic Latte. A perfect blend of espresso and steamed milk creates a smooth and creamy coffee experience that is sure to delight your senses.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Swirl Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Satisfy your sweet cravings with our Caramel Swirl Latte. A swirl of caramel, espresso, and steamed milk creates a delightful and indulgent coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Bean Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Experience the richness of our Vanilla Bean Latte. Infused with real vanilla beans, this latte combines espresso and steamed milk for a luxurious and aromatic coffee indulgence.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Hazelnut Heaven Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description:
        "Elevate your senses with our Hazelnut Heaven Latte. Featuring the rich flavor of hazelnut, this latte combines espresso and steamed milk for a nutty and delightful coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.7,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Cream Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Escape to a tropical paradise with our Coconut Cream Latte. Infused with coconut, this latte combines espresso and steamed milk for a refreshing and exotic coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Delight Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the delightful combination of chocolate and coffee with our Mocha Delight Latte. A perfect blend of chocolate, espresso, and steamed milk creates a decadent and satisfying coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.4,
    price: 4.3,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Irish Cream Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the smoothness of our Irish Cream Latte. Infused with the flavor of Irish cream, this latte combines espresso and steamed milk for a delightful and creamy coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.6,
    price: 4.4,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Cinnamon Roll Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the sweetness of our Cinnamon Roll Latte. Infused with cinnamon flavor, this latte combines espresso and steamed milk for a comforting and aromatic coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Salted Caramel Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Enjoy the perfect balance of sweet and salty with our Salted Caramel Latte. A touch of salted caramel enhances the espresso and steamed milk for a delicious coffee indulgence.",
    imageUrl: temporaryUrl,
    rating: 4.8,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Maple Pecan Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the warmth of fall with our Maple Pecan Latte. Infused with maple and pecan flavors, this latte combines espresso and steamed milk for a cozy and comforting coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.1,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Almond Joy Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the flavors of almond, coconut, and chocolate with our Almond Joy Latte. This latte combines espresso and steamed milk for a delightful and indulgent coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.1,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Peppermint Mocha Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description:
        "Get into the holiday spirit with our Peppermint Mocha Latte. Infused with peppermint and chocolate, this latte combines espresso and steamed milk for a festive and flavorful coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.3,
  ),
];

List<Coffee> frappeCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description: "Cool down with the classic taste of our Classic Frappé. A delightful blend of espresso, ice, and creamy goodness creates a refreshing and icy coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Madness Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the madness of chocolate and coffee with our Mocha Madness Frappé. A perfect blend of chocolate, espresso, ice, and creamy goodness creates a decadent and satisfying frozen coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Crunch Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description: "Satisfy your sweet tooth with our Caramel Crunch Frappé. A swirl of caramel, ice, and creamy goodness creates a delightful and crunchy frozen coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.3,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Bean Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the richness of our Vanilla Bean Frappé. Infused with real vanilla beans, this frozen delight combines espresso, ice, and creamy goodness for a luxurious and aromatic coffee treat.",
    imageUrl: temporaryUrl,
    rating: 4.7,
    price: 4.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Bliss Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to a tropical bliss with our Coconut Bliss Frappé. Infused with coconut, this frozen treat combines espresso, ice, and creamy goodness for a refreshing and exotic coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Strawberry Delight Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the delightful sweetness of our Strawberry Delight Frappé. Made with fresh strawberries, ice, and creamy goodness, this frozen treat offers a fruity and refreshing coffee experience.",
    imageUrl: temporaryUrl,
    rating: 4.2,
    price: 4.0,
  ),
];

List coffeeList = americanoCoffeeList + cappuchinoCoffeeList + espressocoffeeList + frappeCoffeeList + latteCoffeeList + macchiatoCoffeeList;
