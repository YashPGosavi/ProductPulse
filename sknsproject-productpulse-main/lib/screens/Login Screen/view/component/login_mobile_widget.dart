import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/constant/app_colors.dart';
import 'package:prodpulseversion3/constant/app_strings.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/view/home_page.dart';
import 'package:prodpulseversion3/screens/Login%20Screen/controller/login_controller.dart';
import 'package:prodpulseversion3/widgets/common%20components/custom_button.dart';
import 'package:prodpulseversion3/widgets/common%20components/entry_field.dart';

class LoginMobileWidget extends StatelessWidget {
  LoginMobileWidget({super.key});
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: AppColors.primaryColor,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/logo.svg',
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      // Expanded(
                      //     flex: 4, child: Image.asset('assets/hero_image.png')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.555),
                      EntryField(
                        hint: AppStrings.enterEmail,
                        prefixIcon: Icons.phone_iphone,
                        color: Colors.grey.shade200,
                        controller: loginController.emailController,
                      ),
                      const SizedBox(height: 20.0),
                      EntryField(
                        hint: AppStrings.enterPassword,
                        prefixIcon: Icons.phone_iphone,
                        color: Colors.grey.shade200,
                        controller: loginController.passwordController,
                      ),
                      const SizedBox(height: 20.0),
                      CustomButton(
                        textColor: Colors.white,
                        label: AppStrings.login,
                        color: AppColors.primaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
