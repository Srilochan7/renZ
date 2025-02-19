part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}


final class AuthSuccess extends AuthState{}



final class AuthFailure extends AuthState{}


final class AuthLoading extends AuthState{}
