/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Razzaq razzaqFromJson(String str) => Razzaq.fromJson(json.decode(str));

String razzaqToJson(Razzaq data) => json.encode(data.toJson());

class Razzaq {
    Razzaq({
        required this.products,
    });

    List<Product> products;

    factory Razzaq.fromJson(Map<dynamic, dynamic> json) => Razzaq(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.image,
        required this.color,
        required this.price,
        required this.name,
        required this.id,
        required this.desc,
    });

    String image;
    String color;
    int price;
    String name;
    int id;
    String desc;

    factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        image: json["image"],
        color: json["color"],
        price: json["price"],
        name: json["name"],
        id: json["id"],
        desc: json["desc"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "color": color,
        "price": price,
        "name": name,
        "id": id,
        "desc": desc,
    };
}
