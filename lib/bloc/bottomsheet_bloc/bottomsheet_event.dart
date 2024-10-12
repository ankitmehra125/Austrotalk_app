import 'package:equatable/equatable.dart';

abstract class BottomsheetEvent extends Equatable
{
  @override
  List<Object> get props => [];
}

class ChangeIndex extends BottomsheetEvent
{
  final int index;

  ChangeIndex(this.index);

  List<Object> get props => [index];
}