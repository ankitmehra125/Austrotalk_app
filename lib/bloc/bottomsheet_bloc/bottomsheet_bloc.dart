import 'package:austrotalk/bloc/bottomsheet_bloc/bottomsheet_event.dart';
import 'package:austrotalk/bloc/bottomsheet_bloc/bottomsheet_state.dart';
import 'package:bloc/bloc.dart';

class BottomsheetBloc extends Bloc<BottomsheetEvent,BottomsheetState>
{
  BottomsheetBloc() : super(BottomsheetState())
  {
    on<ChangeIndex>((event,emit){
      emit(state.selectedContainer(event.index));
    });
  }
}