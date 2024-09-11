import 'package:flutter/material.dart';
import 'package:login_training/Auth/login/widgets/forget_password.dart';
import 'package:login_training/Auth/login/widgets/sign_in_button.dart';
import 'package:login_training/Auth/login/widgets/text_field_email.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  String? emailAddress, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldEmail(
            onChanged: (value) {
              emailAddress = value;
            },
            hint: "Email Address",
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Field Required';
              }
              return null;
            },
            obscureText: _obscureText,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              hintText: "Password",
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F2F2)),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F2F2)),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: Color(0xFF868686))
                    : const Icon(Icons.visibility, color: Color(0xFF868686)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          const ForgetPassword(),

          const SizedBox(height: 16),

          SignInButton(
            email: emailAddress,
            password: password,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
