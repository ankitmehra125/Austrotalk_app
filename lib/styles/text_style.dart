import 'package:flutter/material.dart';

class TextStyles
{
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'SatoshiBold',
    color: Colors.black
  );

  static const TextStyle sectionSubtitle = TextStyle(
    fontFamily: 'SatoshiMedium',
    color: Colors.grey,
    fontSize: 12
  );

  // Mainly used in chat page
  static const TextStyle regularTextSmall = TextStyle(
    fontFamily: 'SatoshiRegular',
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle floatingText = TextStyle(
    color: Colors.black,
    fontFamily: 'SatoshiMedium',
    fontSize: 11,
  );
}