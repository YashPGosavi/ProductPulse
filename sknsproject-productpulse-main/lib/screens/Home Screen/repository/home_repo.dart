import 'dart:convert';
import 'dart:developer';

import 'package:prodpulseversion3/constant/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:prodpulseversion3/screens/Home%20Screen/modal/cart_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/new_prod_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/news_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/output_sentimental_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/product_model.dart';

class HomeRepository {
  HomeRepository._();

  static final HomeRepository instance = HomeRepository._();
  Future<SentimentalModel> postData({required List<dynamic> list}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"reviews": list}),
      );
      log(response.body.toString(), name: 'response');
      if (response.statusCode == 200) {
        return SentimentalModel.fromJson(jsonDecode(response.body));
      }
      return SentimentalModel();
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }

  Future<CartModel> postCartData(
      {required String image,
      required String product,
      required String link}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.cartApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"image": image, "buyLink": link, "product": product}),
      );
      log(response.body.toString());
      var decodedData = jsonDecode(response.body);
      print('response ${response.body}');
      if (response.statusCode == 200) {
        return CartModel.fromJson(decodedData['data']);
      }
      return CartModel();
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }

  Future<List<CartModel>> getCart() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstant.cartApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<CartModel> list = [];
        for (var json in decodedData['data']) {
          list.add(CartModel.fromJson(json));
        }
        return list;
      }
      return [];
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }

  Future<List<ProductModel>> getProducts({required String searchQuery}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.searchProd),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {"product_name": searchQuery},
        ),
      );
      log(response.body.toString());
      var decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<ProductModel> list = [];
        for (var json in decodedData['products']) {
          list.add(ProductModel.fromJson(json));
        }
        return list;
      }
      return [];
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }

  Future<ProdModel> getProductsDetail(
      {required String title, required String url}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.prodDetail),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"title": title, "flipkart_link": url}),
      );
      log(response.body.toString());
      print('response ${response.body}');
      var decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ProdModel.fromJson(decodedData);
      }
      return ProdModel();
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }

  Future<List<NewsModel>> getNews() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstant.newsApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log(response.body.toString());
      var decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<NewsModel> list = [];
        for (var json in decodedData['articles']) {
          list.add(NewsModel.fromJson(json));
        }
        return list;
      }
      return [];
    } catch (e) {
      log(e.toString());
      print(e);
      rethrow;
    }
  }
}
