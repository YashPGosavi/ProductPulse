import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/home_mobile_widget.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/home_web_widget.dart';
import 'package:prodpulseversion3/screens/search/controller/search_controller.dart';
import 'package:prodpulseversion3/widgets/common%20components/common_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.find<HomeController>().searchController.text =
        Get.find<SearchWidgetController>().searchTextController.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonLayoutBuilder(
          webWidget: const HomeWebWidget(),
          mobileWidget: HomeMobileWidget(),
        ),
        const Visibility(
          visible: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
