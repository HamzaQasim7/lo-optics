import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/features/auth/domain/entities/user.dart';
import 'package:lo_wearglass/features/auth/domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;

  AuthBloc({required this.login}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await login(LoginParams(
        username: event.username,
        password: event.password,
      ));
      result.fold(
        (failure) => emit(AuthError(message: 'Login failed')),
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });

    on<LogoutRequested>((event, emit) {
      emit(AuthInitial());
    });
  }
}
