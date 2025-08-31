import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Core/utlis/custom_Container_image.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Register%20Views/widget/CustomSingleChildScrollViewregister.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
            image: AssetImage(Assets.loginimage),
          ),

          Container(color: Colors.black.withOpacity(0.5)),
          CustomSingleChildScrollViewregister(height: height, width: width),
        ],
      ),
    );
  }
}
