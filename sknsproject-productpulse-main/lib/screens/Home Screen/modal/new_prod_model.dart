import 'dart:convert';

class ProdModel {
  AmazonDetails? amazonDetails;
  FlipkartDetails? flipkartDetails;
  List<Review>? reviews;
  String? title;

  ProdModel({
    this.amazonDetails,
    this.flipkartDetails,
    this.reviews,
    this.title,
  });

  factory ProdModel.fromRawJson(String str) =>
      ProdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProdModel.fromJson(Map<String, dynamic> json) => ProdModel(
        amazonDetails: json["amazon_details"] == null
            ? null
            : AmazonDetails.fromJson(json["amazon_details"]),
        flipkartDetails: json["flipkart_details"] == null
            ? null
            : FlipkartDetails.fromJson(json["flipkart_details"]),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "amazon_details": amazonDetails?.toJson(),
        "flipkart_details": flipkartDetails?.toJson(),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "title": title,
      };
}

class AmazonDetails {
  String? amazonBuyLink;
  int? amazonPrice;
  String? platform;
  String? title;

  AmazonDetails({
    this.amazonBuyLink,
    this.amazonPrice,
    this.platform,
    this.title,
  });

  factory AmazonDetails.fromRawJson(String str) =>
      AmazonDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AmazonDetails.fromJson(Map<String, dynamic> json) => AmazonDetails(
        amazonBuyLink: json["amazon_buy_link"],
        amazonPrice: json["amazon_price"],
        platform: json["platform"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "amazon_buy_link": amazonBuyLink,
        "amazon_price": amazonPrice,
        "platform": platform,
        "title": title,
      };
}

class FlipkartDetails {
  List<String>? colorStorage;
  String? deliveryBy;
  String? description;
  String? flipkartBuyLink;
  List<String>? flipkartOffers;
  int? flipkartPrice;
  List<String>? imageUrls;
  List<String>? paymentOptions;
  String? platform;
  String? productSpecifications;
  String? title;
  String? totalRating;

  FlipkartDetails({
    this.colorStorage,
    this.deliveryBy,
    this.description,
    this.flipkartBuyLink,
    this.flipkartOffers,
    this.flipkartPrice,
    this.imageUrls,
    this.paymentOptions,
    this.platform,
    this.productSpecifications,
    this.title,
    this.totalRating,
  });

  factory FlipkartDetails.fromRawJson(String str) =>
      FlipkartDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlipkartDetails.fromJson(Map<String, dynamic> json) =>
      FlipkartDetails(
        colorStorage: json["color_storage"] == null
            ? []
            : List<String>.from(json["color_storage"]!.map((x) => x)),
        deliveryBy: json["delivery_by"],
        description: json["description"],
        flipkartBuyLink: json["flipkart_buy_link"],
        flipkartOffers: json["flipkart_offers"] == null
            ? []
            : List<String>.from(json["flipkart_offers"]!.map((x) => x)),
        flipkartPrice: json["flipkart_price"],
        imageUrls: json["image_urls"] == null
            ? []
            : List<String>.from(json["image_urls"]!.map((x) => x)),
        paymentOptions: json["payment_options"] == null
            ? []
            : List<String>.from(json["payment_options"]!.map((x) => x)),
        platform: json["platform"],
        productSpecifications: json["product_specifications"],
        title: json["title"],
        totalRating: json["total_rating"],
      );

  Map<String, dynamic> toJson() => {
        "color_storage": colorStorage == null
            ? []
            : List<dynamic>.from(colorStorage!.map((x) => x)),
        "delivery_by": deliveryBy,
        "description": description,
        "flipkart_buy_link": flipkartBuyLink,
        "flipkart_offers": flipkartOffers == null
            ? []
            : List<dynamic>.from(flipkartOffers!.map((x) => x)),
        "flipkart_price": flipkartPrice,
        "image_urls": imageUrls == null
            ? []
            : List<dynamic>.from(imageUrls!.map((x) => x)),
        "payment_options": paymentOptions == null
            ? []
            : List<dynamic>.from(paymentOptions!.map((x) => x)),
        "platform": platform,
        "product_specifications": productSpecifications,
        "title": title,
        "total_rating": totalRating,
      };
}

class Review {
  String? comment;
  String? rating;
  String? reviewTitle;
  String? user;

  Review({
    this.comment,
    this.rating,
    this.reviewTitle,
    this.user,
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        comment: json["comment"],
        rating: json["rating"],
        reviewTitle: json["review_title"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "rating": rating,
        "review_title": reviewTitle,
        "user": user,
      };
}
