import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/widgets/CustomRowloginbygmailorapple.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Register%20Views/widget/Logo_and_text_register_page.dart';

class CustomSingleChildScrollViewregister extends StatefulWidget {
  const CustomSingleChildScrollViewregister({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<CustomSingleChildScrollViewregister> createState() =>
      _CustomSingleChildScrollViewregisterState();
}

class _CustomSingleChildScrollViewregisterState
    extends State<CustomSingleChildScrollViewregister> {
  String? fullname;
  String? email;

  String? password;
  String? confirm_password;
  bool obscurePassword = true;
  GlobalKey<FormState> formkey = GlobalKey();
  bool obscureConfirmPassword = true;
  bool isloading = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: widget.height * 0.1),
              Logoandtextregisterpage(width: widget.width),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: widget.height * 0.035),
                    CustomTextField(
                      hintText: 'Full Name',
                      hintcolor: Colors.white,

                      prefixIcon: Icons.person,
                      onchanged: (data) {
                        fullname = data;
                      },
                      valdiate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter  your Full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hintText: 'UserName',
                      hintcolor: Colors.white,

                      prefixIcon: Icons.person,
                      onchanged: (data) {
                        email = data;
                      },
                      valdiate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email like  ......@org.com';
                        }
                        if (!valdiateuser().valdiateemail(email: email)) {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      hintText: 'Password',
                      hintcolor: Colors.white,

                      prefixIcon: Icons.lock,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_rounded,
                      onchanged: (data) {
                        password = data;
                      },
                      onpressed: () {
                        setState(() {
                          obscurePassword:
                          !obscurePassword;
                        });
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
                    const SizedBox(height: 15),

                    CustomTextField(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_rounded,
                      obscureText: obscureConfirmPassword,
                      suffixIcon: Icons.remove_red_eye_rounded,
                      onchanged: (data) {
                        confirm_password = data;
                      },
                      onpressed: () {
                        setState(() {
                          obscureConfirmPassword:
                          !obscureConfirmPassword;
                        });
                      },
                      valdiate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Confirm password';
                        }
                        if (value != password) {
                          return 'Confirm password not match password';
                        }
                        if (!valdiateuser().valdiatepassword(
                          password: password,
                        )) {
                          return 'Please enter a valid password';
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomRowloginbygmailorapple(),
                    const SizedBox(height: 20),
                    CustomRowAccount(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.loginpage);
                      },
                      text: "Sign In",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          if (password == confirm_password &&
                              valdiateuser().valdiateemail(email: email) &&
                              valdiateuser().valdiatepassword(
                                password: password,
                              )) {
                            isloading = true;
                            setState(() {});
                            try {
                              await registeruser();

                              CustomScaffoldMessenger(
                                context,
                                'Created Successfully',
                                Icons.check_circle_outline,
                                Colors.green,
                              );
                              GoRouter.of(context).push(AppRouter.loginpage);
                            } on FirebaseAuthException catch (ex) {
                              print(ex.code);
                              if (ex.code == 'weak-password') {
                                CustomScaffoldMessenger(
                                  context,
                                  'The password is Weak',
                                  FontAwesomeIcons.circleXmark,
                                  Colors.red,
                                );
                              } else if (ex.code == 'email-already-in-use') {
                                CustomScaffoldMessenger(
                                  context,
                                  'email already exists',
                                  FontAwesomeIcons.circleXmark,
                                  Colors.red,
                                );
                              }
                            } catch (ex) {
                              CustomScaffoldMessenger(
                                context,
                                "there was an error",
                                FontAwesomeIcons.circleXmark,
                                Colors.red,
                              );
                            }
                            isloading = false;
                            setState(() {});
                          } else {}
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3b82f6),
                        minimumSize: Size(widget.width * 0.7, 70),
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
        ),
      ),
    );
  }

  Future<void> registeruser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    users.doc(uid).set({
      'Uid': FirebaseAuth.instance.currentUser!.uid,
      'Full name': fullname,
      'email': email,
      'password': password,
      'confirm password': confirm_password,
    });
  }
}
