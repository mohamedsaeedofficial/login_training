import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget {
   TextFieldEmail({
    super.key,
    required this.hint,
    this.onChanged
  });

  final String hint;
  void Function(String)? onChanged ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field Required';
        }
        return null;
      },
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF3F2F2)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF3F2F2)),
        ),
      ),
    );
  }
}
