class Fruit {
  Fruit({
    required this.id,
    required this.name,
    required this.image,
    required this.calories,
    required this.pricePerKilogram,
    required this.description,
    required this.count,
  });

  final int calories;
  int count;
  final String description;
  final int id;
  final String image;
  final String name;
  final double pricePerKilogram;

  void setCount(int countValue) {
    count = countValue;
  }
}

List<Fruit> fruits = [
  Fruit(
    id: 0,
    count: 0,
    name: "Apple",
    image: "assets/images/Apple.png",
    calories: 52,
    pricePerKilogram: 2.5,
    description:
        "Apples are one of the healthiest fruits, rich in fiber and vitamin C.",
  ),
  Fruit(
    id: 1,
    count: 0,
    name: "Banana",
    image: "assets/images/Banana.png",
    calories: 89,
    pricePerKilogram: 1.8,
    description:
        "Bananas are a great source of potassium and provide quick energy.",
  ),
  Fruit(
    id: 2,
    count: 0,
    name: "Orange",
    image: "assets/images/Orange.png",
    calories: 36,
    pricePerKilogram: 1.8,
    description:
        "Oranges are famous for their high vitamin C content and refreshing taste.",
  ),
  Fruit(
    id: 3,
    count: 0,
    name: "Peach",
    image: "assets/images/Peach.png",
    calories: 87,
    pricePerKilogram: 1.8,
    description:
        "Peaches are sweet, juicy fruits that are low in calories and rich in vitamins A and C.",
  ),
  Fruit(
    id: 4,
    count: 0,
    name: "Pineapple",
    image: "assets/images/Ananas.png",
    calories: 54,
    pricePerKilogram: 1.8,
    description:
        "Pineapples are tropical fruits known for their sweet and tangy flavor.",
  ),
  Fruit(
    id: 5,
    count: 0,
    name: "Grapes",
    image: "assets/images/Graps.png",
    calories: 38,
    pricePerKilogram: 1.8,
    description:
        "Grapes are small, juicy fruits that come in various colors and are packed with antioxidants.",
  ),
  Fruit(
    id: 6,
    count: 0,
    name: "Kiwi",
    image: "assets/images/Kiwi.png",
    calories: 89,
    pricePerKilogram: 1.8,
    description:
        "Kiwis are small fruits with a fuzzy brown exterior and bright green flesh. They are rich in vitamin C and dietary fiber.",
  ),
  Fruit(
    id: 7,
    count: 0,
    name: "Watermelon",
    image: "assets/images/Watermelon.png",
    calories: 30,
    pricePerKilogram: 1.8,
    description:
        "Watermelons are large, juicy fruits with a high water content. They are refreshing and low in calories.",
  ),
];
