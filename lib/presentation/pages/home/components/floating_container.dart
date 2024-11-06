import 'package:austrotalk/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingContainer extends StatelessWidget {
  final Text title;
  final Color color;
  final SvgPicture svg;

  const FloatingContainer({Key? key, required this.title, required this.color, required this.svg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Container(
      width: mQuery.size.width*0.44,
      height: 40,
      padding: EdgeInsets.symmetric(
        horizontal: 8
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            svg,
            SizedBox(width: mQuery.size.width*0.02,),
            DefaultTextStyle(
              style: TextStyles.floatingText,
              child: title,
            )
          ],
        ),
      ),
    );
  }
}