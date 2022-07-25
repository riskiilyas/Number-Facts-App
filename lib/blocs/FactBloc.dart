import 'package:number_facts/screens/FactTypes.dart';

///////////////////// EVENT /////////////////////
class FactEvent {
  FactEvent({required this.type});
  final FactTypes type;
}

///////////////////// STATE /////////////////////
class FactState {}

class FactStateInitial extends FactState {}

class FactStateLoading extends FactState {}

class FactStateError extends FactState {
  FactStateError({required this.message});
  final String message;
}

class FactStateSuccess extends FactState {

}

///////////////////// BLoC /////////////////////

