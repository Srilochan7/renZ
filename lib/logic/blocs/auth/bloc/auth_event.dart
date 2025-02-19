part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


final class AuthLoginRequested extends AuthEvent{

}