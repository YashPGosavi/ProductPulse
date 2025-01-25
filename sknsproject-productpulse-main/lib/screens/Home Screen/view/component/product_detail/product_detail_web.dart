import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodpulseversion3/constant/app_colors.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/output_sentimental_model.dart';

class ProductDetailWeb extends StatelessWidget {
  final PageController pageController;
  const ProductDetailWeb({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () async {
            await Get.find<HomeController>().disposeProdModel();
            pageController.jumpToPage(
              pageController.page!.toInt() - 1,
            );
          },
        ),
        title: const Text('Product Detail'),
        backgroundColor: Colors.grey.shade100,
      ),
      body: GetX<HomeController>(
        builder: (controller) {
          return controller.isDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: Image.network(
                                  controller.selectedProductModel!.imageUrl!,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height * 0.05,
                                  // ),
                                  Text(
                                    controller.selectedProductModel!.title ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Ratings: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        controller.prodModel!.flipkartDetails!
                                                .totalRating ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.prodModel!.flipkartDetails!
                                            .description ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      EcomPlatformPriceWidget(
                                          platform: 'Amazon price',
                                          price: controller
                                                      .prodModel!
                                                      .amazonDetails!
                                                      .amazonPrice !=
                                                  null
                                              ? controller.prodModel!
                                                  .amazonDetails!.amazonPrice
                                                  .toString()
                                              : "N/A"),
                                      EcomPlatformPriceWidget(
                                        platform: 'Flipkart price',
                                        price: controller
                                                    .prodModel!
                                                    .flipkartDetails!
                                                    .flipkartPrice !=
                                                null
                                            ? controller.prodModel!
                                                .flipkartDetails!.flipkartPrice
                                                .toString()
                                            : "N/A",
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Rs ${offPrice(double.parse(controller.prodModel!.amazonDetails!.amazonPrice != null ? controller.prodModel!.amazonDetails!.amazonPrice!.toString() : '0'), double.parse(
                                                  controller
                                                              .prodModel!
                                                              .flipkartDetails!
                                                              .flipkartPrice !=
                                                          null
                                                      ? controller
                                                          .prodModel!
                                                          .flipkartDetails!
                                                          .flipkartPrice!
                                                          .toString()
                                                      : '0',
                                                ))} off',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    10,
                                                  ),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              backgroundColor: Colors.black87,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                            ),
                                            onPressed: () async {
                                              await controller.postCartData(
                                                title: controller
                                                    .selectedProductModel!
                                                    .title!,
                                                url: controller
                                                    .selectedProductModel!
                                                    .productLink!,
                                                image: controller
                                                    .selectedProductModel!
                                                    .imageUrl!,
                                              );
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Product added to cart successfully');
                                            },
                                            child: controller
                                                    .isCartLoading.value
                                                ? const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.0),
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const Text(
                                                    '     Add to cart    ',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Delivery by: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        controller.prodModel!.flipkartDetails!
                                                .deliveryBy ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  'Flipkart Offers: ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ListView.builder(
                                                itemCount: controller
                                                    .prodModel!
                                                    .flipkartDetails!
                                                    .flipkartOffers!
                                                    .length,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                    '• ${controller.prodModel!.flipkartDetails!.flipkartOffers![index]}',
                                                  );
                                                })
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  'Payment Options: ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            ListView.builder(
                                              itemCount: controller
                                                  .prodModel!
                                                  .flipkartDetails!
                                                  .paymentOptions!
                                                  .length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Text(
                                                  '• ${controller.prodModel!.flipkartDetails!.paymentOptions![index]}',
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Specifications : ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.prodModel!.flipkartDetails!
                                                  .productSpecifications ??
                                              'Specifications not available',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: controller
                                          .sentimentalModel!.averageRating!,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.sentimentalModel!
                                        .overallRecommendation ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      CustomPercentChart(
                                        color1: AppColors.green1,
                                        color2: AppColors.green2,
                                        color3: AppColors.green3,
                                        percent: controller.sentimentalModel!
                                                .positivePercentage! /
                                            100,
                                      ),
                                      const Text(
                                        'Positive',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomPercentChart(
                                        color1: AppColors.red1,
                                        color2: AppColors.red2,
                                        color3: AppColors.red3,
                                        percent: controller.sentimentalModel!
                                                .negativePercentage! /
                                            100,
                                      ),
                                      const Text(
                                        'Negative',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomPercentChart(
                                        color1: AppColors.yellow1,
                                        color2: AppColors.yellow2,
                                        color3: AppColors.yellow3,
                                        percent: controller.sentimentalModel!
                                                .neutralPercentage! /
                                            100,
                                      ),
                                      const Text(
                                        'Unclassified',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 400,
                                child: Column(
                                  children: [
                                    RatingAndReviewProgress(
                                      color: AppColors.green3,
                                      star: 5,
                                      value: controller.sentimentalModel!
                                              .ratingPercentages!.the5! /
                                          100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RatingAndReviewProgress(
                                      color: AppColors.green1,
                                      star: 4,
                                      value: controller.sentimentalModel!
                                              .ratingPercentages!.the4! /
                                          100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RatingAndReviewProgress(
                                      color: AppColors.yellow3,
                                      star: 3,
                                      value: controller.sentimentalModel!
                                              .ratingPercentages!.the3! /
                                          100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RatingAndReviewProgress(
                                      color: AppColors.red1,
                                      star: 2,
                                      value: controller.sentimentalModel!
                                              .ratingPercentages!.the2! /
                                          100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RatingAndReviewProgress(
                                      color: AppColors.red3,
                                      star: 1,
                                      value: controller.sentimentalModel!
                                              .ratingPercentages!.the1! /
                                          100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            ReviewsTextWidget(
                              title: 'Positive',
                              bot: controller
                                  .sentimentalModel!.groupedReviews!.positive!,
                            ),
                            ReviewsTextWidget(
                              title: "Neutral",
                              bot: controller
                                  .sentimentalModel!.groupedReviews!.neutral!,
                            ),
                            ReviewsTextWidget(
                              title: 'Bot',
                              bot: controller
                                  .sentimentalModel!.groupedReviews!.bot!,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  double offPrice(double a, double b) {
    return a > b ? a - b : b - a;
  }
}

class EcomPlatformPriceWidget extends StatelessWidget {
  final String platform;
  final String price;
  const EcomPlatformPriceWidget({
    super.key,
    required this.platform,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                platform.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          Text(
            'Rs $price',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// class ReviewPieChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, double> dataMap = {
//       "Good Reviews": 40, // percent of good reviews
//       "Bad Reviews": 30, // percent of bad reviews
//       "Unclassified": 30, // percent of unclassified reviews
//     };

//     return PieChart(
//       dataMap: dataMap,
//       animationDuration: const Duration(milliseconds: 800),
//       chartLegendSpacing: 32,
//       chartRadius: MediaQuery.of(context).size.width / 2.7,
//       colorList: [Colors.green, Colors.red, Colors.blue],
//       initialAngleInDegree: 0,
//       chartType: ChartType.ring,
//       ringStrokeWidth: 32,
//       centerText: "Reviews",
//       legendOptions: const LegendOptions(
//         showLegendsInRow: false,
//         legendPosition: LegendPosition.right,
//         showLegends: true,
//         legendShape: BoxShape.circle,
//         legendTextStyle: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       chartValuesOptions: const ChartValuesOptions(
//         showChartValueBackground: true,
//         showChartValues: true,
//         showChartValuesInPercentage: true,
//         showChartValuesOutside: false,
//       ),
//     );
//   }
// }

class ReviewsTextWidget extends StatelessWidget {
  final List<Bot> bot;
  final String title;
  const ReviewsTextWidget({super.key, required this.bot, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        for (int i = 0; i < bot.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    bot[i].user ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Icon(
                    Icons.reviews,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      bot[i].text ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
      ],
    );
  }
}

class CustomPercentChart extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final double percent;

  const CustomPercentChart({
    super.key,
    required this.percent,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    final calculatePercent = (percent * 100).toStringAsFixed(2);
    return Container(
      decoration: BoxDecoration(
        color: color1,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Container(
          decoration: BoxDecoration(
            color: color2,
            shape: BoxShape.circle,
          ),
          child: CircularPercentIndicator(
            percent: percent,
            radius: 70,
            lineWidth: 5,
            animation: true,
            animationDuration: 2000,
            progressColor: color3,
            backgroundColor: color2,
            center: Text(
              "$calculatePercent%",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RatingAndReviewProgress extends StatelessWidget {
  final Color color;
  final int star;
  final double value;
  const RatingAndReviewProgress({
    super.key,
    required this.color,
    required this.star,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text('$star Star:'),
              const Icon(
                Icons.star,
                size: 20,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: value,
            color: color,
          ),
        ),
      ],
    );
  }
}
