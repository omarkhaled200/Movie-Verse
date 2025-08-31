import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/widgets/CustomSingleChildScrollViewlogin.dart';
import 'package:movie_verse/Core/utlis/custom_Container_image.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          customcontainerimage(
            height: height,
            image: AssetImage(Assets.registerimage),
          ),

          Container(color: Colors.black.withOpacity(0.5)),

          CustomSingleChildScrollViewlogin(height: height, width: width),
        ],
      ),
    );
  }
}
