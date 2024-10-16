import 'package:flutter/material.dart';

import '../../utils/color.dart';

class CustomButton extends StatelessWidget {
   void Function()? onTap;
  CustomButton({
    super.key,
    required this.size,
    required this.medium,
    required this.onTap,
  });

  final Size size;
  final TextStyle? medium;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * .06,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
        ),
        child: Center(
            child: Text(
              "Save Change",
              style: medium?.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}