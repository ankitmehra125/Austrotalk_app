import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TapEvent extends BottomNavEvent {
  final int index;

  TapEvent(this.index);

  @override
  List<Object> get props => [index];
}
