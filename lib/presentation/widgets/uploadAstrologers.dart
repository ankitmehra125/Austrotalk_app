import 'dart:convert';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadAstrologers() async {
  // Load the JSON file
  final String response = await rootBundle.loadString('assets/astrologers.json');
  final data = await json.decode(response);

  List<dynamic> astrologers = data['astrologers'];

  // Initialize Firestore
  final firestore = FirebaseFirestore.instance;

  // Upload each astrologer to Firestore
  for (var astrologer in astrologers) {
    await firestore.collection('astrologers').add(astrologer);
  }

  print("Astrologers uploaded successfully!");
}
