part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


final class AuthLoginRequested extends AuthEvent{
  final String email;
  final String password;

  AuthLoginRequested(this.email, this.password);

}



final class AuthSigninRequested extends AuthEvent{
  final String email;
  final String password;

  AuthSigninRequested(this.email, this.password);

  

}