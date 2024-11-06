import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  final String selectedLanguage;

  const LanguageState({required this.selectedLanguage});

  @override
  List<Object?> get props => [selectedLanguage];
}
