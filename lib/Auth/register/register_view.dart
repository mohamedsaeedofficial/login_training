import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_training/Auth/login/login_view.dart';
import 'package:login_training/Auth/login/widgets/have_account_text.dart';
import 'package:login_training/Auth/login/widgets/sign_up_form.dart';
import 'package:login_training/Auth/login/widgets/social_button.dart';
import 'package:login_training/Auth/login/widgets/welcome_text.dart';
import 'package:login_training/constants.dart';
import 'package:login_training/home_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(
                title: "Create Account",
                text: "Enter your Name, Email and Password \nfor sign up.",
              ),

              // Sign Up Form
              const SignUpForm(),
              const SizedBox(height: 16),

              const HaveAccountText(
                text: 'Already have account? ',
                authText: 'Sign In',
                navigationTO: LoginView(),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "By Signing up you agree to our Terms \nConditions & Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                  child: Text("Or",
                      style: TextStyle(
                          color: const Color(0xFF010F07).withOpacity(0.7)))),
              const SizedBox(height: 16),

              // Facebook
              SocialButton(
                press: () {},
                text: "Connect with Facebook",
                color: const Color(0xFF395998),
                icon: SvgPicture.string(
                  facebookIcon,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF395998),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Google
              SocialButton(
                press: () {
                  signInWithGoogle();
                  navigatotToHome(context);
                },
                text: "Connect with Google",
                color: const Color(0xFF4285F4),
                icon: SvgPicture.string(
                  googleIcon,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
