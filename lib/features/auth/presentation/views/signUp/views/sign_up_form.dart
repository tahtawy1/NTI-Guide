import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/widgets/c_snack_bar.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/auth/presentation/views/c_button.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/c_header_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();

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
              title: 'Name',
              hintText: "Enter your name",
              controller: nameController,
              autovalidateMode: autovalidateMode,
              keyboardType: TextInputType.emailAddress,
              fieldType: CTextFieldType.name,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 8),
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
            ),
          ),

          const SizedBox(height: 12),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                context.go(AppStrings.homeRoute);
              }
              if (state is SignUpFailure) {
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
                        SignUpEvent(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  title: 'Sign up',
                  isLoading: state is SignUpLoading,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
