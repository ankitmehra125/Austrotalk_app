import 'package:austrotalk/data/model/a_service.dart';
import 'package:austrotalk/presentation/widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceList extends StatelessWidget {
  final List<AService> services = [
    AService(
        title: "Daily",
        title2: "Horoscope",
        picture: SvgPicture.asset(
          "assets/images/home_images/sun.svg",width: 40,
        )),
    AService(
        title: "Free",
        title2: "Kundli",
        picture: SvgPicture.asset(
          "assets/images/home_images/kundli.svg",width: 40,
        )),
    AService(
        title: "Kundli",
        title2: "Matching",
        picture: SvgPicture.asset(
          "assets/images/home_images/rings.svg",width: 42,
        )),
    AService(
        title: "Free",
        title2: "Chat",
        picture: SvgPicture.asset(
          "assets/images/home_images/freeIcon.svg",width: 40,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Evenly space items
      children: services.map((service) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add some spacing between cards
            child: ServiceCard(service: service),
          ),
        );
      }).toList(),
    );
  }
}
