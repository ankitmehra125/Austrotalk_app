import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable
{
  @override
  List<Object> get props => [];
}

class ChooseLanguage extends LanguageEvent {
  final String languageCode;

  ChooseLanguage({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}