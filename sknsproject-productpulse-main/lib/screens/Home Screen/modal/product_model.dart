import 'dart:convert';

class ProductModel {
  String? imageUrl;
  String? productLink;
  String? title;

  ProductModel({
    this.imageUrl,
    this.productLink,
    this.title,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        imageUrl: json["image_url"],
        productLink: json["product_link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "product_link": productLink,
        "title": title,
      };
}
