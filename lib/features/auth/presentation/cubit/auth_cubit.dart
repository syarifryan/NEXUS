import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void togglePasswordVisibility() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleRememberMe(bool? value) {
    emit(state.copyWith(rememberMe: value ?? false));
  }

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Dummy validation for UI purposes
      if (username.isNotEmpty && password.isNotEmpty) {
        emit(state.copyWith(status: AuthStatus.success));
      } else {
        emit(state.copyWith(
          status: AuthStatus.failure,
          errorMessage: 'Username and password cannot be empty.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
