import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key, required this.text, required this.authText, required this.navigationTO});
final String text ;
final String authText ;
final Widget navigationTO ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w600),
          text: text,
          children: <TextSpan>[
            TextSpan(
              text: authText,
              style: const TextStyle(color: Color(0xFF22A45D)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return navigationTO;
                    },
                  ));
                },
            )
          ],
        ),
      ),
    );
  }
}