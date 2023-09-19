// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_icon.dart';

class SearchBarView extends StatelessWidget {
  SearchBarView({
    Key? key,
    this.onPressedSearch,
    this.onPressedBack,
  }) : super(key: key);
  void Function()? onPressedSearch;
  void Function()? onPressedBack;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return Row(
      children: [
        CustomIcon(
          onPressed: onPressedBack,
          icon: Icons.arrow_back,
        ),
        SizedBox(
          width: screenWidth * 10 / dimensions.sizeWidth,
        ),
        const Text(
          "Search",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressedSearch,
          icon: Icons.search,
        ),
      ],
    );
  }
}
