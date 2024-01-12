part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final String userEmail;
  final String userPassword;

  const LoginEvent({required this.userEmail, required this.userPassword});

  @override
  List<Object?> get props => [userEmail, userPassword];
}
