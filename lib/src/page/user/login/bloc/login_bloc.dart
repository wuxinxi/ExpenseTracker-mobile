import 'package:app_component/app_component.dart';
import 'package:app_network/app_network.dart';
import 'package:expense_tracker/src/page/user/login/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_login);
  }

  _login(LoginEvent event, emit) async {
    final user = await LoginRepository().login(event.userEmail, event.userPassword);
    toast(message: user.msg, success: user.success);
  }
}
