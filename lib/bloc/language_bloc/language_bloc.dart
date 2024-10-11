import 'package:austrotalk/bloc/language_bloc/language_event.dart';
import 'package:austrotalk/bloc/language_bloc/language_state.dart';
import 'package:bloc/bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent,LanguageState>
{
  LanguageBloc() : super(LanguageState(selectedLanguage: 'ENG')){
    on<ChooseLanguage>((event,emit) {
      emit(LanguageState(selectedLanguage: event.languageCode));
    });
  }
}