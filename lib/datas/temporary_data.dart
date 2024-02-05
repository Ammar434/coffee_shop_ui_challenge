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

List<String> url = [
  " https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/302896/pexels-photo-302896.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/377903/pexels-photo-377903.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/3879495/pexels-photo-3879495.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/4264049/pexels-photo-4264049.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/1749303/pexels-photo-1749303.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/3020919/pexels-photo-3020919.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/1727123/pexels-photo-1727123.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/1627933/pexels-photo-1627933.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/2910874/pexels-photo-2910874.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/4349772/pexels-photo-4349772.jpeg?auto=compress&cs=tinysrgb&w=800",
  "https://images.pexels.com/photos/5464632/pexels-photo-5464632.jpeg?auto=compress&cs=tinysrgb&w=800",
];

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

String randomSelectString(List<String> list) {
  int index = Random().nextInt(list.length);
  return list[index];
}

List<Coffee> cappuchinoCoffeeList = [
  Coffee(
    review: Random().nextInt(1000),
    name: 'Classic Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the timeless elegance of our Classic Cappuccino. Crafted with a perfect balance of rich espresso, carefully steamed milk, and a velvety touch of frothed milk, this coffee offers a creamy and satisfying experience. The combination of high-quality ingredients results in a classic cappuccino that's rich, smooth, and authentically delightful. Perfect for those who appreciate the simplicity and authenticity of a classic cappuccino.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Velvet Delight Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Immerse yourself in the luxurious smoothness of our Velvet Delight Cappuccino. This exquisite blend features a velvety combination of finely brewed espresso, silky steamed milk, and a luscious froth that creates a truly indulgent and satisfying taste. The result is a cappuccino experience that goes beyond expectations, providing a velvety texture and rich flavor. Elevate your coffee experience with a touch of Velvet Delight.",
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Bliss Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Savor the sweetness of our Caramel Bliss Cappuccino. Infused with luscious caramel syrup, this delightful blend of freshly brewed espresso, expertly steamed milk, and a rich froth creates a caramel-infused coffee experience that is both indulgent and comforting. The caramel adds a layer of complexity to the flavor profile, providing a perfect balance of sweetness and coffee richness. Treat yourself to the blissful taste of caramel in every sip.",
    imageUrl: randomSelectString(url),
    rating: 4.3,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Hazelnut Elegance Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Elevate your taste buds with our Hazelnut Elegance Cappuccino. Immerse yourself in the rich and nutty flavor of premium hazelnuts, perfectly blended with finely brewed espresso, velvety steamed milk, and a luxurious froth. This coffee provides an elegant and indulgent experience, perfect for those who appreciate a sophisticated twist to their cappuccino. Hazelnut Elegance is more than a drink; it's a sensory journey.",
    imageUrl: randomSelectString(url),
    rating: 4.7,
    price: 4.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Harmony Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Discover the perfect harmony of chocolate and coffee in our Mocha Harmony Cappuccino. This exquisite blend features a careful balance of finely brewed espresso, velvety steamed milk, a rich froth, and decadent chocolate. The result is a harmonious and indulgent flavor profile that combines the best of both worlds. Indulge your senses in the symphony of mocha goodness with every sip of Mocha Harmony.",
    imageUrl: randomSelectString(url),
    rating: 4.4,
    price: 4.3,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Dream Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to a world of sweetness with our Vanilla Dream Cappuccino. Infused with the delightful aroma of vanilla syrup, this blend of finely brewed espresso, velvety steamed milk, and a rich froth offers a dreamy and aromatic experience. Let the essence of vanilla transport you to a world of flavor and delight, making every sip of Vanilla Dream a moment of pure indulgence.",
    imageUrl: randomSelectString(url),
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Cinnamon Spice Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Warm up your senses with our Cinnamon Spice Cappuccino. Infused with the comforting and spicy flavor of cinnamon, this delightful blend of finely brewed espresso, velvety steamed milk, and a rich froth creates a unique and comforting coffee experience. Embrace the warmth and spice with every sip, making Cinnamon Spice the perfect choice for those seeking a cozy and aromatic cappuccino.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Irish Cream Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the richness of our Irish Cream Cappuccino. Infused with the smooth and delightful flavor of authentic Irish cream, this blend of finely brewed espresso, velvety steamed milk, and a luxurious froth offers a velvety and sophisticated coffee experience. Indulge in the luxurious taste of Irish cream with every sip, making Irish Cream Cappuccino the perfect choice for those seeking a rich and smooth coffee indulgence.",
    imageUrl: randomSelectString(url),
    rating: 4.6,
    price: 4.4,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Bliss Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to the tropics with our Coconut Bliss Cappuccino. Infused with the exotic flavor of coconut, this blend of finely brewed espresso, velvety steamed milk, and a rich froth offers a tropical and refreshing coffee experience. Let the coconut bliss transport you to a beachside paradise with every sip, making Coconut Bliss Cappuccino the perfect choice for those seeking a delicious and invigorating coffee escape.",
    imageUrl: randomSelectString(url),
    rating: 4.1,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Spiced Chai Cappuccino',
    category: CoffeeCategory.cappuccino,
    ingredients: randomSelect(ingredientList),
    description:
        "Warm up with our Spiced Chai Cappuccino. Infused with the aromatic spices of chai, this blend of finely brewed espresso, velvety steamed milk, and a rich froth creates a spiced and comforting coffee experience. Embrace the warmth and complexity of chai with every sip, making Spiced Chai Cappuccino the perfect choice for those seeking a soothing and aromatic cappuccino.",
    imageUrl: randomSelectString(url),
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
    description:
        "Savor the pure essence of our Classic Espresso. This intense and concentrated coffee shot delivers a bold and rich flavor that espresso enthusiasts crave. Carefully crafted with high-quality espresso beans, the Classic Espresso is a testament to the art of espresso making. Experience the robust notes and full-bodied profile that make this espresso a timeless favorite among coffee connoisseurs.",
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 3.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Double Shot Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "For an extra kick, try our Double Shot Espresso. Two shots of pure espresso deliver a powerful and invigorating coffee experience that will awaken your senses. This bold and energizing espresso is perfect for those who seek a stronger and more intense coffee flavor. With a higher caffeine content, the Double Shot Espresso is a go-to choice for those in need of a robust pick-me-up.",
    imageUrl: randomSelectString(url),
    rating: 4.7,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Espresso Macchiato',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the simplicity of our Espresso Macchiato. A shot of espresso with just a hint of frothed milk creates a perfect balance of boldness and creaminess. The Espresso Macchiato is a delightful choice for those who appreciate the essence of espresso but enjoy a touch of velvety smoothness. Each sip offers a harmonious blend of intense coffee flavor and a subtle creaminess, making it a timeless classic.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Infusion Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the sweetness of our Caramel Infusion Espresso. A drizzle of caramel enhances the rich and intense flavor of the espresso, creating a delightful coffee treat. The Caramel Infusion Espresso is a perfect harmony of sweetness and boldness, offering a decadent and satisfying coffee experience. Treat yourself to this indulgent blend that combines the richness of espresso with the sweet allure of caramel.",
    imageUrl: randomSelectString(url),
    rating: 4.4,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Bliss Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to bliss with our Vanilla Bliss Espresso. Infused with vanilla notes, this espresso shot offers a smooth and aromatic coffee experience for vanilla lovers. The Vanilla Bliss Espresso combines the boldness of espresso with the subtle sweetness of vanilla, creating a delightful fusion of flavors. Indulge in the smooth and aromatic richness of this espresso that brings a touch of bliss to your coffee routine.",
    imageUrl: randomSelectString(url),
    rating: 4.1,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Dark Chocolate Espresso',
    category: CoffeeCategory.espresso,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the richness of our Dark Chocolate Espresso. A hint of dark chocolate complements the robust flavor of the espresso, creating a decadent and satisfying coffee indulgence. The Dark Chocolate Espresso is a treat for those who appreciate the marriage of bold coffee and velvety dark chocolate. Each sip delivers a harmonious blend of intense espresso and the luxurious depth of dark chocolate, making it a perfect choice for a truly indulgent experience.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.3,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Bold Black Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Experience the richness of our Bold Black Americano. Crafted with intense espresso and hot water, this coffee delivers a strong and robust flavor.",
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Smooth Americano Blend',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the smoothness of our Americano Blend. Blending premium espresso with hot water, this coffee offers a delightful and balanced taste.",
    imageUrl: randomSelectString(url),
    rating: 4.0,
    price: 3.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Crisp Morning Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Start your day with the freshness of our Crisp Morning Americano. Featuring high-quality espresso and hot water, this coffee provides a crisp and awakening flavor.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Golden Sunrise Americano',
    category: CoffeeCategory.americano,
    ingredients: randomSelect(ingredientList),
    description: "Experience the warmth of our Golden Sunrise Americano. Crafted with love and the perfect blend of espresso and hot water, this coffee brings a golden touch to your mornings.",
    imageUrl: randomSelectString(url),
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
    description:
        "Savor the simplicity of our Classic Macchiato. A perfect balance of finely brewed espresso and a dollop of frothed milk creates a delightful and lightly creamy coffee experience. The Classic Macchiato is a timeless choice for those who appreciate the pure essence of espresso complemented by a subtle touch of velvety frothed milk. Indulge in the art of simplicity with every sip.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Drizzle Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the sweetness of our Caramel Drizzle Macchiato. A generous drizzle of caramel enhances the rich espresso and frothed milk, creating a deliciously caramel-infused coffee treat. The Caramel Drizzle Macchiato is a delightful fusion of bold espresso, creamy frothed milk, and sweet caramel notes. Treat yourself to this indulgent macchiato that combines the best of both worlds.",
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Harmony Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Experience the harmony of flavors in our Vanilla Harmony Macchiato. Infused with the subtle sweetness of vanilla, the blend of finely brewed espresso and frothed milk offers a smooth and aromatic coffee indulgence. The Vanilla Harmony Macchiato is a delightful symphony of bold coffee and velvety vanilla, creating a perfect balance for those who seek a harmonious and aromatic macchiato experience.",
    imageUrl: randomSelectString(url),
    rating: 4.3,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Hazelnut Bliss Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Elevate your senses with our Hazelnut Bliss Macchiato. Featuring the rich and nutty flavor of hazelnut, this macchiato combines finely brewed espresso and frothed milk for a nutty and delightful coffee experience. The Hazelnut Bliss Macchiato is a perfect choice for those who appreciate the luxurious combination of espresso and hazelnut, providing a nutty twist to the classic macchiato.",
    imageUrl: randomSelectString(url),
    rating: 4.7,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Dream Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Escape to a tropical dream with our Coconut Dream Macchiato. Infused with the exotic flavor of coconut, this macchiato blends finely brewed espresso and frothed milk for a refreshing and exotic coffee treat. The Coconut Dream Macchiato offers a taste of the tropics with every sip, providing a delightful escape for coconut lovers seeking a unique and invigorating macchiato experience.",
    imageUrl: randomSelectString(url),
    rating: 4.0,
    price: 3.9,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Mocha Indulgence Macchiato',
    category: CoffeeCategory.macchiato,
    ingredients: randomSelect(ingredientList),
    description:
        "Indulge in the richness of our Mocha Indulgence Macchiato. A perfect blend of premium chocolate, finely brewed espresso, and frothed milk creates a decadent and satisfying coffee experience. The Mocha Indulgence Macchiato is a delightful fusion of bold coffee and indulgent chocolate, providing a luscious treat for those who seek a truly satisfying and decadent macchiato.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 3.8,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Swirl Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Satisfy your sweet cravings with our Caramel Swirl Latte. A swirl of caramel, espresso, and steamed milk creates a delightful and indulgent coffee treat.",
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Vanilla Bean Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Experience the richness of our Vanilla Bean Latte. Infused with real vanilla beans, this latte combines espresso and steamed milk for a luxurious and aromatic coffee indulgence.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.7,
    price: 4.5,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Coconut Cream Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Escape to a tropical paradise with our Coconut Cream Latte. Infused with coconut, this latte combines espresso and steamed milk for a refreshing and exotic coffee experience.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.6,
    price: 4.4,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Cinnamon Roll Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the sweetness of our Cinnamon Roll Latte. Infused with cinnamon flavor, this latte combines espresso and steamed milk for a comforting and aromatic coffee treat.",
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 4.0,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Salted Caramel Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Enjoy the perfect balance of sweet and salty with our Salted Caramel Latte. A touch of salted caramel enhances the espresso and steamed milk for a delicious coffee indulgence.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.1,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Almond Joy Latte',
    category: CoffeeCategory.latte,
    ingredients: randomSelect(ingredientList),
    description: "Indulge in the flavors of almond, coconut, and chocolate with our Almond Joy Latte. This latte combines espresso and steamed milk for a delightful and indulgent coffee experience.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.5,
    price: 4.2,
  ),
  Coffee(
    review: Random().nextInt(1000),
    name: 'Caramel Crunch Frappé',
    category: CoffeeCategory.frappe,
    ingredients: randomSelect(ingredientList),
    description: "Satisfy your sweet tooth with our Caramel Crunch Frappé. A swirl of caramel, ice, and creamy goodness creates a delightful and crunchy frozen coffee treat.",
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
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
    imageUrl: randomSelectString(url),
    rating: 4.2,
    price: 4.0,
  ),
];

List coffeeList = americanoCoffeeList + cappuchinoCoffeeList + espressocoffeeList + frappeCoffeeList + latteCoffeeList + macchiatoCoffeeList;
