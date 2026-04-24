import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

enum CTextFieldType { name, email, password, confirmPassword }

class CustomHeaderTextField extends StatefulWidget {
  final bool isPasswordField;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final TextInputAction textInputAction;
  final String title;
  final CTextFieldType fieldType;
  final TextEditingController? firstPassword;
  final bool isSignIn;

  const CustomHeaderTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.autovalidateMode,
    this.isPasswordField = false,
    required this.keyboardType,
    this.textInputAction = TextInputAction.none,
    required this.fieldType,
    required this.title,
    this.firstPassword,
    this.isSignIn = false,
  });

  @override
  State<CustomHeaderTextField> createState() => _CustomHeaderTextFieldState();
}

class _CustomHeaderTextFieldState extends State<CustomHeaderTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(widget.title, style: AppTextStyles.textMdBold),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Color(0x09000000), blurRadius: 8),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextFormField(
                textInputAction: widget.textInputAction,
                controller: widget.controller,
                autovalidateMode: widget.autovalidateMode,
                keyboardType: widget.keyboardType,
                obscureText:
                    widget.fieldType == CTextFieldType.password ||
                        widget.fieldType == CTextFieldType.confirmPassword
                    ? isHidden
                    : false,
                decoration: InputDecoration(
                  suffixIcon:
                      widget.fieldType == CTextFieldType.password ||
                          widget.fieldType == CTextFieldType.confirmPassword
                      ? GestureDetector(
                          onTap: () {
                            isHidden = !isHidden;

                            setState(() {});
                          },
                          child: Icon(
                            isHidden ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.primary.withAlpha(150),
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.onPrimaryDisabled,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.text14Regular.copyWith(
                    color: AppColors.textSecondaryVariant,
                  ),
                  errorStyle: const TextStyle(color: AppColors.darkRed),
                  border: customOutlineBorder(
                    color: AppColors.primary,
                    isFoucsedBorder: false,
                  ),
                  enabledBorder: customOutlineBorder(
                    color: AppColors.primary,
                    isFoucsedBorder: false,
                  ),
                  focusedBorder: customOutlineBorder(
                    color: AppColors.primary,
                    isFoucsedBorder: true,
                  ),
                  errorBorder: customOutlineBorder(
                    color: AppColors.darkRed,
                    isFoucsedBorder: true,
                  ),
                  focusedErrorBorder: customOutlineBorder(
                    color: AppColors.darkRed,
                    isFoucsedBorder: true,
                  ),
                ),

                //* ===== Validator =====
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required!';
                  }
                  switch (widget.fieldType) {
                    case CTextFieldType.name:
                      if (value!.trim().length < 2) {
                        return 'Name must contain at least two characters!';
                      }
                      break;
                    case CTextFieldType.email:
                      if (!EmailValidator.validate(value!.trim()) ||
                          !value.trim().toLowerCase().endsWith('@gmail.com')) {
                        return 'Invalid email format!';
                      }
                      break;
                    case CTextFieldType.password:
                      if (value!.length < 8 && !widget.isSignIn) {
                        return 'The password must be at least 8 characters long!';
                      }
                      break;
                    case CTextFieldType.confirmPassword:
                      if (widget.firstPassword != null) {
                        if (widget.controller.text !=
                            widget.firstPassword!.text) {
                          return "Passwords don't match!";
                        }
                      }
                      break;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder customOutlineBorder({
  required bool isFoucsedBorder,
  required Color color,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: isFoucsedBorder ? color : Colors.transparent),
  );
}
