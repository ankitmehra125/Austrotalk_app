import 'package:flutter/cupertino.dart';

class Chat
{
  final AssetImage image;
  final String name;
  final String type;
  final String languages;
  final int exp;
  final double price;

  Chat(this.image, {
   required this.name,
   required this.type,
   required this.languages,
   required this.exp,
   required this.price
});
}