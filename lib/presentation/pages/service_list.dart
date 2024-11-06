import 'package:austrotalk/data/model/a_service.dart';
import 'package:austrotalk/presentation/widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final List<AService> services = [
      AService(
          title: Text(AppLocalizations.of(context)!.daily),
          title2: Text(AppLocalizations.of(context)!.horoscope),
          picture: SvgPicture.asset(
            "assets/images/home_images/sun.svg",width: 40,
          )),

      AService(
          title: Text(AppLocalizations.of(context)!.free),
          title2: Text(AppLocalizations.of(context)!.kundli),
          picture: SvgPicture.asset(
            "assets/images/home_images/kundli.svg",width: 40,
          )),
      AService(
          title: Text(AppLocalizations.of(context)!.kundli),
          title2: Text(AppLocalizations.of(context)!.matching),
          picture: SvgPicture.asset(
            "assets/images/home_images/rings.svg",width: 42,
          )),
      AService(
          title: Text(AppLocalizations.of(context)!.free),
          title2: Text(AppLocalizations.of(context)!.chat),
          picture: SvgPicture.asset(
            "assets/images/home_images/freeIcon.svg",width: 40,
          )),
    ];

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