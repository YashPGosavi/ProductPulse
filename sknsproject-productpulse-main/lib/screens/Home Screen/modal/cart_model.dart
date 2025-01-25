import 'dart:convert';

class CartModel {
  String? id;
  String? product;
  String? image;
  String? buyLink;
  String? createdAt;
  String? updatedAt;
  int? v;

  CartModel({
    this.id,
    this.product,
    this.image,
    this.buyLink,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartModel.fromRawJson(String str) =>
      CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"],
        product: json["product"],
        image: json["image"],
        buyLink: json["buyLink"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product,
        "image": image,
        "buyLink": buyLink,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
