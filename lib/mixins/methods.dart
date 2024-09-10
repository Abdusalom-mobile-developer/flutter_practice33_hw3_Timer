import 'package:flutter/material.dart';
import 'package:flutter_practice33_hw3/config/colors.dart';

mixin Methods {
  Widget topArrowButton({required void Function() function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Icon(
          Icons.keyboard_arrow_up_rounded,
          size: 70,
          color: ColorsClass.black,
        ),
      ),
    );
  }

  Widget downArrowButton({required void Function() function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 70,
          color: ColorsClass.black,
        ),
      ),
    );
  }

  
}
