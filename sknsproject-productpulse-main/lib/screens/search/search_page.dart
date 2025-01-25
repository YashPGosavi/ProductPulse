import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prodpulseversion3/constant/app_colors.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/home_web_widget.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/home_page.dart';
import 'package:prodpulseversion3/screens/search/controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller:
                    Get.find<SearchWidgetController>().searchTextController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Search...",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon:
                      const Icon(Icons.search, color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetX<HomeController>(builder: (controller) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          10,
                        ),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () async {
                    if (Get.find<SearchWidgetController>()
                        .searchTextController
                        .text
                        .isNotEmpty) {
                      await controller.getData(
                        Get.find<SearchWidgetController>()
                            .searchTextController
                            .text,
                      );
                      Get.to(() => const HomePage());
                    } else {
                      Fluttertoast.showToast(msg: 'Please enter some text');
                    }
                  },
                  child: controller.isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('     Search     ',
                          style: TextStyle(color: Colors.white)),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Get.find<HomeController>().getData(
                        'Mobile',
                      );
                      Get.to(() => const HomePage());
                    },
                    child: const Column(
                      children: [
                        SidebarCard(
                          image: 'assets/images/mobile.jpeg',
                        ),
                        Text(
                          'Mobile',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Get.find<HomeController>().getData(
                        'Tvs',
                      );
                      Get.to(() => const HomePage());
                    },
                    child: const Column(
                      children: [
                        SidebarCard(
                          image: 'assets/images/tvs.jpeg',
                        ),
                        Text(
                          'TVs',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Get.find<HomeController>().getData(
                        'grocery',
                      );
                      Get.to(() => const HomePage());
                    },
                    child: const Column(
                      children: [
                        SidebarCard(
                          image: 'assets/images/grocery.jpeg',
                        ),
                        Text(
                          'grocery',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Get.find<HomeController>().getData(
                        'fashion',
                      );
                      Get.to(() => const HomePage());
                    },
                    child: const Column(
                      children: [
                        SidebarCard(
                          image: 'assets/images/cloths.jpeg',
                        ),
                        Text(
                          'Cloths',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
