import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/product_model.dart';

class ProductDetailMobile extends StatelessWidget {
  final ProductModel model;
  const ProductDetailMobile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 20,
          ),
        ),
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ItemDetailView(model: model),
            ],
          ),
        ),
      ),
    );
  }
}

// class ItemDetailView extends StatelessWidget {
//   final ProductModel model;
//   const ItemDetailView({super.key, required this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//             height: MediaQuery.of(context).size.height * 0.4,
//             child: Image.asset(model.imageUrls![0])),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(
//           'Rs ${model.originalPrice! - model.amazonPrice!} off',
//           style: const TextStyle(
//               fontSize: 20, fontWeight: FontWeight.w500, color: Colors.green),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(
//           'Rs ${model.amazonPrice}',
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(
//           model.title!,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(
//           model.description!,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Text(
//           model.availability!,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         model.amazonPrice! < model.flipkartPrice!
//             ? GestureDetector(
//                 onTap: () {
//                   log(model.amazonBuyLink.toString());
//                   _launchURL(model.amazonBuyLink!);
//                 },
//                 child: FlipCartWidget(
//                   model: model,
//                   title: 'Amazon',
//                 ),
//               )
//             : GestureDetector(
//                 onTap: () {
//                   log(model.amazonBuyLink.toString());
//                   _launchURL(model.flipkartBuyLink!);
//                 },
//                 child: FlipCartWidget(
//                   model: model,
//                   title: 'Flipkart',
//                 ),
//               ),
//         model.amazonPrice! < model.flipkartPrice!
//             ? GestureDetector(
//                 onTap: () {
//                   log(model.amazonBuyLink.toString());
//                   _launchURL(model.flipkartBuyLink!);
//                 },
//                 child: FlipCartWidget(
//                   model: model,
//                   title: 'Flipkart',
//                 ),
//               )
//             : GestureDetector(
//                 onTap: () {
//                   log(model.amazonBuyLink.toString());
//                   _launchURL(model.amazonBuyLink!);
//                 },
//                 child: FlipCartWidget(
//                   model: model,
//                   title: 'Amazon',
//                 ),
//               ),
//       ],
//     );
//   }

//   _launchURL(String buyUrl) async {
//     String url = Uri.encodeFull(buyUrl);
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// class UserTextReview extends StatelessWidget {
//   final List<Artificial> list;
//   final String sentiment;
//   const UserTextReview({
//     super.key,
//     required this.list,
//     required this.sentiment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return list.isEmpty
//         ? Center(
//             child: Text('No $sentiment reviews found'),
//           )
//         : Column(
//             children: [
//               for (int i = 0; i < list.length; i++)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.person,
//                           color: Colors.black54,
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           list[i].user.toString(),
//                           style: const TextStyle(fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 3),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.reviews,
//                           color: Colors.black54,
//                         ),
//                         const SizedBox(width: 5),
//                         Expanded(
//                           child: Text(
//                             '${list[i].text}',
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             style: const TextStyle(fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//             ],
//           );
//   }
// }

// class CardRatingView extends StatelessWidget {
//   final Ratings rating;
//   final List<Review> review;
//   const CardRatingView({
//     super.key,
//     required this.rating,
//     required this.review,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           20,
//         ),
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           vertical: 6,
//           horizontal: 10,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(
//             20,
//           ),
//         ),
//         child: Column(
//           children: [
//             const Row(
//               children: [
//                 Text(
//                   'Reviews & Rating',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     children: [
//                       Text(
//                         'Very Good',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey.shade500,
//                         ),
//                       ),
//                       GetX<HomeController>(builder: (context) {
//                         return controller.isLoading.value
//                             ? const Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : RatingBar.builder(
//                                 itemSize: 16,
//                                 initialRating:
//                                     controller.sentimentalModel!.averageRating,
//                                 minRating: 1,
//                                 direction: Axis.horizontal,
//                                 allowHalfRating: true,
//                                 itemCount: 5,
//                                 itemPadding:
//                                     const EdgeInsets.symmetric(horizontal: 4.0),
//                                 itemBuilder: (context, _) => const Icon(
//                                   Icons.star,
//                                   color: Colors.amber,
//                                 ),
//                                 onRatingUpdate: (rating) {
//                                   print(rating);
//                                 },
//                               );
//                       }),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         '${review.length} reviews &',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey.shade500,
//                         ),
//                       ),
//                       Text(
//                         '${rating.totalRatings} ratings',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey.shade500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 1,
//                   margin: const EdgeInsets.symmetric(horizontal: 5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       10,
//                     ),
//                     color: Colors.grey.shade500,
//                   ),
//                   height: 130,
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                     children: [
//                       RatingAndReviewProgress(
//                         color: AppColors.green3,
//                         star: 5,
//                         value: controller
//                                 .sentimentalModel!.ratingPercentages!.the5 /
//                             100,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       RatingAndReviewProgress(
//                         color: AppColors.green1,
//                         star: 4,
//                         value: controller
//                                 .sentimentalModel!.ratingPercentages!.the4 /
//                             100,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       RatingAndReviewProgress(
//                         color: AppColors.yellow3,
//                         star: 3,
//                         value: controller
//                                 .sentimentalModel!.ratingPercentages!.the3 /
//                             100,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       RatingAndReviewProgress(
//                         color: AppColors.red1,
//                         star: 2,
//                         value: controller
//                                 .sentimentalModel!.ratingPercentages!.the2 /
//                             100,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       RatingAndReviewProgress(
//                         color: AppColors.red3,
//                         star: 1,
//                         value: controller
//                                 .sentimentalModel!.ratingPercentages!.the1 /
//                             100,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     CustomPercentChart(
//                       color1: AppColors.green1,
//                       color2: AppColors.green2,
//                       color3: AppColors.green3,
//                       percent: ((controller
//                                   .sentimentalModel!.ratingPercentages!.the5 +
//                               controller
//                                   .sentimentalModel!.ratingPercentages!.the4) /
//                           200),
//                     ),
//                     const Text(
//                       'Positive',
//                       style: TextStyle(fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     CustomPercentChart(
//                       color1: AppColors.red1,
//                       color2: AppColors.red2,
//                       color3: AppColors.red3,
//                       percent: ((controller
//                                   .sentimentalModel!.ratingPercentages!.the1 +
//                               controller
//                                   .sentimentalModel!.ratingPercentages!.the2) /
//                           200),
//                     ),
//                     const Text(
//                       'Negative',
//                       style: TextStyle(fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     CustomPercentChart(
//                       color1: AppColors.yellow1,
//                       color2: AppColors.yellow2,
//                       color3: AppColors.yellow3,
//                       percent:
//                           controller.sentimentalModel!.ratingPercentages!.the3 /
//                               100,
//                     ),
//                     const Text(
//                       'Unclassified',
//                       style: TextStyle(fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Overall recommendation: ',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             Text('${controller.sentimentalModel!.overallRecommendation}'),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RatingAndReviewProgress extends StatelessWidget {
//   final Color color;
//   final int star;
//   final double value;
//   const RatingAndReviewProgress({
//     super.key,
//     required this.color,
//     required this.star,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Row(
//             children: [
//               Text('$star Star:'),
//               const Icon(
//                 Icons.star,
//                 size: 20,
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 5,
//           child: LinearProgressIndicator(
//             value: value,
//             color: color,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomPercentChart extends StatelessWidget {
//   final Color color1;
//   final Color color2;
//   final Color color3;
//   final double percent;

//   const CustomPercentChart({
//     super.key,
//     required this.percent,
//     required this.color1,
//     required this.color2,
//     required this.color3,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final calculatePercent = (percent * 100).toStringAsFixed(2);
//     return Container(
//       decoration: BoxDecoration(
//         color: color1,
//         shape: BoxShape.circle,
//       ),
//       child: Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//         child: Container(
//           decoration: BoxDecoration(
//             color: color2,
//             shape: BoxShape.circle,
//           ),
//           child: CircularPercentIndicator(
//             percent: percent,
//             radius: 40,
//             lineWidth: 5,
//             animation: true,
//             animationDuration: 2000,
//             progressColor: color3,
//             backgroundColor: color2,
//             center: Text(
//               "$calculatePercent%",
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FlipCartWidget extends StatelessWidget {
//   final ProductModel model;
//   final String title;

//   const FlipCartWidget({super.key, required this.model, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.primaryColor),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 150,
//             child: Image.asset(model.imageUrls![0]),
//           ),
//           Text(
//             'Rs ${title == 'Flipkart' ? model.flipkartPrice : model.amazonPrice}',
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(model.title.toString(), style: const TextStyle(fontSize: 18)),
//           Text(model.description!),
//         ],
//       ),
//     );
//   }
// }

//               // GetX<HomeController>(
//               //   builder: (controller) {
//               //     return controller.isLoading.value
//               //         ? const Center(
//               //             child: CircularProgressIndicator(),
//               //           )
//               //         : Column(
//               //             children: [
//               //               CardRatingView(
//               //                 review: model.reviews!,
//               //                 rating: model.ratings!,
//               //               ),
//               //               const SizedBox(
//               //                 height: 20,
//               //               ),
//               //               if (controller.sentimentalModel != null &&
//               //                   controller.sentimentalModel!.groupedReviews!
//               //                       .positive!.isNotEmpty) ...[
//               //                 const Row(
//               //                   children: [
//               //                     Text(
//               //                       'Positive',
//               //                       style: TextStyle(
//               //                           fontSize: 18,
//               //                           fontWeight: FontWeight.w600),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 UserTextReview(
//               //                   list: controller.sentimentalModel!
//               //                       .groupedReviews!.positive!,
//               //                   sentiment: 'Positive',
//               //                 ),
//               //                 const SizedBox(
//               //                   height: 20,
//               //                 ),
//               //               ],
//               //               if (controller.sentimentalModel != null &&
//               //                   controller.sentimentalModel!.groupedReviews!
//               //                       .negative!.isNotEmpty) ...[
//               //                 const Row(
//               //                   children: [
//               //                     Text(
//               //                       'Negative',
//               //                       style: TextStyle(
//               //                           fontSize: 18,
//               //                           fontWeight: FontWeight.w600),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 UserTextReview(
//               //                   list: controller.sentimentalModel!
//               //                       .groupedReviews!.negative!,
//               //                   sentiment: 'Negative',
//               //                 ),
//               //                 const SizedBox(
//               //                   height: 10,
//               //                 ),
//               //               ],
//               //               if (controller.sentimentalModel != null &&
//               //                   controller.sentimentalModel!.groupedReviews!
//               //                       .neutral!.isNotEmpty) ...[
//               //                 const Row(
//               //                   children: [
//               //                     Text(
//               //                       'Neutral',
//               //                       style: TextStyle(
//               //                           fontSize: 18,
//               //                           fontWeight: FontWeight.w600),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 UserTextReview(
//               //                   list: controller
//               //                       .sentimentalModel!.groupedReviews!.neutral!,
//               //                   sentiment: 'Neutral',
//               //                 ),
//               //               ],
//               //               const SizedBox(
//               //                 height: 20,
//               //               ),
//               //               if (controller.sentimentalModel != null &&
//               //                   controller.sentimentalModel!.groupedReviews!
//               //                       .artificial!.isNotEmpty) ...[
//               //                 const Row(
//               //                   children: [
//               //                     Text(
//               //                       'Artificial',
//               //                       style: TextStyle(
//               //                           fontSize: 18,
//               //                           fontWeight: FontWeight.w600),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 UserTextReview(
//               //                   list: controller.sentimentalModel!
//               //                       .groupedReviews!.artificial!,
//               //                   sentiment: 'Artificial',
//               //                 ),
//               //               ]
//               //             ],
//               //           );
//               //   },
//               // ),