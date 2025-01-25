import 'dart:convert';

class NewsModel {
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  Source? source;
  String? title;
  String? url;
  String? urlToImage;

  NewsModel({
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.source,
    this.title,
    this.url,
    this.urlToImage,
  });

  factory NewsModel.fromRawJson(String str) =>
      NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        author: json["author"],
        content: json["content"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "description": description,
        "publishedAt": publishedAt,
        "source": source?.toJson(),
        "title": title,
        "url": url,
        "urlToImage": urlToImage,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
