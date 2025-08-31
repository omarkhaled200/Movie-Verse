import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:movie_verse/Core/utlis/CustomTextField.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/widgets/CustomRowloginbygmailorapple.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Register%20Views/widget/Logo_and_text_register_page.dart';

class CustomSingleChildScrollViewregister extends StatelessWidget {
  const CustomSingleChildScrollViewregister({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.1),
          Logoandtextregisterpage(width: width),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                SizedBox(height: height * 0.04),
                CustomTextField(
                  hintText: 'Full Name',
                  hintcolor: Colors.white,
                  onpressed: () {},
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'UserName',
                  hintcolor: Colors.white,
                  onpressed: () {},
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Password',
                  hintcolor: Colors.white,
                  onpressed: () {},
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icons.remove_red_eye_rounded,
                ),
                const SizedBox(height: 30),
                CustomRowloginbygmailorapple(),
                const SizedBox(height: 30),
                CustomRowAccount(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.loginpage);
                  },
                  text: "Sign In",
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3b82f6),
                    minimumSize: Size(width * 0.7, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
