import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/widgets/c_snack_bar.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/auth/presentation/views/c_button.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signIn/views/widgets/reset_password_button.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/c_header_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();

    final TextEditingController passwordController = TextEditingController();

    final AutovalidateMode autovalidateMode = AutovalidateMode.onUnfocus;

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomHeaderTextField(
              title: 'Email Address',
              hintText: "Enter your email",
              controller: emailController,
              autovalidateMode: autovalidateMode,
              keyboardType: TextInputType.emailAddress,
              fieldType: CTextFieldType.email,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomHeaderTextField(
              title: 'Password',
              hintText: "Enter your password",
              controller: passwordController,
              autovalidateMode: autovalidateMode,
              keyboardType: TextInputType.visiblePassword,
              fieldType: CTextFieldType.password,
              textInputAction: TextInputAction.done,
              isSignIn: true,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ResetPasswordButton(),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                context.go(AppStrings.homeRoute);
              }
              if (state is SignInFailure) {
                CSnackBar.showSnackBar(
                  context,
                  message: state.errMessage,
                  type: CSnackType.error,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  title: 'Sign In',
                  isLoading: state is SignInLoading,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
