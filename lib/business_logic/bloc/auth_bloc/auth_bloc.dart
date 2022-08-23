import 'package:la_vie/data/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvents, AuthLoginState> {
  AuthLoginRepository repository;
  AuthLoginBloc(AuthLoginState initialState, this.repository)
      : super(initialState);
  @override
  Stream<AuthLoginState> mapEventToState(AuthLoginEvents event) async* {
    var pref = await SharedPreferences.getInstance();
    if (event is StartLoginEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      var dataLogin = await repository.login(event.email, event.password);
      if (dataLogin['type'] == 'Success') {
        pref.setString('accessToken', dataLogin['data']['accessToken']);
        pref.setString('refreshToken', dataLogin['data']['refreshToken']);
        yield UserLoginSuccessState();
      } else {
        yield LoginErrorState(message: 'auth Error');
      }
    }
  }
}

class AuthSignupBloc extends Bloc<AuthSignupEvents, AuthSignupState> {
  AuthSignupRepository repository;
  AuthSignupBloc(AuthSignupState initialState, this.repository)
      : super(initialState);
  @override
  Stream<AuthSignupState> mapEventToState(AuthSignupEvents event) async* {
    var pref = await SharedPreferences.getInstance();
    if (event is StartSignupEvent) {
      yield SignupInitState();
    } else if (event is SignupButtonPressed) {
      yield SignupLoadingState();
      var dataSignup = await repository.signup(
          event.firstName, event.lastName, event.email, event.password);
      if (dataSignup['type'] == 'Success') {
        pref.setString('accessToken', dataSignup['data']['accessToken']);
        pref.setString('refreshToken', dataSignup['data']['refreshToken']);
        pref.get('accessToken');

        yield UserSignupSuccessState();
      } else {
        yield SignupErrorState(message: 'auth Error');
      }
    }
  }
}
