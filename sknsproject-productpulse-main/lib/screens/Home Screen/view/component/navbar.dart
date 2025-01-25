import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodpulseversion3/constant/app_colors.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          height: 50,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Expanded(
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
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
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        )
      ],
    );
  }
}
