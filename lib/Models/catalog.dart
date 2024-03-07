class CatalogModel {

  // static final catModal = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModal;

  // static List<Item> items;
  static List<Item> items = [
    Item(
        image:
            "https://adminapi.applegadgetsbd.com/storage/media/large/1533-48820.jpg",
        color: "#3305a",
        price: 999,
        name: "iPhone 12 Pro",
        id: 1,
        desc: "Apple iPhone 12th generation")
  ];
// Get by Id
  Item getbyId(int id) => items.firstWhere((element) => element.id == id, orElse: null);
  // Get by Position
  Item getbyPosition(int pos) => items[pos];

}

class Item {
  final String image;
  final String color;
  final int price;
  final int id;
  final String desc;
  final String name;
  Item(
      {
       required this.image,
        required this.color,
        required this.price,
        required this.name,
        required this.id,
        required this.desc});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      image: map["image"],
      color: map["color"],
      price: map["price"],
      name: map["name"],
      id: map["id"],
      desc: map["desc"],
    );
  }
  toMap() =>
      {
        "id": id,
        "name": name,
        "image": image,
        "color": color,
        "price": price,
        "desc": desc

      };
}
