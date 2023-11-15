import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_state.dart';

/*
  bloc need two arguments as class one is event and other one is state
 
*/
class SignInBlocs extends Bloc<SignInEvent, SignInState>{
  SignInBlocs() : super(const SignInState()){
    // We trigger an event that pass the mail
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

// Emitter is callable class 
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }
    void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password: event.password));
  }
}