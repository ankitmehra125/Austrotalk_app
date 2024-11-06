import 'package:austrotalk/constants/custom_colors.dart';
import 'package:austrotalk/data/model/a_service.dart';
import 'package:austrotalk/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCard extends StatelessWidget {
  final AService service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.componentsColor
          ),
          child: Center(
            child: service.picture,
          ),
        ),
        const SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
                style:  TextStyles.regularTextSmall,
                child: service.title,
            )
          ],
        ),
        DefaultTextStyle(
          style:  TextStyles.regularTextSmall,
          child: service.title2,
        )
      ],
    );
  }
}
