import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_training/constants.dart';

class SignInButton extends StatelessWidget {
  SignInButton(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.email,
      required this.password})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            await loginUser(email!, password!) ;
            // ignore: use_build_context_synchronously
            navigatotToHome(context);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showToast('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              showToast('Wrong password provided for that user.');
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF22A45D),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text("Sign in"),
    );
  }
}
