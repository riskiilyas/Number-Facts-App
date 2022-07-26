import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/models/FactModel.dart';
import 'package:number_facts/screens/FactTypes.dart';
import 'package:number_facts/utilities/ServiceLocator.dart';

///////////////////// EVENT /////////////////////
class FactEvent {}

class FactEventNumber extends FactEvent {
  final FactTypes type;
  final int number;
  FactEventNumber({required this.type, required this.number});
}

class FactEventDate extends FactEvent{
  final int day, month;
  final FactTypes type = FactTypes.date;
  FactEventDate({required this.day, required this.month});
}

class FactEventNeutral extends FactEvent {}

///////////////////// STATE /////////////////////
class FactState {}

class FactStateInitial extends FactState {}

class FactStateLoading extends FactState {}

class FactStateNeutral extends FactState {}

class FactStateError extends FactState {
  FactStateError({required this.message});
  final String message;
}

class FactStateSuccess extends FactState {
  final FactModel model;
  FactStateSuccess({required this.model});
}

///////////////////// BLoC /////////////////////
class FactBloc extends Bloc<FactEvent, FactState> {
  final network = ServiceLocator.getFactNetwork();

  FactBloc(): super(FactStateNeutral()) {
    on<FactEventNumber>((event, emit) async {
        emit(FactStateLoading());
        try {
          final model = await network.getFact(event.number, event.type);
          emit(FactStateSuccess(model: FactModel(model)));
        } on Exception catch (e) {
          emit(FactStateError(message: e.toString()));
        }
    });

    on<FactEventDate> ((event, emit) async {
        emit(FactStateLoading());
        try {
          final model = await network.getFactDate(event.month, event.day);
          emit(FactStateSuccess(model: model));
        } on Exception catch (e) {
          emit(FactStateError(message: e.toString()));
        }
    });

    on<FactEventNeutral> ((event, emit) async {
        emit(FactStateNeutral());
    });
  }
}
