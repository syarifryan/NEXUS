part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final bool obscurePassword;
  final bool rememberMe;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.obscurePassword = true,
    this.rememberMe = false,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? obscurePassword,
    bool? rememberMe,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      rememberMe: rememberMe ?? this.rememberMe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
