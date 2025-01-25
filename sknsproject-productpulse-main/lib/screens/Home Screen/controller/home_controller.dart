import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/cart_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/new_prod_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/news_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/output_sentimental_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/product_model.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/repository/home_repo.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }

  TextEditingController searchController = TextEditingController();

  List<ProductModel> productModelList = [];
  List<ProductModel> filterModelList = [];
  ProductModel? selectedProductModel;
  RxString dropDownVal = 'Select'.obs;
  RxBool isLoading = false.obs;
  RxBool isCartLoading = false.obs;
  SentimentalModel? sentimentalModel;
  List<Map<String, dynamic>> sentimentInputList = [];

  fillSentimentInput({required List<Review> list}) async {
    for (int i = 0; i < list.length; i++) {
      sentimentInputList.add({
        "user": list[i].user!,
        "rating": list[i].rating!.toString(),
        "comment": list[i].comment!,
        "review_title": list[i].reviewTitle,
      });
    }

    await postReviewData(list: sentimentInputList);
  }

  Future<void> postReviewData({required List<dynamic> list}) async {
    isDataLoading.value = true;
    try {
      final response = await HomeRepository.instance.postData(
        list: list,
      );
      sentimentalModel = response;
      isDataLoading.value = false;
    } catch (e) {
      log("Error loading data: $e");
    }
  }

  RxBool isDataLoading = false.obs;

  Future<void> getData(String search) async {
    productModelList.clear();
    filterModelList.clear();
    isLoading.value = true;
    productModelList =
        await HomeRepository.instance.getProducts(searchQuery: search);
    filterModelList = productModelList;
    isLoading.value = false;
  }

  searchProduct(String search) {
    productModelList = filterModelList
        .where((element) =>
            element.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    if (search.isEmpty || search == '') {
      productModelList = filterModelList;
    }
  }

  List<NewsModel> newsList = [];
  RxBool isNewsLoading = false.obs;
  Future<void> getNewsData() async {
    newsList.clear();
    isNewsLoading.value = true;
    newsList = await HomeRepository.instance.getNews();
    filterModelList = productModelList;
    isNewsLoading.value = false;
  }

  ProdModel? prodModel;

  Future<void> getDetailData(
      {required String title, required String url}) async {
    newsList.clear();
    isDataLoading.value = true;
    prodModel =
        await HomeRepository.instance.getProductsDetail(title: title, url: url);

    fillSentimentInput(list: prodModel!.reviews ?? []);
  }

  List<CartModel> cartList = [];
  Future<void> getCartData() async {
    cartList.clear();
    isCartLoading.value = true;
    cartList = await HomeRepository.instance.getCart();
    isCartLoading.value = false;
  }

  Future<void> postCartData(
      {required String title,
      required String url,
      required String image}) async {
    cartList.clear();
    isCartLoading.value = true;
    await HomeRepository.instance.postCartData(
      image: image,
      product: title,
      link: url,
    );
    isCartLoading.value = false;
  }

  disposeProdModel() {
    prodModel = null;
    selectedProductModel = null;
  }

  joinList(List<String> list) {
    String data = '';
    for (int i = 0; i < list.length; i++) {
      data += '${'${list[i]}, '} ';
    }
    return data;
  }
}
