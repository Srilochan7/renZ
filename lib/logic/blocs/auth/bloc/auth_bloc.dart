import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthSigninRequested>(_onSigninRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
  try {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    emit(AuthSuccess(userCredential.user));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      emit(AuthFailure("No user found for that email."));
    } else if (e.code == 'wrong-password') {
      emit(AuthFailure("Wrong password. Try again."));
    } else {
      emit(AuthFailure(e.message ?? "Authentication error."));
    }
  }
  }

  Future<void> _onSigninRequested(AuthSigninRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(  // ✅ This is correct for sign-up
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {  // ✅ Better error handling
      emit(AuthFailure(e.message ?? "Sign-up failed"));
    } catch (e) {
      emit(AuthFailure("An unexpected error occurred"));
    }
  }

  Future<void> _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
  print("Logout event received"); // Debugging
  try {
    await _firebaseAuth.signOut(); // ✅ Corrected sign-out method
    print("User signed out successfully"); // Debugging
    emit(AuthInitial()); // ✅ Move back to unauthenticated state
  } catch (e) {
    print("Logout Error: $e"); // Debugging
  }


}


  Future<void> _onCheckAuthStatus(AuthCheckStatus event, Emitter<AuthState> emit) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthInitial());
    }
  }
}
