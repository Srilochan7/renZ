import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: event.email,
           password: event.password,
        );
        emit(AuthSuccess());
      }
      catch(e){
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthSigninRequested>((event, emit) async {
      emit(AuthLoading());
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password);
          emit(AuthSuccess());
      }

      catch(e){
          emit(AuthFailure(e.toString()));
      }
    });


  }
}