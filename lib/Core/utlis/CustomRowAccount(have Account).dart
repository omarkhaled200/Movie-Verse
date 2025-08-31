import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRowAccount extends StatelessWidget {
  const CustomRowAccount({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have Account?",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Color(0xff3b82f6), fontSize: 18),
          ),
        ),
      ],
    );
  }
}
