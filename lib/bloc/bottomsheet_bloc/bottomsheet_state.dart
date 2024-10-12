import 'package:equatable/equatable.dart';

class BottomsheetState extends Equatable
{
  final int selectedIndex;
  
  BottomsheetState({this.selectedIndex = -1});
  
  BottomsheetState selectedContainer(int index)
  {
    return BottomsheetState(selectedIndex: index);
  }
  
  @override 
  List<Object> get props => [selectedIndex];
}