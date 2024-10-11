import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_event.dart';
import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_state.dart';
import 'package:bloc/bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(0)) {
    on<TapEvent>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}
