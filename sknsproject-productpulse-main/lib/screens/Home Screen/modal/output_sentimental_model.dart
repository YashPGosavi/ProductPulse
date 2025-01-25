import 'dart:convert';

class SentimentalModel {
  GroupedReviews? groupedReviews;
  double? positivePercentage;
  double? negativePercentage;
  double? neutralPercentage;
  double? botPercentage;
  double? averageRating;
  RatingPercentages? ratingPercentages;
  SentimentPercentages? sentimentPercentages;
  String? overallRecommendation;

  SentimentalModel({
    this.groupedReviews,
    this.positivePercentage,
    this.negativePercentage,
    this.neutralPercentage,
    this.botPercentage,
    this.averageRating,
    this.ratingPercentages,
    this.sentimentPercentages,
    this.overallRecommendation,
  });

  factory SentimentalModel.fromRawJson(String str) =>
      SentimentalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SentimentalModel.fromJson(Map<String, dynamic> json) =>
      SentimentalModel(
        groupedReviews: json["grouped_reviews"] == null
            ? null
            : GroupedReviews.fromJson(json["grouped_reviews"]),
        positivePercentage: json["positive_percentage"]?.toDouble(),
        negativePercentage: json["negative_percentage"]?.toDouble(),
        neutralPercentage: json["neutral_percentage"]?.toDouble(),
        botPercentage: json["bot_percentage"]?.toDouble(),
        averageRating: json["average_rating"]?.toDouble(),
        ratingPercentages: json["rating_percentages"] == null
            ? null
            : RatingPercentages.fromJson(json["rating_percentages"]),
        sentimentPercentages: json["sentiment_percentages"] == null
            ? null
            : SentimentPercentages.fromJson(json["sentiment_percentages"]),
        overallRecommendation: json["overall_recommendation"],
      );

  Map<String, dynamic> toJson() => {
        "grouped_reviews": groupedReviews?.toJson(),
        "positive_percentage": positivePercentage,
        "negative_percentage": negativePercentage,
        "neutral_percentage": neutralPercentage,
        "bot_percentage": botPercentage,
        "average_rating": averageRating,
        "rating_percentages": ratingPercentages?.toJson(),
        "sentiment_percentages": sentimentPercentages?.toJson(),
        "overall_recommendation": overallRecommendation,
      };
}

class GroupedReviews {
  List<Bot>? bot;
  List<Bot>? neutral;
  List<Bot>? positive;

  GroupedReviews({
    this.bot,
    this.neutral,
    this.positive,
  });

  factory GroupedReviews.fromRawJson(String str) =>
      GroupedReviews.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GroupedReviews.fromJson(Map<String, dynamic> json) => GroupedReviews(
        bot: json["Bot"] == null
            ? []
            : List<Bot>.from(json["Bot"]!.map((x) => Bot.fromJson(x))),
        neutral: json["Neutral"] == null
            ? []
            : List<Bot>.from(json["Neutral"]!.map((x) => Bot.fromJson(x))),
        positive: json["Positive"] == null
            ? []
            : List<Bot>.from(json["Positive"]!.map((x) => Bot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Bot":
            bot == null ? [] : List<dynamic>.from(bot!.map((x) => x.toJson())),
        "Neutral": neutral == null
            ? []
            : List<dynamic>.from(neutral!.map((x) => x.toJson())),
        "Positive": positive == null
            ? []
            : List<dynamic>.from(positive!.map((x) => x.toJson())),
      };
}

class Bot {
  String? user;
  String? reviewTitle;
  String? text;
  String? sentiment;
  bool? buy;
  int? rating;

  Bot({
    this.user,
    this.reviewTitle,
    this.text,
    this.sentiment,
    this.buy,
    this.rating,
  });

  factory Bot.fromRawJson(String str) => Bot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bot.fromJson(Map<String, dynamic> json) => Bot(
        user: json["user"],
        reviewTitle: json["review_title"],
        text: json["text"],
        sentiment: json["sentiment"],
        buy: json["buy"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "review_title": reviewTitle,
        "text": text,
        "sentiment": sentiment,
        "buy": buy,
        "rating": rating,
      };
}

class RatingPercentages {
  double? the1;
  double? the2;
  double? the3;
  double? the4;
  double? the5;

  RatingPercentages({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
  });

  factory RatingPercentages.fromRawJson(String str) =>
      RatingPercentages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingPercentages.fromJson(Map<String, dynamic> json) =>
      RatingPercentages(
        the1: json["1"]?.toDouble(),
        the2: json["2"]?.toDouble(),
        the3: json["3"]?.toDouble(),
        the4: json["4"]?.toDouble(),
        the5: json["5"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
      };
}

class SentimentPercentages {
  double? positive;
  double? negative;
  double? neutral;
  double? bot;

  SentimentPercentages({
    this.positive,
    this.negative,
    this.neutral,
    this.bot,
  });

  factory SentimentPercentages.fromRawJson(String str) =>
      SentimentPercentages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SentimentPercentages.fromJson(Map<String, dynamic> json) =>
      SentimentPercentages(
        positive: json["Positive"]?.toDouble(),
        negative: json["Negative"]?.toDouble(),
        neutral: json["Neutral"]?.toDouble(),
        bot: json["Bot"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Positive": positive,
        "Negative": negative,
        "Neutral": neutral,
        "Bot": bot,
      };
}
