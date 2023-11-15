import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/app_events.dart';
import 'package:u_learning/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc() : super(InitStates()){
    // emit means do thing 
      on<Increment>((event, ask) => ask(AppState(counter: state.counter+1)),);
      on<Decrement>((event, ask) => ask(AppState(counter: state.counter-1)),);
  }
  
}