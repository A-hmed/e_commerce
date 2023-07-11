import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Container(
            margin: const EdgeInsets.only(
                left: 24.07,
                top: 13,
                bottom: 13,
                right: 7.93),
            child: Image.asset(
              "assets/images/ic_search.png",
              width: 24,
              height: 24,
            )),
        hintText: 'what do you search for?',
        filled: true,
        contentPadding: const EdgeInsets.only(top: 20.0),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
              color: AppColors.primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:  const BorderSide(
              color: AppColors.primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
              color: AppColors.primaryColor, width: 1),
        ),
      ),
    );
  }
}
