import 'package:equatable/equatable.dart';

class AuthLoginState extends Equatable {
  @override
  // ToDo: implement props
  List<Object> get props => [];
}

class LoginInitState extends AuthLoginState {}

class LoginbuttonPressed extends AuthLoginState {}

class LoginLoadingState extends AuthLoginState {}

class UserLoginSuccessState extends AuthLoginState {}

class LoginErrorState extends AuthLoginState {
  late String message;
  LoginErrorState({required this.message});
}

class AuthSignupState extends Equatable {
  @override
  // ToDo: implement props
  List<Object> get props => [];
}

class SignupInitState extends AuthSignupState {}

class SignupbuttonPressed extends AuthSignupState {}

class SignupLoadingState extends AuthSignupState {}

class UserSignupSuccessState extends AuthSignupState {}

class SignupErrorState extends AuthSignupState {
  late String message;
  SignupErrorState({required this.message});
}
