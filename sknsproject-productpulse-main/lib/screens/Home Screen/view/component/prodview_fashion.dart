// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:prodpulseversion3/screens/Home%20Screen/modal/productmodel.dart';

// class ProductViewFashion extends StatelessWidget {
//   const ProductViewFashion({super.key, required this.fashion});
//   final List<Fashion>? fashion;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: fashion!.length,
//       physics: const BouncingScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {},
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/${fashion![index].imageUrls![0]}',
//                   height: MediaQuery.of(context).size.height * 0.15,
//                 ),
//                 Expanded(
//                   child: Text(
//                     fashion![index].description!,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4, childAspectRatio: 1.5),
//     );
//   }
// }
