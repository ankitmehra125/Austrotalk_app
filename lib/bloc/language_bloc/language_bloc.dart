import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_event.dart'; // Make sure to import your event class
import 'language_state.dart'; // Make sure to import your state class

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(selectedLanguage: 'en')) {
    on<ChooseLanguage>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', event.languageCode); // Save selected language
      emit(LanguageState(selectedLanguage: event.languageCode)); // Emit the new state
    });

    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en'; // Default to English
    // Emit the loaded language state
    add(ChooseLanguage(languageCode: languageCode));
  }
}
