import 'package:equatable/equatable.dart';

class AuthLoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartLoginEvent extends AuthLoginEvents {}

class LoginButtonPressed extends AuthLoginEvents {
  final String email;
  final String password;

  LoginButtonPressed({
    required this.email,
    required this.password,
  });
}

class AuthSignupEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartSignupEvent extends AuthSignupEvents {}

class SignupButtonPressed extends AuthSignupEvents {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignupButtonPressed({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
