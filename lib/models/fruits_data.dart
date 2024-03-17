class Fruit {
  final String name;
  final String image;
  final int calories;
  final double pricePerKilogram;
  final String description;

  Fruit({
    required this.name,
    required this.image,
    required this.calories,
    required this.pricePerKilogram,
    required this.description,
  });
}

List<Fruit> fruits = [
  Fruit(
    name: "Apple",
    image: "assets/images/Apple.png",
    calories: 52,
    pricePerKilogram: 2.5,
    description: "Apples are one of the healthiest fruits, rich in fiber and vitamin C.",
  ),
  Fruit(
    name: "Banana",
    image: "assets/images/Banana.png",
    calories: 89,
    pricePerKilogram: 1.8,
    description: "Bananas are a great source of potassium and provide quick energy.",
  ),
  Fruit(
    name: "Orange",
    image: "assets/images/Orange.png",
    calories: 36,
    pricePerKilogram: 1.8,
    description: "Oranges are famous for their high vitamin C content and refreshing taste.",
  ),
  Fruit(
    name: "Peach",
    image: "assets/images/Peach.png",
    calories: 87,
    pricePerKilogram: 1.8,
    description: "Peaches are sweet, juicy fruits that are low in calories and rich in vitamins A and C.",
  ),
  Fruit(
    name: "Pineapple",
    image: "assets/images/Ananas.png",
    calories: 54,
    pricePerKilogram: 1.8,
    description: "Pineapples are tropical fruits known for their sweet and tangy flavor.",
  ),
  Fruit(
    name: "Grapes",
    image: "assets/images/Graps.png",
    calories: 38,
    pricePerKilogram: 1.8,
    description: "Grapes are small, juicy fruits that come in various colors and are packed with antioxidants.",
  ),
  Fruit(
    name: "Kiwi",
    image: "assets/images/Kiwi.png",
    calories: 89,
    pricePerKilogram: 1.8,
    description: "Kiwis are small fruits with a fuzzy brown exterior and bright green flesh. They are rich in vitamin C and dietary fiber.",
  ),
  Fruit(
    name: "Watermelon",
    image: "assets/images/Watermelon.png",
    calories: 30,
    pricePerKilogram: 1.8,
    description: "Watermelons are large, juicy fruits with a high water content. They are refreshing and low in calories.",
  ),
];

