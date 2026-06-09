import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_app/core/theme/app_theme.dart';
import 'package:nexus_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nexus_app/features/auth/presentation/widgets/nexus_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
            _usernameController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Authentication failed')),
            );
          } else if (state.status == AuthStatus.success) {
            context.go('/dashboard');
          }
        },
        child: Stack(
          children: [
            // Decorative background (opacity 0.3 blur circles)
            Positioned(
              top: -160,
              right: -160,
              child: Container(
                width: 384,
                height: 384,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.surfaceTint.withOpacity(0.15),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.surfaceTint.withOpacity(0.15),
                      blurRadius: 100,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -160,
              left: -160,
              child: Container(
                width: 384,
                height: 384,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryFixedDim.withOpacity(0.15),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryFixedDim.withOpacity(0.15),
                      blurRadius: 100,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            
            // Main content
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 480),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        // Subtle Top Border Accent
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(height: 4, color: AppTheme.primary),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Header
                              Container(
                                width: 64,
                                height: 64,
                                decoration: const BoxDecoration(
                                  color: AppTheme.surfaceTint,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.data_usage,
                                  color: AppTheme.primaryFixedDim, // on-primary-container approx
                                  size: 36,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'NEXUS',
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.primary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'National Electronic X-sectional User Survey',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xFF3F484C), // on-surface-variant
                                ),
                              ),
                              const SizedBox(height: 32),
                              
                              // Form
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    NexusTextField(
                                      controller: _usernameController,
                                      label: 'Officer ID / Username',
                                      validator: (val) =>
                                          (val == null || val.isEmpty) ? 'Please enter username' : null,
                                    ),
                                    const SizedBox(height: 20),
                                    
                                    BlocBuilder<AuthCubit, AuthState>(
                                      buildWhen: (p, c) => p.obscurePassword != c.obscurePassword,
                                      builder: (context, state) {
                                        return NexusTextField(
                                          controller: _passwordController,
                                          label: 'Password',
                                          obscureText: state.obscurePassword,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              state.obscurePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: const Color(0xFF3F484C),
                                            ),
                                            onPressed: () => context
                                                .read<AuthCubit>()
                                                .togglePasswordVisibility(),
                                          ),
                                          validator: (val) =>
                                              (val == null || val.isEmpty) ? 'Please enter password' : null,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    
                                    // Options Row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BlocBuilder<AuthCubit, AuthState>(
                                          buildWhen: (p, c) => p.rememberMe != c.rememberMe,
                                          builder: (context, state) {
                                            return Row(
                                              children: [
                                                Checkbox(
                                                  value: state.rememberMe,
                                                  onChanged: (val) => context
                                                      .read<AuthCubit>()
                                                      .toggleRememberMe(val),
                                                  activeColor: AppTheme.primary,
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                ),
                                                Text(
                                                  'Remember me',
                                                  style: textTheme.labelMedium?.copyWith(
                                                    color: const Color(0xFF3F484C),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          child: Text(
                                            'Forgot Password?',
                                            style: textTheme.labelMedium?.copyWith(
                                              color: AppTheme.primary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    
                                    // Action Buttons
                                    BlocBuilder<AuthCubit, AuthState>(
                                      builder: (context, state) {
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 48,
                                          child: ElevatedButton.icon(
                                            onPressed: state.status == AuthStatus.loading
                                                ? null
                                                : _onLoginPressed,
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppTheme.primary,
                                              foregroundColor: AppTheme.onPrimary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(24),
                                              ),
                                              elevation: 0,
                                            ),
                                            icon: state.status == AuthStatus.loading
                                                ? const SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const Icon(Icons.login),
                                            label: Text(
                                              state.status == AuthStatus.loading
                                                  ? 'Securing...'
                                                  : 'Secure Login',
                                              style: textTheme.labelLarge?.copyWith(
                                                color: AppTheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    
                                    SizedBox(
                                      width: double.infinity,
                                      height: 48,
                                      child: OutlinedButton.icon(
                                        onPressed: () {
                                          // Offline login action
                                        },
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: const Color(0xFF4C626B), // secondary
                                          side: const BorderSide(color: Color(0xFF4C626B)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                        ),
                                        icon: const Icon(Icons.wifi_off),
                                        label: Text(
                                          'Login Offline',
                                          style: textTheme.labelLarge,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              // Footer
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Color(0xFFD7DAE0)), // surface-dim
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.lock,
                                      size: 16,
                                      color: Color(0xFF6F787D), // outline
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'End-to-End Encrypted System',
                                      style: textTheme.labelMedium?.copyWith(
                                        color: const Color(0xFF6F787D),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
