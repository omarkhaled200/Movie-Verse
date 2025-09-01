import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:movie_verse/Core/utlis/CustomTextField.dart';
import 'package:movie_verse/Core/utlis/Functions/Show_snackbar.dart';
import 'package:movie_verse/Core/utlis/Functions/Valdiation.dart';
import 'package:movie_verse/Core/utlis/Valdiater.dart' hide valdiate;
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/widgets/CustomRowloginbygmailorapple.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/widgets/Logo_and_text_login_page.dart';

class CustomSingleChildScrollViewlogin extends StatefulWidget {
  const CustomSingleChildScrollViewlogin({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<CustomSingleChildScrollViewlogin> createState() =>
      _CustomSingleChildScrollViewloginState();
}

class _CustomSingleChildScrollViewloginState
    extends State<CustomSingleChildScrollViewlogin> {
  String? email;

  String? password;
  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isloading,
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: widget.height * 0.1),
              Logoandtextloginpage(width: widget.width),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(height: widget.height * 0.08),
                    CustomTextField(
                      hintText: 'User Name',
                      hintcolor: Colors.white,
                      onchanged: (data) {
                        email = data;
                      },
                      prefixIcon: Icons.person,
                      valdiate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email like  ......@org.com';
                        }
                        if (!valdiateuser().valdiateemail(email: email)) {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      hintText: 'Password',
                      hintcolor: Colors.white,

                      prefixIcon: Icons.lock,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_rounded,
                      onchanged: (data) {
                        password = data;
                      },
                      valdiate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please  Enter your password';
                        }
                        if (!valdiateuser().valdiatepassword(
                          password: password,
                        )) {
                          return 'It must contain at least one uppercase letter (e.g., A, B, C...)\nIt must contain at least one lowercase letter (e.g., a, b, c...) \nIt must contain at least one number (e.g., 0, 1, 2...).\nIt must contain at least one special character (e.g., !, @, #, &, *, ~).\nIt must be at least 8 characters long';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomRowloginbygmailorapple(),
                    const SizedBox(height: 30),
                    CustomRowAccount(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.registerpage);
                      },
                      text: "Sign Up",
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await loginuser();
                            if (valdiateuser().valdiateemail(email: email) &&
                                valdiateuser().valdiatepassword(
                                  password: password,
                                )) {
                              GoRouter.of(context).go(AppRouter.homeview);

                              CustomScaffoldMessenger(
                                context,
                                'Login successfully',
                                Icons.check_circle_outline,
                                Colors.green,
                              );
                            }
                          } on FirebaseAuthException catch (ex) {
                            // التحقق من أنواع الأخطاء
                            if (ex.code == 'user-not-found') {
                              CustomScaffoldMessenger(
                                context,
                                'No user found for that email',
                                FontAwesomeIcons.circleXmark,
                                Colors.red,
                              );
                            } else if (ex.code == 'wrong-password') {
                              CustomScaffoldMessenger(
                                context,
                                'Wrong password provided for that user.',
                                FontAwesomeIcons.circleXmark,
                                Colors.red,
                              );
                            } else {
                              // عرض الخطأ في حالة عدم وجود أخطاء محددة

                              CustomScaffoldMessenger(
                                context,
                                "Firebase Error: ${ex.message}",
                                FontAwesomeIcons.circleXmark,
                                Colors.red,
                              );
                            }
                          } catch (ex) {
                            // عرض رسالة الخطأ العامة في حالة حدوث أي استثناء آخر
                            print('the error is :$ex');

                            CustomScaffoldMessenger(
                              context,
                              "There was an error: $ex",
                              FontAwesomeIcons.circleXmark,
                              Colors.red,
                            );
                          }

                          isloading = false;
                          setState(() {});
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3b82f6),
                        minimumSize: Size(widget.width * 0.7, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        "Login",
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
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential User = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
