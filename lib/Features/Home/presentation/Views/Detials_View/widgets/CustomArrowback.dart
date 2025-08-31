import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowback extends StatelessWidget {
  const CustomArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () {
            print("clicked");
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.go("/");
            }
          },
        ),
      ),
    );
  }
}
