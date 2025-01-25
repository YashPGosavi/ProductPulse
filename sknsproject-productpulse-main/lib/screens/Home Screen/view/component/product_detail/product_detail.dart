// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
// import 'package:prodpulseversion3/screens/Home%20Screen/modal/product_model.dart';
// import 'package:prodpulseversion3/screens/Home%20Screen/view/component/product_detail/product_detail_mobile.dart';
// import 'package:prodpulseversion3/screens/Home%20Screen/view/component/product_detail/product_detail_web.dart';
// import 'package:prodpulseversion3/widgets/common%20components/common_layout.dart';

// class ProductDetail extends StatefulWidget {
//   final ProductModel model;
//   const ProductDetail({super.key, required this.model});

//   @override
//   State<ProductDetail> createState() => _ProductDetailState();
// }

// class _ProductDetailState extends State<ProductDetail> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: true,
//       onPopInvoked: (didPop) {
//         // Get.find<HomeController>().fetchProductData();
//       },
//       child: CommonLayoutBuilder(
//         webWidget: ProductDetailWeb(),
//         mobileWidget: ProductDetailMobile(
//           model: widget.model,
//         ),
//       ),
//     );
//   }
// }
