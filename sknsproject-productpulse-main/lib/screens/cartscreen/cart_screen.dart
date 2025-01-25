import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeController>().getCartData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: GetX<HomeController>(builder: (controller) {
        return controller.isCartLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.02,
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    bottom: MediaQuery.of(context).size.width * 0.11,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.cartList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        String url = controller.cartList[index].buyLink!;
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                            forceWebView: false,
                          );
                        } else {}
                      },
                      child: Card(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  controller.cartList[index].image!,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                ),
                                Text(
                                  '${controller.cartList[index].product}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                ),
              );
      }),
    );
  }
}
