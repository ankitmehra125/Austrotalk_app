import 'package:flutter/material.dart';

class Chat {
  final String imageURL; // Store the image URL as a string
  final String name;
  final String type;
  final String languages;
  final int exp;
  final double price;

  Chat({
    required this.imageURL, // Constructor now accepts imageURL
    required this.name,
    required this.type,
    required this.languages,
    required this.exp,
    required this.price,
  });
}
