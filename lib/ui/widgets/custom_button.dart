import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  String title;
  Function()? onPressed;
  CustomButtonWidget({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: onPressed,
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
