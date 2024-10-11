import 'package:flutter/material.dart';

import '../../data/model/astrologer.dart';
import '../widgets/astrologer_card.dart';

class AstrologersList extends StatelessWidget {

  final List<Astrologer> astrologers = [
    Astrologer(
        image: AssetImage("assets/images/astrologers_images/madhuPriya.png"),
        name: "Madhu Priya",
        price: "26/min"
    ),
    Astrologer(
        image: AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        price: "36/min"
    ),
    Astrologer(
        image: AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        price: "36/min"
    ),
    Astrologer(
        image: AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        price: "36/min"
    ),

    Astrologer(
        image: AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        price: "36/min"
    ),
    Astrologer(
        image: AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        price: "36/min"
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Make it scrollable horizontally
      child: Row(
        children: astrologers.map((astrologer) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0), // Add some spacing between cards
            child: AstrologerCard(astrologer: astrologer),
          );
        }).toList(),
      ),
    );
  }
}
