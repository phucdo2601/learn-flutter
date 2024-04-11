part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {

  AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? user;

  AuthenticationUserChanged(this.user);


}
