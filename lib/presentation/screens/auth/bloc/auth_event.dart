part of 'auth_bloc.dart';

@immutable
abstract interface class AuthEvent {}

class AuthenticatePressed implements AuthEvent {
  AuthenticatePressed();
}
