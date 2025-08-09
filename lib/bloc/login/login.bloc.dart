import 'package:flutter_application_1/bloc/login/login.event.dart';
import 'package:flutter_application_1/bloc/login/login.state.dart';
import 'package:flutter_application_1/repository/auth.repo.dart';
import 'package:flutter_application_1/utils/global.session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final repository = AuthRepo();
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await repository.login(event.requestBody);
        await GlobalSession().saveSession(result.token.toString());
        emit(LoginSuccess(result));
      } catch (e) {
        emit(LoginFailure("Error $e"));
      }
    });

    on(<Logout>(event, emit) async {
      final globalSession = GlobalSession();

      globalSession.removeAccessToken();
      emit(LogoutSuccess());
    });
  }
}
