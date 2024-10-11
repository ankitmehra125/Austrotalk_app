import 'package:austrotalk/data/model/a_service.dart';
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow
          ),
          child: Center(
            child: service.picture,
          ),
        ),
        SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(service.title,
              style: TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 12
              ),),
          ],
        ),
        Text(service.title2,
          style: TextStyle(
              fontFamily: 'SatoshiRegular',
              fontSize: 12
          ),),
      ],
    );
  }
}
