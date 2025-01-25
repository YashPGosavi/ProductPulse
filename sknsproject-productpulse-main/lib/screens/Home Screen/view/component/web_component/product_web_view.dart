import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/modal/product_model.dart';

class ProductView extends StatelessWidget {
  final PageController? controllerPage;
  const ProductView({
    super.key,
    required this.mobile,
    this.controllerPage,
  });
  final List<ProductModel>? mobile;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.02,
        left: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.01,
        bottom: MediaQuery.of(context).size.width * 0.11,
      ),
      scrollDirection: Axis.vertical,
      itemCount: mobile!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            log('clicked');
            Get.find<HomeController>().selectedProductModel = mobile![index];
            Get.find<HomeController>().getDetailData(
                title: mobile![index].title!, url: mobile![index].productLink!);
            if (controllerPage != null) {
              controllerPage!.jumpToPage(
                controllerPage!.page!.toInt() + 1,
              );
            }
          },
          child: ProductDisplayWidget(mobile: mobile![index]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 50,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
    );
  }
}

class ProductDisplayWidget extends StatelessWidget {
  const ProductDisplayWidget({
    super.key,
    required this.mobile,
  });

  final ProductModel mobile;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.network(
                mobile.imageUrl!,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Text(
                '${mobile.title}',
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLength;

  const ReadMoreText({super.key, required this.text, this.trimLength = 100});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _readMore
              ? widget.text.substring(0, widget.trimLength) + '...'
              : widget.text,
          overflow: TextOverflow.clip,
          style: const TextStyle(color: Colors.grey),
        ),
        if (widget.text.length > widget.trimLength)
          InkWell(
            onTap: () {
              setState(() {
                _readMore = !_readMore;
              });
            },
            child: Text(
              _readMore ? 'Show more' : 'Show less',
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
