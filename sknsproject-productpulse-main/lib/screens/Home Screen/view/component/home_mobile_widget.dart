import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';

class HomeMobileWidget extends StatefulWidget {
  HomeMobileWidget({super.key});

  @override
  State<HomeMobileWidget> createState() => _HomeMobileWidgetState();
}

class _HomeMobileWidgetState extends State<HomeMobileWidget> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Get.find<HomeController>().fetchProductData();
    // });
    super.initState();
  }

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     backgroundColor: Colors.grey.shade100,
    //     appBar: AppBar(
    //       backgroundColor: Colors.grey.shade100,
    //       leading: Padding(
    //         padding: const EdgeInsets.only(left: 10.0),
    //         child: SvgPicture.asset(
    //           'assets/logo.svg',
    //           height: 20,
    //         ),
    //       ),
    //       title: Container(
    //         height: 40,
    //         margin: EdgeInsets.symmetric(
    //             horizontal: MediaQuery.of(context).size.width * 0.1,
    //             vertical: 40),
    //         child: TextFormField(
    //           onChanged: (value) {
    //             setState(() {
    //               Get.find<HomeController>().search(value);
    //             });
    //           },
    //           decoration: InputDecoration(
    //             contentPadding: const EdgeInsets.only(left: 15),
    //             border: const OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(
    //                   Radius.circular(10),
    //                 ),
    //                 borderSide: BorderSide.none),
    //             filled: true,
    //             fillColor: Colors.grey.shade200,
    //             hintText: "Search...",
    //             hintStyle: const TextStyle(
    //               fontSize: 16,
    //               color: AppColors.primaryColor,
    //               fontWeight: FontWeight.w400,
    //             ),
    //             suffixIcon:
    //                 const Icon(Icons.search, color: AppColors.primaryColor),
    //           ),
    //         ),
    //       ),
    //       centerTitle: true,
    //       foregroundColor: Colors.white,
    //     ),
    //     body: GetX<HomeController>(
    //       builder: (controller) {
    //         return controller.isLoading.value
    //             ? const Center(
    //                 child: CircularProgressIndicator(),
    //               )
    //             : Container(
    //                 width: double.infinity,
    //                 height: double.infinity,
    //                 color: Colors.grey.shade100,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Expanded(
    //                       child: GridView.builder(
    //                         padding: EdgeInsets.only(
    //                           top: MediaQuery.of(context).size.width * 0.02,
    //                           left: MediaQuery.of(context).size.width * 0.05,
    //                           right: MediaQuery.of(context).size.width * 0.05,
    //                           bottom: MediaQuery.of(context).size.width * 0.11,
    //                         ),
    //                         scrollDirection: Axis.vertical,
    //                         itemCount: controller.productModelList.length,
    //                         physics: const BouncingScrollPhysics(),
    //                         itemBuilder: (context, index) {
    //                           return InkWell(
    //                             onTap: () {
    //                               Get.to(
    //                                 ProductDetail(
    //                                   model: controller.productModelList[index],
    //                                 ),
    //                               );
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => ProductDetail(
    //                                       model: controller
    //                                           .productModelList[index],
    //                                     ),
    //                                   ));
    //                             },
    //                             child: ProductDisplayWidget(
    //                                 mobile: controller.productModelList[index]),
    //                           );
    //                         },
    //                         gridDelegate:
    //                             const SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 2,
    //                           crossAxisSpacing: 10,
    //                           mainAxisSpacing: 10,
    //                           childAspectRatio: 0.4,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //       },
    //     ));
    return Container();
  }
}

// class ProductDisplayWidget extends StatelessWidget {
//   const ProductDisplayWidget({
//     super.key,
//     required this.mobile,
//   });

//   final ProductModel mobile;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           8,
//         ),
//       ),
//       color: Colors.white,
//       elevation: 1,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.1,
//         height: MediaQuery.of(context).size.height * 0.2,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Image.asset(
//                 '${mobile.imageUrls![0]}',
//                 height: MediaQuery.of(context).size.height * 0.25,
//               ),
//               Text(
//                 'Rs ${mobile.amazonPrice}',
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               Text(
//                 '${mobile.title}',
//                 style: const TextStyle(fontWeight: FontWeight.w400),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 5,
//                 ),
//                 child: Row(
//                   children: [
//                     RatingBar.builder(
//                       itemSize: 20,
//                       initialRating: mobile.ratings!.averageRating!,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.shopping_cart,
//                     color: Colors.grey,
//                   ),
//                   Text(
//                     '${mobile.availability}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w400, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               mobile.description!.length < 85
//                   ? Text(
//                       mobile.description!,
//                       overflow: TextOverflow.clip,
//                       style: const TextStyle(color: Colors.grey),
//                     )
//                   : ReadMoreText(
//                       text: mobile.description!,
//                       trimLength: mobile.description!.length > 50
//                           ? 50
//                           : mobile.description!.length,
//                     )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
