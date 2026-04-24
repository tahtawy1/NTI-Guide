import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/widgets/c_snack_bar.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/auth/presentation/views/c_button.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/c_header_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: Material(
              color: AppColors.background,
              child: CustomHeaderTextField(
                hintText: "example@gmail.com",
                controller: emailController,
                autovalidateMode: autovalidateMode,
                keyboardType: TextInputType.emailAddress,
                fieldType: CTextFieldType.email,
                title: 'Email',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  CSnackBar.showSnackBar(
                    context,
                    message: 'Password reset link sent.\nCheck your email.',
                    type: CSnackType.success,
                  );
                  context.pop();
                }
                if (state is ResetPasswordFailure) {
                  CSnackBar.showSnackBar(
                    context,
                    message: state.errMessage,
                    type: CSnackType.error,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(
                        context,
                      ).add(ResetPasswordEvent(email: emailController.text));
                    } else {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                      setState(() {});
                    }
                  },
                  isLoading: state is ResetPasswordLoading,
                  title: 'Reset',
                  height: 45,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
