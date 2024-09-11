import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_training/Auth/login/widgets/have_account_text.dart';
import 'package:login_training/Auth/login/widgets/sign_in_form.dart';
import 'package:login_training/Auth/login/widgets/social_button.dart';
import 'package:login_training/Auth/login/widgets/welcome_text.dart';
import 'package:login_training/Auth/register/register_view.dart';
import 'package:login_training/constants.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(
              title: "Welcome to",
              text:
                  "Enter your Phone number or Email \naddress for sign in. Enjoy your food :)",
            ),
            const SignInForm(),
            const SizedBox(height: 16),

            Center(
                child: Text("Or",
                    style: TextStyle(
                        color: const Color(0xFF010F07).withOpacity(0.7)))),
            const SizedBox(height: 16 * 1.5),

            const HaveAccountText(
              text: "Don't have account? ",
              authText: 'Create new account.',
              navigationTO: RegisterView(),
            ),
            const SizedBox(height: 16),

            // Facebook
            SocialButton(
              press: () {
                
              },
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
    );
  }
}
