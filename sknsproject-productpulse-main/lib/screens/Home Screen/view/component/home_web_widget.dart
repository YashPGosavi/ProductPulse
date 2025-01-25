import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/constant/app_colors.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/product_detail/product_detail_web.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/web_component/new_item_widget.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/component/web_component/product_web_view.dart';
import 'package:prodpulseversion3/screens/cartscreen/cart_screen.dart';

class HomeWebWidget extends StatefulWidget {
  const HomeWebWidget({super.key});

  @override
  State<HomeWebWidget> createState() => _HomeWebWidgetState();
}

class _HomeWebWidgetState extends State<HomeWebWidget> {
  PageController controllerPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 20,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const CartScreen(),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
        title: Container(
          height: 40,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.25,
              vertical: 40),
          child: TextFormField(
            controller: Get.find<HomeController>().searchController,
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
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                onPressed: () async {
                  Get.find<HomeController>().getData(
                    Get.find<HomeController>().searchController.text,
                  );
                },
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade50,
      body: GetX<HomeController>(
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Get.find<HomeController>().getData(
                              'mobile',
                            );
                          },
                          child: const SidebarCard(
                            image: 'assets/images/mobile.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Get.find<HomeController>().getData(
                              'Tvs',
                            );
                          },
                          child: const SidebarCard(
                            image: 'assets/images/tvs.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Get.find<HomeController>().getData(
                              'grocery',
                            );
                          },
                          child: const SidebarCard(
                            image: 'assets/images/grocery.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Get.find<HomeController>().getData(
                              'fashion',
                            );
                          },
                          child: const SidebarCard(
                            image: 'assets/images/cloths.jpeg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  // child: ProductView(
                  //   mobile: controller.productModelList,
                  // ),
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.productModelList.isEmpty
                          ? const Center(
                              child: Text(
                                'No product found',
                              ),
                            )
                          : PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controllerPage,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 1) {
                                  return ProductDetailWeb(
                                    pageController: controllerPage,
                                  );
                                }
                                return ProductView(
                                  mobile: controller.productModelList,
                                  controllerPage: controllerPage,
                                );
                              },
                            ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        controller.isNewsLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.newsList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      // String url =
                                      //     controller.newsList[index].url!;
                                      // if (await canLaunch(url)) {
                                      //   await launch(
                                      //     url,
                                      //     forceSafariVC: false,
                                      //     forceWebView: false,
                                      //   );
                                      // } else {
                                      //   throw 'Could not launch $url';
                                      // }
                                    },
                                    child: NewsItemWidget(
                                      newsModel: controller.newsList[index],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SidebarCard extends StatelessWidget {
  final String image;
  const SidebarCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }
}
