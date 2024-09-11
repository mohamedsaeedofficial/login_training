import 'package:flutter/material.dart';
import 'package:login_training/Auth/login/widgets/text_field_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_training/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  String? emailAddress, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFieldEmail(
            hint: "Email Address",
            onChanged: (p0) {
              emailAddress = p0;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            textInputAction: TextInputAction.next,
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

          // Confirm Password Field
          TextFormField(
            onChanged: (value) {
              password = value;
            },
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: "Confirm Password",
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
          // Sign Up Button
          ElevatedButton(
            onPressed: () async {
              try {
                await registerUser(emailAddress!, password!);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  showToast( 'The password provided is too weak.' );
                } else if (e.code == 'email-already-in-use') {
                  showToast(
                    
                    'The account already exists for that email.',
                  );
                }
              } catch (e) {
                showToast( e.toString());
              }

              showToast( 'Sucess');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF22A45D),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}


